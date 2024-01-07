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
 


#ifndef FS_AURAS_H
#define FS_AURAS_H

struct Aura
{
	Aura(uint8_t id, uint16_t clientId, std::string name, int32_t speed, bool premium) :
		name(std::move(name)), speed(speed), clientId(clientId), id(id), premium(premium) {}

	std::string name;
	int32_t speed;
	uint16_t clientId;
	uint8_t id;
	bool premium;
};

class Auras
{
	public:
		bool reload();
		bool loadFromXml();
		Aura* getAuraByID(uint8_t id);
		Aura* getAuraByName(const std::string& name);
		Aura* getAuraByClientID(uint16_t clientId);

		const std::vector<Aura>& getAuras() const {
			return auras;
		}

	private:
		std::vector<Aura> auras;
};

#endif
