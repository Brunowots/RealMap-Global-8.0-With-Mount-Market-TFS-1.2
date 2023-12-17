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

#ifndef FS_PROTOCOLSPECTATOR_H_67DF1C70909A3D52458F250DF5CE2492
#define FS_PROTOCOLSPECTATOR_H_67DF1C70909A3D52458F250DF5CE2492

class ProtocolGame;
class ProtocolSpectator;
class Player;
typedef std::shared_ptr<ProtocolSpectator> ProtocolSpectator_ptr;

class ProtocolSpectator final : public Protocol
{
public:
	static const char* protocol_name() {
		return "spectator protocol";
	}

	ProtocolSpectator(Connection_ptr connection);
	void onLiveCastStop(Player* player);

	ProtocolSpectator_ptr getThis() {
		return std::static_pointer_cast<ProtocolSpectator>(shared_from_this());
	}

	void _disconnect() { disconnect(); }
};

#endif
