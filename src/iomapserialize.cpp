/**
 * The Forgotten Server D - a free and open-source MMORPG server emulator
 * Copyright (C) 2017  Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "otpch.h"

#include "iomapserialize.h"
#include "game.h"
#include "bed.h"

#include <fmt/format.h>

extern Game g_game;

void IOMapSerialize::loadHouseItems(Map* map) {
	int64_t start = OTSYS_TIME();

	DBResult_ptr result = Database::getInstance().storeQuery("SELECT `data`, `abilities` FROM `tile_store`");

	if (!result) {
		return;
	}

	do {
		unsigned long attrSize, abilitySize;
		const char* attr = result->getStream("data", attrSize);
		const char* abil = result->getStream("abilities", abilitySize);

		PropStream propStream, abilPropStream;
		propStream.init(attr, attrSize);
		abilPropStream.init(abil, abilitySize);

		uint16_t x, y;
		uint8_t z;

		if (propStream.read<uint16_t>(x) && propStream.read<uint16_t>(y) && propStream.read<uint8_t>(z)) {
			Tile* tile = map->getTile(x, y, z);

			if (tile) {
				uint32_t item_count;
				if (propStream.read<uint32_t>(item_count)) {
					while (item_count--) {
						loadItem(propStream, abilPropStream, tile);
					}
				}
			}
		}
	} while (result->next());

	std::cout << "> Loaded house items in: " << (OTSYS_TIME() - start) / (1000.) << " s" << std::endl;
}

bool IOMapSerialize::saveHouseItems() {
	int64_t start = OTSYS_TIME();
	Database& db = Database::getInstance();
	std::ostringstream query;

	// Start the transaction
	DBTransaction transaction;
	if (!transaction.begin()) {
		return false;
	}

	// Clear old tile data
	if (!db.executeQuery("DELETE FROM `tile_store`")) {
		return false;
	}

	DBInsert stmt("INSERT INTO `tile_store` (`house_id`, `data`, `abilities`) VALUES ");

	for (const auto& it : g_game.map.houses.getHouses()) {
		House* house = it.second;
		for (HouseTile* tile : house->getTiles()) {
			PropWriteStream stream;
			PropWriteStream abilStream;
			saveTile(stream, abilStream, tile);

			size_t attributesSize;
			const char* attributes = stream.getStream(attributesSize);
			size_t abilitiesSize;
			const char* abilities = abilStream.getStream(abilitiesSize);

			if (attributesSize > 0 || abilitiesSize > 0) {
				query << house->getId() << ',' << (attributesSize > 0 ? db.escapeBlob(attributes, attributesSize) : "NULL") << ','
					<< (abilitiesSize > 0 ? db.escapeBlob(abilities, abilitiesSize) : "NULL");
				if (!stmt.addRow(query)) {
					return false;
				}
			}
		}
	}

	if (!stmt.execute()) {
		return false;
	}

	// End the transaction
	bool success = transaction.commit();
	std::cout << "> Saved house items in: " << (OTSYS_TIME() - start) / (1000.) << " s" << std::endl;
	return success;
}

bool IOMapSerialize::loadContainer(PropStream& propStream, PropStream& abilPropStream, Container* container) {
    while (container->serializationCount > 0) {
        if (!loadItem(propStream, abilPropStream, container)) {
            std::cout << "[Warning - IOMapSerialize::loadContainer] Unserialization error for container item: " << container->getID() << std::endl;
            return false;
        }
        container->serializationCount--;
    }

    uint8_t endAttr;
    if (!propStream.read<uint8_t>(endAttr) || endAttr != 0) {
        std::cout << "[Warning - IOMapSerialize::loadContainer] Unserialization error for container item: " << container->getID() << std::endl;
        return false;
    }

    return true;
}

bool IOMapSerialize::loadItem(PropStream& propStream, PropStream& abilPropStream, Cylinder* parent) {
	uint16_t id;
	if (!propStream.read<uint16_t>(id)) {
		return false;
	}

	Tile* tile = nullptr;
	if (parent->getParent() == nullptr) {
		tile = parent->getTile();
	}

	const ItemType& iType = Item::items[id];
	if (iType.moveable || iType.forceSerialize || !tile) {
		// Crear un nuevo item
		Item* item = Item::CreateItem(id);
		if (item) {
			item->unserializeAbility(abilPropStream);
			if (item->unserializeAttr(propStream)) {
				Container* container = item->getContainer();
				if (container && !loadContainer(propStream, abilPropStream, container)) {
					delete item;
					return false;
				}

				parent->internalAddThing(item);
				item->startDecaying();
			}
			else {
				std::cout << "WARNING: Error al deserializar en IOMapSerialize::loadItem()" << id << std::endl;
				delete item;
				return false;
			}
		}
	}
	else {
		// Elementos estacionarios como puertas, camas, pizarrones, libreros, etc.
		Item* item = nullptr;
		if (const TileItemVector* items = tile->getItemList()) {
			for (Item* findItem : *items) {
				if (findItem->getID() == id) {
					item = findItem;
					break;
				}
				else if (iType.isDoor() && findItem->getDoor()) {
					item = findItem;
					break;
				}
				else if (iType.isBed() && findItem->getBed()) {
					item = findItem;
					break;
				}
			}
		}

		if (item) {
			item->unserializeAbility(abilPropStream);
			if (item->unserializeAttr(propStream)) {
				Container* container = item->getContainer();
				if (container && !loadContainer(propStream, abilPropStream, container)) {
					return false;
				}

				g_game.transformItem(item, id);
			}
			else {
				std::cout << "WARNING: Error al deserializar en IOMapSerialize::loadItem()" << id << std::endl;
			}
		}
		else {
			// El mapa cambió desde la última guardada, solo leer los atributos
			std::unique_ptr<Item> dummy(Item::CreateItem(id));
			if (dummy) {
				dummy->unserializeAttr(propStream);
				dummy->unserializeAbility(abilPropStream);
				Container* container = dummy->getContainer();
				if (container) {
					if (!loadContainer(propStream, abilPropStream, container)) {
						return false;
					}
				}
				else if (BedItem* bedItem = dynamic_cast<BedItem*>(dummy.get())) {
					uint32_t sleeperGUID = bedItem->getSleeper();
					if (sleeperGUID != 0) {
						g_game.removeBedSleeper(sleeperGUID);
					}
				}
			}
		}
	}
	return true;
}

void IOMapSerialize::saveItem(PropWriteStream& stream, PropWriteStream& abilStream, const Item* item) {
	const Container* container = item->getContainer();

	// Escribir ID y atributos
	stream.write<uint16_t>(item->getID());
	item->serializeAttr(stream);
	item->serializeAbility(abilStream);

	if (container) {
		// Hack para acceder a los atributos
		stream.write<uint8_t>(ATTR_CONTAINER_ITEMS);
		stream.write<uint32_t>(container->size());
		for (auto it = container->getReversedItems(), end = container->getReversedEnd(); it != end; ++it) {
			saveItem(stream, abilStream, *it);
		}
	}

	stream.write<uint8_t>(0x00);
	abilStream.write<uint8_t>(0x00);
}

void IOMapSerialize::saveTile(PropWriteStream& stream, PropWriteStream& abilStream, const Tile* tile) {
	const TileItemVector* tileItems = tile->getItemList();
	if (!tileItems) {
		return;
	}

	std::forward_list<Item*> items;
	uint16_t count = 0;
	for (Item* item : *tileItems) {
		const ItemType& it = Item::items[item->getID()];
		if (!(it.moveable || it.forceSerialize || item->getDoor() || (item->getContainer() && !item->getContainer()->empty()) || it.canWriteText || item->getBed())) {
			continue;
		}
		items.push_front(item);
		++count;
	}

	if (!items.empty()) {
		const Position& tilePosition = tile->getPosition();
		stream.write<uint16_t>(tilePosition.x);
		stream.write<uint16_t>(tilePosition.y);
		stream.write<uint8_t>(tilePosition.z);

		stream.write<uint32_t>(count);
		for (const Item* item : items) {
			saveItem(stream, abilStream, item);
		}
	}
}

bool IOMapSerialize::loadHouseInfo() {
	Database& db = Database::getInstance();

	DBResult_ptr result = db.storeQuery("SELECT `id`, `owner`, `paid`, `warnings` FROM `houses`");
	if (!result) {
		return false;
	}

	do {
		House* house = g_game.map.houses.getHouse(result->getNumber<uint32_t>("id"));
		if (house) {
			house->setOwner(result->getNumber<uint32_t>("owner"), false);
			house->setPaidUntil(result->getNumber<time_t>("paid"));
			house->setPayRentWarnings(result->getNumber<uint32_t>("warnings"));
		}
	} while (result->next());

	result = db.storeQuery("SELECT `house_id`, `listid`, `list` FROM `house_lists`");
	if (result) {
		do {
			House* house = g_game.map.houses.getHouse(result->getNumber<uint32_t>("house_id"));
			if (house) {
				house->setAccessList(result->getNumber<uint32_t>("listid"), result->getString("list"));
			}
		} while (result->next());
	}

	return true;
}

bool IOMapSerialize::saveHouseInfo() {
	Database& db = Database::getInstance();

	DBTransaction transaction;
	if (!transaction.begin()) {
		return false;
	}

	if (!db.executeQuery("DELETE FROM `house_lists`")) {
		return false;
	}

	std::ostringstream query;
	for (const auto& it : g_game.map.houses.getHouses()) {
		House* house = it.second;
		query << "SELECT `id` FROM `houses` WHERE `id` = " << house->getId();
		DBResult_ptr result = db.storeQuery(query.str());
		if (result) {
			query.str(std::string());
			query << "UPDATE `houses` SET `owner` = " << house->getOwner() << ", `paid` = " << house->getPaidUntil() << ", `warnings` = " << house->getPayRentWarnings() << ", `name` = " << db.escapeString(house->getName()) << ", `town_id` = " << house->getTownId() << ", `rent` = " << house->getRent() << ", `size` = " << house->getTiles().size() << ", `beds` = " << house->getBedCount() << " WHERE `id` = " << house->getId();
		}
		else {
			query.str(std::string());
			query << "INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`, `name`, `town_id`, `rent`, `size`, `beds`) VALUES (" << house->getId() << ',' << house->getOwner() << ',' << house->getPaidUntil() << ',' << house->getPayRentWarnings() << ',' << db.escapeString(house->getName()) << ',' << house->getTownId() << ',' << house->getRent() << ',' << house->getTiles().size() << ',' << house->getBedCount() << ')';
		}

		db.executeQuery(query.str());
		query.str(std::string());
	}

	DBInsert stmt("INSERT INTO `house_lists` (`house_id`, `listid`, `list`) VALUES ");

	for (const auto& it : g_game.map.houses.getHouses()) {
		House* house = it.second;

		std::string listText;
		if (house->getAccessList(GUEST_LIST, listText) && !listText.empty()) {
			query << house->getId() << ',' << GUEST_LIST << ',' << db.escapeString(listText);
			if (!stmt.addRow(query)) {
				return false;
			}

			listText.clear();
		}

		if (house->getAccessList(SUBOWNER_LIST, listText) && !listText.empty()) {
			query << house->getId() << ',' << SUBOWNER_LIST << ',' << db.escapeString(listText);
			if (!stmt.addRow(query)) {
				return false;
			}

			listText.clear();
		}

		for (Door* door : house->getDoors()) {
			if (door->getAccessList(listText) && !listText.empty()) {
				query << house->getId() << ',' << door->getDoorId() << ',' << db.escapeString(listText);
				if (!stmt.addRow(query)) {
					return false;
				}

				listText.clear();
			}
		}
	}

	if (!stmt.execute()) {
		return false;
	}

	return transaction.commit();
}

bool IOMapSerialize::saveHouse(House* house) {

	Database& db = Database::getInstance();
	std::ostringstream query;

	DBTransaction transaction;
	if (!transaction.begin()) {
		return false;
	}

	uint32_t houseId = house->getId();

	// Limpiar los datos antiguos del almacén de casas
	if (!db.executeQuery(fmt::format("DELETE FROM `tile_store` WHERE `house_id` = {:d}", houseId))) {
		return false;
	}

	DBInsert stmt("INSERT INTO `tile_store` (`house_id`, `data`, `abilities`) VALUES ");

	PropWriteStream stream;
	PropWriteStream abilStream;
	for (HouseTile* tile : house->getTiles()) {
		// Guardar el almacén del suelo
		saveTile(stream, abilStream, tile);

		size_t attributesSize;
		const char* attributes = stream.getStream(attributesSize);
		size_t abilitiesSize;
		const char* abilities = abilStream.getStream(abilitiesSize);

		if (attributesSize > 0 || abilitiesSize > 0) {
			query << house->getId() << ',' << (attributesSize > 0 ? db.escapeBlob(attributes, attributesSize) : "NULL") << ',' << (abilitiesSize > 0 ? db.escapeBlob(abilities, abilitiesSize) : "NULL");
			if (!stmt.addRow(query)) {
				return false;
			}
		}
		stream.clear();
		abilStream.clear();
	}

	if (!stmt.execute()) {
		return false;
	}

	return transaction.commit();
}
