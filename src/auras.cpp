/**
 * The Last Realm Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2023  Mark Samman <mark.samman@gmail.com>
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

#include "auras.h"

#include "pugicast.h"
#include "tools.h"

bool Auras::reload()
{
	auras.clear();
	return loadFromXml();
}

bool Auras::loadFromXml()
{
	pugi::xml_document doc;
	pugi::xml_parse_result result = doc.load_file("data/XML/auras.xml");
	if (!result) {
		printXMLError("Error - Auras::loadFromXml", "data/XML/auras.xml", result);
		return false;
	}

	for (auto auraNode : doc.child("auras").children()) {
		auras.emplace_back(
			static_cast<uint8_t>(pugi::cast<uint16_t>(auraNode.attribute("id").value())),
			pugi::cast<uint16_t>(auraNode.attribute("clientid").value()),
			auraNode.attribute("name").as_string(),
			pugi::cast<int32_t>(auraNode.attribute("speed").value()),
			auraNode.attribute("premium").as_bool()
		);
	}
	auras.shrink_to_fit();
	return true;
}

Aura* Auras::getAuraByID(uint8_t id)
{
	auto it = std::find_if(auras.begin(), auras.end(), [id](const Aura& aura) {
		return aura.id == id;
	});

	return it != auras.end() ? &*it : nullptr;
}

Aura* Auras::getAuraByName(const std::string& name) {
	auto auraName = name.c_str();
	for (auto& it : auras) {
		if (strcasecmp(auraName, it.name.c_str()) == 0) {
			return &it;
		}
	}

	return nullptr;
}

Aura* Auras::getAuraByClientID(uint16_t clientId)
{
	auto it = std::find_if(auras.begin(), auras.end(), [clientId](const Aura& aura) {
		return aura.clientId == clientId;
	});

	return it != auras.end() ? &*it : nullptr;
}
