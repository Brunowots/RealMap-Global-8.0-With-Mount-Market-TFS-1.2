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

#include "shaders.h"

#include "pugicast.h"
#include "tools.h"

bool Shaders::reload()
{
	shaders.clear();
	return loadFromXml();
}

bool Shaders::loadFromXml()
{
	pugi::xml_document doc;
	pugi::xml_parse_result result = doc.load_file("data/XML/shaders.xml");
	if (!result) {
		printXMLError("Error - Shaders::loadFromXml", "data/XML/shaders.xml", result);
		return false;
	}

	for (auto shaderNode : doc.child("shaders").children()) {
		shaders.emplace_back(
			static_cast<uint8_t>(pugi::cast<uint16_t>(shaderNode.attribute("id").value())),
			shaderNode.attribute("name").as_string(),
			shaderNode.attribute("premium").as_bool()
		);
	}
	shaders.shrink_to_fit();
	return true;
}

Shader* Shaders::getShaderByID(uint8_t id)
{
	auto it = std::find_if(shaders.begin(), shaders.end(), [id](const Shader& shader) {
		return shader.id == id;
		});

	return it != shaders.end() ? &*it : nullptr;
}

Shader* Shaders::getShaderByName(const std::string& name) {
	auto shaderName = name.c_str();
	for (auto& it : shaders) {
		if (strcasecmp(shaderName, it.name.c_str()) == 0) {
			return &it;
		}
	}

	return nullptr;
}

