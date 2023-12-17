/**
 * The Forgotten Server D - a free and open-source MMORPG server emulator
 * Copyright (C) 2019  Mark Samman <mark.samman@gmail.com>
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

#ifndef __VIEWER__
#define __VIEWER__

#include "enums.h"

#include "protocolgame.h"

#include "scheduler.h"

class Creature;
class Player;
class House;
class Container;
class Tile;
class Quest;

using SpectatorList = std::map < ProtocolGame_ptr, std::pair < std::string, uint32_t >>;
using DataList = std::map < std::string, uint32_t >;

class Viewer {
public:
    Viewer(ProtocolGame_ptr client) : owner(client) {
        id = 0;
        broadcast = false;
        broadcast_time = 0;
        liverecord = 0;
        description = "";
    }
    virtual~Viewer() {}

    void clear(bool full) {
        for (const auto& it : spectators) {
			if (!it.first->twatchername.empty()) {
				it.first->parseTelescopeBack(true);
				continue;
			}

            it.first->disconnect();
        }

        spectators.clear();
        mutes.clear();
        removeCaster();

        id = 0;
        if (!full)
            return;

        bans.clear();
        password = "";
        broadcast = false;
        broadcast_time = 0;
        liverecord = 0;
    }

    bool check(const std::string& _password);
    void handle(ProtocolGame_ptr client,
        const std::string& text, uint16_t channelId);
    void chat(uint16_t channelId);

    uint32_t getCastViewerCount() {
        return spectators.size();
    }

    StringVector list() {
        StringVector list_;
        for (const auto& it : spectators) {
			if (it.first && it.first->spy) {
				continue;
			}
            list_.push_back(it.second.first);
        }
        return list_;
    }

    void kick(StringVector list);
    StringVector muteList() {
        return mutes;
    }
    void mute(StringVector _mutes) {
        mutes = _mutes;
    }
    DataList banList() {
        return bans;
    }
    void ban(StringVector _bans);

    bool banned(uint32_t ip) const {
        for (const auto& it : bans) {
            if (it.second == ip) {
                return true;
            }
        }

        return false;
    }

    ProtocolGame_ptr getOwner() const {
        return owner;
    }
    void setOwner(ProtocolGame_ptr client) {
        owner = client;
    }
    void resetOwner() {
        owner.reset();
    }

    std::string getPassword() const {
        return password;
    }
    void setPassword(const std::string& value) {
        password = value;
    }

    bool isBroadcasting() const {
        return broadcast;
    }
    void setBroadcast(bool value) {
        broadcast = value;
    }

    std::string getBroadCastTimeString() const {
        std::stringstream broadcast;
        int64_t seconds = getBroadcastTime() / 1000;

        uint16_t hour = floor(seconds / 60 / 60 % 24);
        uint16_t minute = floor(seconds / 60 % 60);
        uint16_t second = floor(seconds % 60);

        if (hour > 0) {
            broadcast << hour << " hours, ";
        }
        if (minute > 0) {
            broadcast << minute << " minutes and ";
        }
        broadcast << second << " seconds.";
        return broadcast.str();
    }

    void addSpectator(ProtocolGame_ptr client, std::string name = "", bool spy = false);
    void removeSpectator(ProtocolGame_ptr client, bool spy = false);

    int64_t getBroadcastTime() const {
        return OTSYS_TIME() - broadcast_time;
    }
    void setBroadcastTime(int64_t time) {
        broadcast_time = time;
    }

    std::string getDescription() const {
        return description;
    }
    void setDescription(const std::string& desc) {
        description = desc;
    }

    uint32_t getSpectatorId(ProtocolGame_ptr client) const {
        auto it = spectators.find(client);
        if (it != spectators.end()) {
            return it->second.second;
        }
        return 0;
    }

    // inherited
    void insertCaster() {
        if (owner) {
            owner->insertCaster();
        }
    }

    void removeCaster() {
        if (owner) {
            owner->removeCaster();
        }
    }

    bool canSee(const Position& pos) const {
        if (owner) {
            return owner->canSee(pos);
        }

        return false;
    }

    uint32_t getIP() const {
        if (owner) {
            return owner->getIP();
        }

        return 0;
    }
	void sendStats() {
        if (owner) {
            owner->sendStats();

            for (const auto& it : spectators)
                it.first->sendStats();
        }
    }
    void sendPing() {
        if (owner) {
            owner->sendPing();

            for (const auto& it : spectators)
                it.first->sendPing();
        }
    }
    void logout(bool displayEffect, bool forceLogout) {
        if (owner) {
            owner->logout(displayEffect, forceLogout);
        }
    }
    void sendAddContainerItem(uint8_t cid,
        const Item* item) {
        if (owner) {
            owner->sendAddContainerItem(cid, item);

            for (const auto& it : spectators)
                it.first->sendAddContainerItem(cid, item);
        }
    }
    void sendUpdateContainerItem(uint8_t cid, uint16_t slot,
        const Item* item) {
        if (owner) {
            owner->sendUpdateContainerItem(cid, slot, item);

            for (const auto& it : spectators)
                it.first->sendUpdateContainerItem(cid, slot, item);
        }
    }
    void sendRemoveContainerItem(uint8_t cid, uint16_t slot) {
        if (owner) {
            owner->sendRemoveContainerItem(cid, slot);

            for (const auto& it : spectators)
                it.first->sendRemoveContainerItem(cid, slot);
        }
    }
    void sendUpdatedVIPStatus(uint32_t guid, bool online) {
        if (owner) {
            owner->sendUpdatedVIPStatus(guid, online);

            for (const auto& it : spectators)
                it.first->sendUpdatedVIPStatus(guid, online);
        }
    }
    void sendVIP(uint32_t guid,
        const std::string& name, bool online) {
        if (owner) {
            owner->sendVIP(guid, name, online);

            for (const auto& it : spectators)
                it.first->sendVIP(guid, name, online);
        }
    }
    void sendClosePrivate(uint16_t channelId) {
        if (owner) {
            owner->sendClosePrivate(channelId);
        }
    }
    void sendFYIBox(const std::string& message) {
        if (owner) {
            owner->sendFYIBox(message);
        }
    }

    uint32_t getVersion() const {
        if (owner) {
            return owner->getVersion();
        }

        return 0;
    }

    void disconnect() {
        if (owner) {
            owner->disconnect();
        }
    }

    void sendCreatureSkull(const Creature* creature) const {
        if (owner) {
            owner->sendCreatureSkull(creature);

            for (const auto& it : spectators)
                it.first->sendCreatureSkull(creature);
        }
    }

    void sendAddTileItem(const Position& pos, uint32_t stackpos,
        const Item* item) {
        if (owner) {
            owner->sendAddTileItem(pos, stackpos, item);

            for (const auto& it : spectators)
                it.first->sendAddTileItem(pos, stackpos, item);
        }
    }

    void sendUpdateTileItem(const Position& pos, uint32_t stackpos,
        const Item* item) {
        if (owner) {
            owner->sendUpdateTileItem(pos, stackpos, item);

            for (const auto& it : spectators)
                it.first->sendUpdateTileItem(pos, stackpos, item);
        }
    }

    void sendRemoveTileThing(const Position& pos, int32_t stackpos) {
        if (owner) {
            owner->sendRemoveTileThing(pos, stackpos);

            for (const auto& it : spectators)
                it.first->sendRemoveTileThing(pos, stackpos);
        }
    }

    void sendUpdateTile(const Tile* tile,
        const Position& pos) {
        if (owner) {
            owner->sendUpdateTile(tile, pos);

            for (const auto& it : spectators)
                it.first->sendUpdateTile(tile, pos);
        }
    }

    void sendChannelMessage(const std::string& author,
        const std::string& text, SpeakClasses type, uint16_t channel) {
        if (owner) {
            owner->sendChannelMessage(author, text, type, channel);

            for (const auto& it : spectators)
                it.first->sendChannelMessage(author, text, type, channel);
        }
    }
    void sendMoveCreature(const Creature* creature,
        const Position& newPos, int32_t newStackPos,
        const Position& oldPos, int32_t oldStackPos, bool teleport) {
        if (owner) {
            owner->sendMoveCreature(creature, newPos, newStackPos, oldPos, oldStackPos, teleport);

            for (const auto& it : spectators)
                it.first->sendMoveCreature(creature, newPos, newStackPos, oldPos, oldStackPos, teleport);
        }
    }
    void sendCreatureTurn(const Creature* creature, int32_t stackpos) {
        if (owner) {
            owner->sendCreatureTurn(creature, stackpos);

            for (const auto& it : spectators)
                it.first->sendCreatureTurn(creature, stackpos);
        }
    }
    void sendCreatureSay(const Creature* creature, SpeakClasses type,
        const std::string& text,
        const Position* pos = nullptr);
    void sendPrivateMessage(const Player* speaker, SpeakClasses type,
        const std::string& text) {
        if (owner) {
            owner->sendPrivateMessage(speaker, type, text);
        }
    }
	void sendCreatureSquare(const Creature* creature, SquareColor_t color) {
		if (owner) {
			owner->sendCreatureSquare(creature, color);

			for (const auto& it : spectators)
				it.first->sendCreatureSquare(creature, color);
		}
	}
    void sendCreatureOutfit(const Creature* creature,
        const Outfit_t& outfit) {
        if (owner) {
            owner->sendCreatureOutfit(creature, outfit);

            for (const auto& it : spectators)
                it.first->sendCreatureOutfit(creature, outfit);
        }
    }
    void sendCreatureLight(const Creature* creature) {
        if (owner) {
            owner->sendCreatureLight(creature);

            for (const auto& it : spectators)
                it.first->sendCreatureLight(creature);
        }
    }
    void sendCreatureWalkthrough(const Creature* creature, bool walkthrough) {
        if (owner) {
            owner->sendCreatureWalkthrough(creature, walkthrough);

            for (const auto& it : spectators)
                it.first->sendCreatureWalkthrough(creature, walkthrough);
        }
    }
    void sendCreatureShield(const Creature* creature) {
        if (owner) {
            owner->sendCreatureShield(creature);

            for (const auto& it : spectators)
                it.first->sendCreatureShield(creature);
        }
    }
    void sendAnimatedText(const std::string& message, const Position& pos, TextColor_t color) {
        if (owner) {
            owner->sendAnimatedText(message, pos, color);

            for (const auto& it : spectators)
                it.first->sendAnimatedText(message, pos, color);
        }
    }
    void sendContainer(uint8_t cid,
        const Container* container, bool hasParent, uint16_t firstIndex) {
        if (owner) {
            owner->sendContainer(cid, container, hasParent, firstIndex);

            for (const auto& it : spectators)
                it.first->sendContainer(cid, container, hasParent, firstIndex);
        }
    }
    void sendInventoryItem(slots_t slot,
        const Item* item) {
        if (owner) {
            owner->sendInventoryItem(slot, item);

            for (const auto& it : spectators)
                it.first->sendInventoryItem(slot, item);
        }
    }
    void sendCancelMessage(const std::string& msg) const {
        if (owner) {
            owner->sendTextMessage(TextMessage(MESSAGE_STATUS_SMALL, msg));

            for (const auto& it : spectators)
                it.first->sendTextMessage(TextMessage(MESSAGE_STATUS_SMALL, msg));
        }
    }
    void sendCancelTarget() const {
        if (owner) {
            owner->sendCancelTarget();

            for (const auto& it : spectators)
                it.first->sendCancelTarget();
        }
    }
    void sendCancelWalk() const {
        if (owner) {
            owner->sendCancelWalk();

            for (const auto& it : spectators)
                it.first->sendCancelWalk();
        }
    }
    void sendChangeSpeed(const Creature* creature, uint32_t newSpeed) const {
        if (owner) {
            owner->sendChangeSpeed(creature, newSpeed);

            for (const auto& it : spectators)
                it.first->sendChangeSpeed(creature, newSpeed);
        }
    }
    void sendCreatureHealth(const Creature* creature) const {
        if (owner) {
            owner->sendCreatureHealth(creature);

            for (const auto& it : spectators)
                it.first->sendCreatureHealth(creature);
        }
    }
    void sendDistanceShoot(const Position& from,
        const Position& to, unsigned char type) const {
        if (owner) {
            owner->sendDistanceShoot(from, to, type);

            for (const auto& it : spectators)
                it.first->sendDistanceShoot(from, to, type);
        }
    }
    void sendCreatePrivateChannel(uint16_t channelId,
        const std::string& channelName) {
        if (owner) {
            owner->sendCreatePrivateChannel(channelId, channelName);
        }
    }
    void sendIcons(uint16_t icons) const {
        if (owner) {
            owner->sendIcons(icons);

            for (const auto& it : spectators)
                it.first->sendIcons(icons);
        }
    }
    void sendMagicEffect(const Position& pos, uint8_t type) const {
        if (owner) {
            owner->sendMagicEffect(pos, type);

            for (const auto& it : spectators)
                it.first->sendMagicEffect(pos, type);
        }
    }
    void sendSkills() const {
        if (owner) {
            owner->sendSkills();

            for (const auto& it : spectators)
                it.first->sendSkills();
        }
    }
    void sendTextMessage(MessageClasses mclass,
        const std::string& message) {
        if (owner) {
            owner->sendTextMessage(TextMessage(mclass, message));

            for (const auto& it : spectators)
                it.first->sendTextMessage(TextMessage(mclass, message));
        }
    }
    void sendTextMessage(const TextMessage& message) const {
        if (owner) {
            owner->sendTextMessage(message);

            for (const auto& it : spectators)
                it.first->sendTextMessage(message);
        }
    }
    void sendReLoginWindow() {
        if (owner) {
            owner->sendReLoginWindow();
            clear(true);
        }
    }
    void sendTextWindow(uint32_t windowTextId, Item* item, uint16_t maxlen, bool canWrite) const {
        if (owner) {
            owner->sendTextWindow(windowTextId, item, maxlen, canWrite);
        }
    }
    void sendTextWindow(uint32_t windowTextId, uint32_t itemId,
        const std::string& text) const {
        if (owner) {
            owner->sendTextWindow(windowTextId, itemId, text);
        }
    }
    void sendToChannel(const Creature* creature, SpeakClasses type,
        const std::string& text, uint16_t channelId);
		
    void sendShop(ShopInfoList shopItemList) const {
        if (owner) {
            owner->sendShop(shopItemList);
        }
    }
	
    void sendSaleItemList(const std::list < ShopInfo >& shop) const {
        if (owner) {
            owner->sendSaleItemList(shop);
        }
    }
    void sendCloseShop() const {
        if (owner) {
            owner->sendCloseShop();
        }
    }
	 void sendMarketEnter() const {
        if (owner) {
            owner->sendMarketEnter();
        }
    }
	void sendMarketLeave() const {
        if (owner) {
            owner->sendMarketLeave();
        }
    }
    void sendTradeItemRequest(const std::string& traderName,
        const Item* item, bool ack) const {
        if (owner) {
            owner->sendTradeItemRequest(traderName, item, ack);
        }
    }
    void sendTradeClose() const {
        if (owner) {
            owner->sendCloseTrade();
        }
    }
    void sendWorldLight(const LightInfo& lightInfo) {
        if (owner) {
            owner->sendWorldLight(lightInfo);

            for (const auto& it : spectators)
                it.first->sendWorldLight(lightInfo);
        }
    }
    void sendChannelsDialog() {
        if (owner) {
            owner->sendChannelsDialog();
        }
    }
    void sendOpenPrivateChannel(const std::string& receiver) {
        if (owner) {
            owner->sendOpenPrivateChannel(receiver);
        }
    }
    void sendOutfitWindow() {
        if (owner) {
            owner->sendOutfitWindow();
        }
    }
	void sendDllCheck() {
        if (owner) {
            owner->sendDllCheck();
        }
    }
	
	void sendOutfitWindowOTC() {
			if (owner) {
				owner->sendOutfitWindowOTC();
			}
		}
    void sendCloseContainer(uint8_t cid) {
        if (owner) {
            owner->sendCloseContainer(cid);

            for (const auto& it : spectators)
                it.first->sendCloseContainer(cid);;
        }
    }
    void sendChannel(uint16_t channelId,
        const std::string& channelName) {
        if (owner) {
            owner->sendChannel(channelId, channelName);
        }
    }
    void sendTutorial(uint8_t tutorialId) {
        if (owner) {
            owner->sendTutorial(tutorialId);
        }
    }
    void sendAddMarker(const Position& pos, uint8_t markType,
        const std::string& desc) {
        if (owner) {
            owner->sendAddMarker(pos, markType, desc);
        }
    }
    void sendFightModes() {
        if (owner) {
            owner->sendFightModes();
        }
    }
    void writeToOutputBuffer(const NetworkMessage& message) {
        if (owner) {
            owner->writeToOutputBuffer(message);
        }
    }
    void sendAddCreature(const Creature* creature,
        const Position& pos, int32_t stackpos, bool isLogin) {
        if (owner) {
            owner->sendAddCreature(creature, pos, stackpos, isLogin);

            for (const auto& it : spectators)
                it.first->sendAddCreature(creature, pos, stackpos, isLogin);
        }
    }
    void sendHouseWindow(uint32_t windowTextId,
        const std::string& text) {
        if (owner) {
            owner->sendHouseWindow(windowTextId, text);
        }
    }

	void telescopeGo(uint16_t guid, bool spy)
	{
		if (owner) {
			owner->telescopeGo(guid, spy);
		}
	}

    void sendCloseTrade() const {
        if (owner) {
            owner->sendCloseTrade();
        }
    }

    void sendUpdateTileCreature(const Position& pos, int32_t stackpos,
        const Creature* creature) {
        if (owner) {
            owner->sendUpdateTileCreature(pos, stackpos, creature);
            for (const auto& it : spectators)
                it.first->sendUpdateTileCreature(pos, stackpos, creature);
        }
    }
	
	void sendRemoveTileCreature(const Creature* creature,
        const Position& pos, int32_t stackpos) {
        if (owner) {
            owner->sendRemoveTileCreature(creature, pos, stackpos);
            for (const auto& it : spectators)
                it.first->sendRemoveTileCreature(creature, pos, stackpos);
        }
    }

    void sendQuestLog() {
        if (owner) {
            owner->sendQuestLog();
            for (const auto& it : spectators)
                it.first->sendQuestLog();
        }
    }
    void sendQuestLine(const Quest* quest) {
        if (owner) {
            owner->sendQuestLine(quest);
            for (const auto& it : spectators)
                it.first->sendQuestLine(quest);
        }
    }
	void sendMarketBrowseItem(uint16_t itemId, const MarketOfferList& buyOffers, const MarketOfferList& sellOffers) {
        if (owner) {
            owner->sendMarketBrowseItem(itemId, buyOffers, sellOffers);
        }
    }
	
	void sendMarketBrowseOwnOffers(const MarketOfferList& buyOffers, const MarketOfferList& sellOffers) {
        if (owner) {
            owner->sendMarketBrowseOwnOffers(buyOffers, sellOffers);
        }
    }
	
	void sendMarketBrowseOwnHistory(const HistoryMarketOfferList& buyOffers, const HistoryMarketOfferList& sellOffers) {
        if (owner) {
            owner->sendMarketBrowseOwnHistory(buyOffers, sellOffers);
        }
    }
	
    void sendMarketDetail(uint16_t itemId) {
        if (owner) {
            owner->sendMarketDetail(itemId);
        }
    }
	
	void sendMarketAcceptOffer(const MarketOfferEx& offer) {
        if (owner) {
            owner->sendMarketAcceptOffer(offer);
        }
    }
	void sendMarketCancelOffer(const MarketOfferEx& offer) {
        if (owner) {
            owner->sendMarketCancelOffer(offer);
        }
    }
	
	void sendCastList() {
		if (owner) {
			owner->sendCastList();
		}
	}

private:
    friend class Player;

    SpectatorList spectators;
    StringVector mutes;
    DataList bans;
    Map map;

    ProtocolGame_ptr owner;
    uint32_t id;
    std::string password;
    std::string description;
    bool broadcast;
    int64_t broadcast_time;
    uint16_t liverecord;

};
#endif
