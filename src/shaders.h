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


#ifndef FS_SHADERS_H
#define FS_SHADERS_H

struct Shader
{
	Shader(uint8_t id, std::string name, bool premium) :
		name(std::move(name)), id(id), premium(premium) {}

	uint8_t id;
	std::string name;
	bool premium;
};

class Shaders
{
	public:
		bool reload();
		bool loadFromXml();
		Shader* getShaderByID(uint8_t id);
		Shader* getShaderByName(const std::string& name);

		const std::vector<Shader>& getShaders() const {
			return shaders;
		}

	private:
		std::vector<Shader> shaders;
};

#endif
