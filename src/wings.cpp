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

#include "wings.h"

#include "pugicast.h"
#include "tools.h"

bool Wings::reload()
{
	wings.clear();
	return loadFromXml();
}

bool Wings::loadFromXml()
{
	pugi::xml_document doc;
	pugi::xml_parse_result result = doc.load_file("data/XML/wings.xml");
	if (!result) {
		printXMLError("Error - Wings::loadFromXml", "data/XML/wings.xml", result);
		return false;
	}

	for (auto wingNode : doc.child("wings").children()) {
		wings.emplace_back(
			static_cast<uint8_t>(pugi::cast<uint16_t>(wingNode.attribute("id").value())),
			pugi::cast<uint16_t>(wingNode.attribute("clientid").value()),
			wingNode.attribute("name").as_string(),
			pugi::cast<int32_t>(wingNode.attribute("speed").value()),
			wingNode.attribute("premium").as_bool()
		);
	}
	wings.shrink_to_fit();
	return true;
}

Wing* Wings::getWingByID(uint8_t id)
{
	auto it = std::find_if(wings.begin(), wings.end(), [id](const Wing& wing) {
		return wing.id == id;
	});

	return it != wings.end() ? &*it : nullptr;
}

Wing* Wings::getWingByName(const std::string& name) {
	auto wingName = name.c_str();
	for (auto& it : wings) {
		if (strcasecmp(wingName, it.name.c_str()) == 0) {
			return &it;
		}
	}

	return nullptr;
}

Wing* Wings::getWingByClientID(uint16_t clientId)
{
	auto it = std::find_if(wings.begin(), wings.end(), [clientId](const Wing& wing) {
		return wing.clientId == clientId;
	});

	return it != wings.end() ? &*it : nullptr;
}
