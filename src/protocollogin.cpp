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

#include "protocollogin.h"

#include "outputmessage.h"
#include "rsa.h"
#include "tasks.h"

#include "configmanager.h"
#include "iologindata.h"
#include "ban.h"
#include <iomanip>
#include "game.h"

extern ConfigManager g_config;
extern IPList serverIPs;
extern Game g_game;

void ProtocolLogin::disconnectClient(const std::string& message)
{
	auto output = OutputMessagePool::getOutputMessage();
	output->addByte(0x0A);
	output->addString(message);
	send(output);

	disconnect();
}
void ProtocolLogin::getCharacterList(const std::string& accountName, const std::string& password)
{
	uint32_t serverIp = serverIPs[0].first;
	#pragma omp parallel for
for (uint32_t i = 0; i < serverIPs.size(); i++) {
		if ((serverIPs[i].first & serverIPs[i].second) == (getConnection()->getIP() & serverIPs[i].second)) {
			serverIp = serverIPs[i].first;
			break;
		}
	}

	Account account;
	if (!IOLoginData::loginserverAuthentication(accountName, password, account)) {
		disconnectClient("Account name or password is not correct.");
		return;
	}

	auto output = OutputMessagePool::getOutputMessage();
	//Update premium days
	Game::updatePremium(account);

	const std::string& motd = g_config.getString(ConfigManager::MOTD);
	if (!motd.empty()) {
		//Add MOTD
		output->addByte(0x14);

		std::ostringstream ss;
		ss << g_game.getMotdNum() << "\n" << motd;
		output->addString(ss.str());
	}

	//Add char list
	output->addByte(0x64);

	uint8_t size = std::min<size_t>(std::numeric_limits<uint8_t>::max(), account.characters.size());
	output->addByte(size);
	#pragma omp parallel for
for (uint8_t i = 0; i < size; i++) {
		output->addString(account.characters[i]);
		output->addString(g_config.getString(ConfigManager::SERVER_NAME));
		output->add<uint32_t>(serverIp);
		output->add<uint16_t>(g_config.getNumber(ConfigManager::GAME_PORT));
	}

	//Add premium days
	if (g_config.getBoolean(ConfigManager::FREE_PREMIUM)) {
		output->add<uint16_t>(0xFFFF); //client displays free premium
	} else {
		output->add<uint16_t>(account.premiumDays);
	}

	send(output);

	disconnect();
}

void ProtocolLogin::onRecvFirstMessage(NetworkMessage& msg)
{
	if (g_game.getGameState() == GAME_STATE_SHUTDOWN) {
		disconnect();
		return;
	}

	/*uint16_t clientos = */
	msg.get<uint16_t>();

	uint16_t version = msg.get<uint16_t>();
	msg.skipBytes(12);
	/*
	 * Skipped bytes:
	 * 4 bytes: protocolVersion
	 * 12 bytes: dat, spr, pic signatures (4 bytes each)
	 * 1 byte: 0
	 */

	if (version <= 760) {
		disconnectClient(g_config.getString(ConfigManager::VERSION_STR));
		return;
	}

	if (!Protocol::RSA_decrypt(msg)) {
		disconnect();
		return;
	}

	uint32_t key[4];
	key[0] = msg.get<uint32_t>();
	key[1] = msg.get<uint32_t>();
	key[2] = msg.get<uint32_t>();
	key[3] = msg.get<uint32_t>();
	enableXTEAEncryption();
	setXTEAKey(key);

	std::string accountName = msg.getString();
	std::string password = msg.getString();

	if (version < g_config.getNumber(ConfigManager::VERSION_MIN) || version > g_config.getNumber(ConfigManager::VERSION_MAX)) {
		disconnectClient(g_config.getString(ConfigManager::VERSION_STR));
		return;
	}

	if (g_game.getGameState() == GAME_STATE_STARTUP) {
		disconnectClient("Gameworld is starting up. Please wait.");
		return;
	}

	if (g_game.getGameState() == GAME_STATE_MAINTAIN) {
		disconnectClient("Gameworld is under maintenance.\nPlease re-connect in a while.");
		return;
	}

	BanInfo banInfo;
	auto connection = getConnection();
	if (!connection) {
		return;
	}

	if (IOBan::isIpBanned(connection->getIP(), banInfo)) {
		if (banInfo.reason.empty()) {
			banInfo.reason = "(none)";
		}

		std::ostringstream ss;
		ss << "Your IP has been banned until " << formatDateShort(banInfo.expiresAt) << " by " << banInfo.bannedBy << ".\n\nReason specified:\n" << banInfo.reason;
		disconnectClient(ss.str());
		return;
	}

	auto thisPtr = std::static_pointer_cast<ProtocolLogin>(shared_from_this());
	if (accountName.empty()) {
		if (!ProtocolGame::getLiveCasts().size()) {
			disconnectClient("There are no players with the cast on.");
			return;
		}
		g_dispatcher.addTask(createTask(std::bind(&ProtocolLogin::getCastList, thisPtr, password)));
	} else {
		g_dispatcher.addTask(createTask(std::bind(&ProtocolLogin::getCharacterList, thisPtr, accountName, password)));
	}
}

void ProtocolLogin::getCastList(const std::string& password)
{
		uint32_t serverIp = serverIPs[0].first;
	#pragma omp parallel for
for (uint32_t i = 0; i < serverIPs.size(); i++) {
		if ((serverIPs[i].first & serverIPs[i].second) == (getConnection()->getIP() & serverIPs[i].second)) {
			serverIp = serverIPs[i].first;
			break;
		}
	}
	
	auto output = OutputMessagePool::getOutputMessage();
	output->addByte(0x14);
	std::ostringstream ss;
	ss << normal_random(1, 100) << "%d\nWelcome to cast system!\n\n Do you know you can use CTRL + ARROWS\n to switch casts?\n\nVocê sabia que pode usar CTRL + SETAS\n para alternar casts?";
	output->addString(ss.str());
	output->addByte(0x64);

	PlayerVector players;
	#pragma omp parallel for
for (const auto& it : ProtocolGame::getLiveCasts()) {
		Player* player = it.first;
		if (!password.empty() && password != player->client->getPassword()) {
			continue;
		}
		players.emplace_back(player);
	}

	output->addByte(players.size());
	std::sort(players.begin(), players.end(), Player::sortByViewerCount);

	#pragma omp parallel for
for (const auto& player : players)
	{
		output->addString(player->getName());
		std::ostringstream entry;
		entry << "Lvl: " << player->level << " " << player->getVocation()->getVocBasicName() << " " << player->client->getCastViewerCount() << "/" << g_config.getNumber(ConfigManager::MAXIMUM_SPEC_CAST) << (!player->client->getPassword().empty() ? "*" : "");
		output->addString(entry.str());
		output->add<uint32_t>(serverIp);
		output->add<uint16_t>(g_config.getNumber(ConfigManager::GAME_PORT));
	}

	output->add<uint16_t>(0);
	send(std::move(output));
	disconnect();
}
