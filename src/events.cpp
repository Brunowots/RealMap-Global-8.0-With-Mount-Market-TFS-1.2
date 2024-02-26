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

#include "events.h"
#include "tools.h"
#include "item.h"
#include "player.h"

#include <set>

Events::Events() :
	scriptInterface("Event Interface")
{
	scriptInterface.initState();
}

bool Events::load()
{
	pugi::xml_document doc;
	pugi::xml_parse_result result = doc.load_file("data/events/events.xml");
	if (!result) {
		printXMLError("Error - Events::load", "data/events/events.xml", result);
		return false;
	}

	info = {};

	std::set<std::string> classes;
	#pragma omp parallel for
for (auto eventNode : doc.child("events").children()) {
		if (!eventNode.attribute("enabled").as_bool()) {
			continue;
		}

		const std::string& className = eventNode.attribute("class").as_string();
		auto res = classes.insert(className);
		if (res.second) {
			const std::string& lowercase = asLowerCaseString(className);
			if (scriptInterface.loadFile("data/events/scripts/" + lowercase + ".lua") != 0) {
				std::cout << "[Warning - Events::load] Can not load script: " << lowercase << ".lua" << std::endl;
				std::cout << scriptInterface.getLastLuaError() << std::endl;
			}
		}

		const std::string& methodName = eventNode.attribute("method").as_string();
		const int32_t event = scriptInterface.getMetaEvent(className, methodName);
		if (className == "Creature") {
			if (methodName == "onChangeOutfit") {
				info.creatureOnChangeOutfit = event;
			} else if (methodName == "onAreaCombat") {
				info.creatureOnAreaCombat = event;
			} else if (methodName == "onTargetCombat") {
				info.creatureOnTargetCombat = event;
			} else if (methodName == "onDrainHealth") {
				info.creatureOnDrainHealth = event;
			} else {
				std::cout << "[Warning - Events::load] Unknown creature method: " << methodName << std::endl;
			}
		} else if (className == "Party") {
			if (methodName == "onJoin") {
				info.partyOnJoin = event;
			} else if (methodName == "onLeave") {
				info.partyOnLeave = event;
			} else if (methodName == "onDisband") {
				info.partyOnDisband = event;
			} else {
				std::cout << "[Warning - Events::load] Unknown party method: " << methodName << std::endl;
			}
		} else if (className == "Player") {
			if (methodName == "onLook") {
				info.playerOnLook = event;
			} else if (methodName == "onLookInBattleList") {
				info.playerOnLookInBattleList = event;
			} else if (methodName == "onLookInTrade") {
				info.playerOnLookInTrade = event;
			} else if (methodName == "onLookInShop") {
				info.playerOnLookInShop = event;
			} else if (methodName == "onTradeRequest") {
				info.playerOnTradeRequest = event;
			} else if (methodName == "onTradeAccept") {
				info.playerOnTradeAccept = event;
			} else if (methodName == "onMoveItem") {
				info.playerOnMoveItem = event;
			} else if (methodName == "onMoveCreature") {
				info.playerOnMoveCreature = event;
			} else if (methodName == "onReport") {
				info.playerOnReport = event;
			} else if (methodName == "onTurn") {
				info.playerOnTurn = event;
			} else if (methodName == "onGainExperience") {
				info.playerOnGainExperience = event;
			} else if (methodName == "onLoseExperience") {
				info.playerOnLoseExperience = event;
			} else if (methodName == "onGainSkillTries") {
				info.playerOnGainSkillTries = event;
			} else if (methodName == "onInventoryUpdate") {
				info.playerOnInventoryUpdate = event;
			} else if (methodName == "onUseWeapon") {
				info.playerOnUseWeapon = event;
			} else if (methodName == "onCombatSpell") {
				info.playerOnCombatSpell = event;
			} else {
				std::cout << "[Warning - Events::load] Unknown player method: " << methodName << std::endl;
			}
		} else if (className == "Monster") {
			if (methodName == "onSpawn") {
				info.monsterOnSpawn = event;
			} else {
				std::cout << "[Warning - Events::load] Unknown monster method: " << methodName << std::endl;
			}
		} else {
			std::cout << "[Warning - Events::load] Unknown class: " << className << std::endl;
		}
	}
	return true;
}

// Creature
bool Events::eventCreatureOnChangeOutfit(Creature* creature, const Outfit_t& outfit)
{
	// Creature:onChangeOutfit(outfit) or Creature.onChangeOutfit(self, outfit)
	if (info.creatureOnChangeOutfit == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventCreatureOnChangeOutfit] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.creatureOnChangeOutfit, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.creatureOnChangeOutfit);

	LuaScriptInterface::pushUserdata<Creature>(L, creature);
	LuaScriptInterface::setCreatureMetatable(L, -1, creature);

	LuaScriptInterface::pushOutfit(L, outfit);

	return scriptInterface.callFunction(2);
}

ReturnValue Events::eventCreatureOnAreaCombat(Creature* creature, Tile* tile, bool aggressive)
{
	// Creature:onAreaCombat(tile, aggressive) or Creature.onAreaCombat(self, tile, aggressive)
	if (info.creatureOnAreaCombat == -1) {
		return RETURNVALUE_NOERROR;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventCreatureOnAreaCombat] Call stack overflow" << std::endl;
		return RETURNVALUE_NOTPOSSIBLE;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.creatureOnAreaCombat, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.creatureOnAreaCombat);

	if (creature) {
		LuaScriptInterface::pushUserdata<Creature>(L, creature);
		LuaScriptInterface::setCreatureMetatable(L, -1, creature);
	} else {
		lua_pushnil(L);
	}

	LuaScriptInterface::pushUserdata<Tile>(L, tile);
	LuaScriptInterface::setMetatable(L, -1, "Tile");

	LuaScriptInterface::pushBoolean(L, aggressive);

	ReturnValue returnValue;
	if (scriptInterface.protectedCall(L, 3, 1) != 0) {
		returnValue = RETURNVALUE_NOTPOSSIBLE;
		LuaScriptInterface::reportError(nullptr, LuaScriptInterface::popString(L));
	} else {
		returnValue = LuaScriptInterface::getNumber<ReturnValue>(L, -1);
		lua_pop(L, 1);
	}

	scriptInterface.resetScriptEnv();
	return returnValue;
}

ReturnValue Events::eventCreatureOnTargetCombat(Creature* creature, Creature* target)
{
	// Creature:onTargetCombat(target) or Creature.onTargetCombat(self, target)
	if (info.creatureOnTargetCombat == -1) {
		return RETURNVALUE_NOERROR;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventCreatureOnTargetCombat] Call stack overflow" << std::endl;
		return RETURNVALUE_NOTPOSSIBLE;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.creatureOnTargetCombat, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.creatureOnTargetCombat);

	if (creature) {
		LuaScriptInterface::pushUserdata<Creature>(L, creature);
		LuaScriptInterface::setCreatureMetatable(L, -1, creature);
	} else {
		lua_pushnil(L);
	}

	LuaScriptInterface::pushUserdata<Creature>(L, target);
	LuaScriptInterface::setCreatureMetatable(L, -1, target);

	ReturnValue returnValue;
	if (scriptInterface.protectedCall(L, 2, 1) != 0) {
		returnValue = RETURNVALUE_NOTPOSSIBLE;
		LuaScriptInterface::reportError(nullptr, LuaScriptInterface::popString(L));
	} else {
		returnValue = LuaScriptInterface::getNumber<ReturnValue>(L, -1);
		lua_pop(L, 1);
	}

	scriptInterface.resetScriptEnv();
	return returnValue;
}

void Events::eventCreatureOnDrainHealth(Creature* creature, Creature* attacker, CombatType_t& typePrimary, int32_t& damagePrimary, CombatType_t& typeSecondary, int32_t& damageSecondary, TextColor_t& colorPrimary, TextColor_t& colorSecondary) {
	if (info.creatureOnDrainHealth == -1) {
		return;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventCreatureOnDrainHealth] Creature " << creature->getName() << " attacker " << attacker->getName() << " - Call stack overflow. Too many lua script calls being nested." << std::endl;
		return;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.creatureOnDrainHealth, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.creatureOnDrainHealth);

	if (creature) {
		LuaScriptInterface::pushUserdata<Creature>(L, creature);
		LuaScriptInterface::setCreatureMetatable(L, -1, creature);
	}
	else {
		lua_pushnil(L);
	}

	if (attacker) {
		LuaScriptInterface::pushUserdata<Creature>(L, attacker);
		LuaScriptInterface::setCreatureMetatable(L, -1, attacker);
	}
	else {
		lua_pushnil(L);
	}

	lua_pushnumber(L, typePrimary);
	lua_pushnumber(L, damagePrimary);
	lua_pushnumber(L, typeSecondary);
	lua_pushnumber(L, damageSecondary);
	lua_pushnumber(L, colorPrimary);
	lua_pushnumber(L, colorSecondary);

	if (scriptInterface.protectedCall(L, 8, 6) != 0) {
		LuaScriptInterface::reportError(nullptr, LuaScriptInterface::popString(L));
	}
	else {
		typePrimary = LuaScriptInterface::getNumber<CombatType_t>(L, -6);
		damagePrimary = LuaScriptInterface::getNumber<int32_t>(L, -5);
		typeSecondary = LuaScriptInterface::getNumber<CombatType_t>(L, -4);
		damageSecondary = LuaScriptInterface::getNumber<int32_t>(L, -3);
		colorPrimary = LuaScriptInterface::getNumber<TextColor_t>(L, -2);
		colorSecondary = LuaScriptInterface::getNumber<TextColor_t>(L, -1);
		lua_pop(L, 6);
	}

	scriptInterface.resetScriptEnv();
}

// Party
bool Events::eventPartyOnJoin(Party* party, Player* player) 
{
	// Party:onJoin(player) or Party.onJoin(self, player)
	if (info.partyOnJoin == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPartyOnJoin] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.partyOnJoin, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.partyOnJoin);

	LuaScriptInterface::pushUserdata<Party>(L, party);
	LuaScriptInterface::setMetatable(L, -1, "Party");

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	return scriptInterface.callFunction(2);
}

bool Events::eventPartyOnLeave(Party* party, Player* player)
{
	// Party:onLeave(player) or Party.onLeave(self, player)
	if (info.partyOnLeave == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPartyOnLeave] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.partyOnLeave, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.partyOnLeave);

	LuaScriptInterface::pushUserdata<Party>(L, party);
	LuaScriptInterface::setMetatable(L, -1, "Party");

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	return scriptInterface.callFunction(2);
}

bool Events::eventPartyOnDisband(Party* party)
{
	// Party:onDisband() or Party.onDisband(self)
	if (info.partyOnDisband == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPartyOnDisband] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.partyOnDisband, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.partyOnDisband);

	LuaScriptInterface::pushUserdata<Party>(L, party);
	LuaScriptInterface::setMetatable(L, -1, "Party");

	return scriptInterface.callFunction(1);
}

// Player
void Events::eventPlayerOnLook(Player* player, const Position& position, Thing* thing, uint8_t stackpos, int32_t lookDistance)
{
	// Player:onLook(thing, position, distance) or Player.onLook(self, thing, position, distance)
	if (info.playerOnLook == -1) {
		return;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnLook] Call stack overflow" << std::endl;
		return;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnLook, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnLook);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	if (Creature* creature = thing->getCreature()) {
		LuaScriptInterface::pushUserdata<Creature>(L, creature);
		LuaScriptInterface::setCreatureMetatable(L, -1, creature);
	} else if (Item* item = thing->getItem()) {
		LuaScriptInterface::pushUserdata<Item>(L, item);
		LuaScriptInterface::setItemMetatable(L, -1, item);
	} else {
		lua_pushnil(L);
	}

	LuaScriptInterface::pushPosition(L, position, stackpos);
	lua_pushnumber(L, lookDistance);

	scriptInterface.callVoidFunction(4);
}

void Events::eventPlayerOnLookInBattleList(Player* player, Creature* creature, int32_t lookDistance)
{
	// Player:onLookInBattleList(creature, position, distance) or Player.onLookInBattleList(self, creature, position, distance)
	if (info.playerOnLookInBattleList == -1) {
		return;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnLookInBattleList] Call stack overflow" << std::endl;
		return;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnLookInBattleList, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnLookInBattleList);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<Creature>(L, creature);
	LuaScriptInterface::setCreatureMetatable(L, -1, creature);

	lua_pushnumber(L, lookDistance);

	scriptInterface.callVoidFunction(3);
}

void Events::eventPlayerOnLookInTrade(Player* player, Player* partner, Item* item, int32_t lookDistance)
{
	// Player:onLookInTrade(partner, item, distance) or Player.onLookInTrade(self, partner, item, distance)
	if (info.playerOnLookInTrade == -1) {
		return;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnLookInTrade] Call stack overflow" << std::endl;
		return;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnLookInTrade, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnLookInTrade);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<Player>(L, partner);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<Item>(L, item);
	LuaScriptInterface::setItemMetatable(L, -1, item);

	lua_pushnumber(L, lookDistance);

	scriptInterface.callVoidFunction(4);
}

bool Events::eventPlayerOnLookInShop(Player* player, const ItemType* itemType, uint8_t count)
{
	// Player:onLookInShop(itemType, count) or Player.onLookInShop(self, itemType, count)
	if (info.playerOnLookInShop == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnLookInShop] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnLookInShop, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnLookInShop);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<const ItemType>(L, itemType);
	LuaScriptInterface::setMetatable(L, -1, "ItemType");

	lua_pushnumber(L, count);

	return scriptInterface.callFunction(3);
}

bool Events::eventPlayerOnMoveItem(Player* player, Item* item, uint16_t count, const Position& fromPosition, const Position& toPosition, Cylinder* fromCylinder, Cylinder* toCylinder)
{
	// Player:onMoveItem(item, count, fromPosition, toPosition) or Player.onMoveItem(self, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
	if (info.playerOnMoveItem == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnMoveItem] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnMoveItem, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnMoveItem);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<Item>(L, item);
	LuaScriptInterface::setItemMetatable(L, -1, item);

	lua_pushnumber(L, count);
	LuaScriptInterface::pushPosition(L, fromPosition);
	LuaScriptInterface::pushPosition(L, toPosition);

	LuaScriptInterface::pushCylinder(L, fromCylinder);
	LuaScriptInterface::pushCylinder(L, toCylinder);

	return scriptInterface.callFunction(7);
}

bool Events::eventPlayerOnMoveCreature(Player* player, Creature* creature, const Position& fromPosition, const Position& toPosition)
{
	// Player:onMoveCreature(creature, fromPosition, toPosition) or Player.onMoveCreature(self, creature, fromPosition, toPosition)
	if (info.playerOnMoveCreature == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnMoveCreature] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnMoveCreature, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnMoveCreature);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<Creature>(L, creature);
	LuaScriptInterface::setCreatureMetatable(L, -1, creature);

	LuaScriptInterface::pushPosition(L, fromPosition);
	LuaScriptInterface::pushPosition(L, toPosition);

	return scriptInterface.callFunction(4);
}

bool Events::eventPlayerOnReport(Player* player, const std::string& message)
{
	// Player:onReport(message)
	if (info.playerOnReport == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnReport] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnReport, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnReport);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushString(L, message);

	return scriptInterface.callFunction(2);
}

bool Events::eventPlayerOnTurn(Player* player, Direction direction)
{
	// Player:onTurn(direction) or Player.onTurn(self, direction)
	if (info.playerOnTurn == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnTurn] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnTurn, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnTurn);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	lua_pushnumber(L, direction);

	return scriptInterface.callFunction(2);
}

bool Events::eventPlayerOnTradeRequest(Player* player, Player* target, Item* item)
{
	// Player:onTradeRequest(target, item)
	if (info.playerOnTradeRequest == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnTradeRequest] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnTradeRequest, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnTradeRequest);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<Player>(L, target);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<Item>(L, item);
	LuaScriptInterface::setItemMetatable(L, -1, item);

	return scriptInterface.callFunction(3);
}

bool Events::eventPlayerOnTradeAccept(Player* player, Player* target, Item* item, Item* targetItem)
{
	// Player:onTradeAccept(target, item, targetItem)
	if (info.playerOnTradeAccept == -1) {
		return true;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnTradeAccept] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnTradeAccept, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnTradeAccept);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<Player>(L, target);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<Item>(L, item);
	LuaScriptInterface::setItemMetatable(L, -1, item);

	LuaScriptInterface::pushUserdata<Item>(L, targetItem);
	LuaScriptInterface::setItemMetatable(L, -1, targetItem);

	return scriptInterface.callFunction(4);
}

void Events::eventPlayerOnGainExperience(Player* player, Creature* source, uint64_t& exp, uint64_t rawExp)
{
	// Player:onGainExperience(source, exp, rawExp)
	// rawExp gives the original exp which is not multiplied
	if (info.playerOnGainExperience == -1) {
		return;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnGainExperience] Call stack overflow" << std::endl;
		return;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnGainExperience, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnGainExperience);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	if (source) {
		LuaScriptInterface::pushUserdata<Creature>(L, source);
		LuaScriptInterface::setCreatureMetatable(L, -1, source);
	} else {
		lua_pushnil(L);
	}

	lua_pushnumber(L, exp);
	lua_pushnumber(L, rawExp);

	if (scriptInterface.protectedCall(L, 4, 1) != 0) {
		LuaScriptInterface::reportError(nullptr, LuaScriptInterface::popString(L));
	} else {
		exp = LuaScriptInterface::getNumber<uint64_t>(L, -1);
		lua_pop(L, 1);
	}

	scriptInterface.resetScriptEnv();
}

void Events::eventPlayerOnLoseExperience(Player* player, uint64_t& exp)
{
	// Player:onLoseExperience(exp)
	if (info.playerOnLoseExperience == -1) {
		return;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnLoseExperience] Call stack overflow" << std::endl;
		return;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnLoseExperience, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnLoseExperience);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	lua_pushnumber(L, exp);

	if (scriptInterface.protectedCall(L, 2, 1) != 0) {
		LuaScriptInterface::reportError(nullptr, LuaScriptInterface::popString(L));
	} else {
		exp = LuaScriptInterface::getNumber<uint64_t>(L, -1);
		lua_pop(L, 1);
	}

	scriptInterface.resetScriptEnv();
}

void Events::eventPlayerOnGainSkillTries(Player* player, skills_t skill, uint64_t& tries)
{
	// Player:onGainSkillTries(skill, tries)
	if (info.playerOnGainSkillTries == -1) {
		return;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnGainSkillTries] Call stack overflow" << std::endl;
		return;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnGainSkillTries, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnGainSkillTries);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	lua_pushnumber(L, skill);
	lua_pushnumber(L, tries);

	if (scriptInterface.protectedCall(L, 3, 1) != 0) {
		LuaScriptInterface::reportError(nullptr, LuaScriptInterface::popString(L));
	} else {
		tries = LuaScriptInterface::getNumber<uint64_t>(L, -1);
		lua_pop(L, 1);
	}

	scriptInterface.resetScriptEnv();
}

void Events::eventPlayerOnUseWeapon(Player* player, int32_t& normalDamage, CombatType_t& elementType, int32_t& elementDamage)
{
	// Player:onGainSkillTries(skill, tries)
	if (info.playerOnUseWeapon == -1) {
		return;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnUseWeapon] Call stack overflow" << std::endl;
		return;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnUseWeapon, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnUseWeapon);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	lua_pushnumber(L, normalDamage);
	lua_pushnumber(L, elementType);
	lua_pushnumber(L, elementDamage);

	if (scriptInterface.protectedCall(L, 4, 3) != 0) {
		LuaScriptInterface::reportError(nullptr, LuaScriptInterface::popString(L));
	} else {
		normalDamage = LuaScriptInterface::getNumber<int32_t>(L, -3);
		elementType = LuaScriptInterface::getNumber<CombatType_t>(L, -2);
		elementDamage = LuaScriptInterface::getNumber<int32_t>(L, -1);
		lua_pop(L, 3);
	}

	scriptInterface.resetScriptEnv();
}

void Events::eventPlayerOnCombatSpell(Player* player, int32_t& normalDamage, int32_t& elementDamage, CombatType_t& elementType)
{
	// Player:onGainSkillTries(skill, tries)
	if (info.playerOnCombatSpell == -1) {
		return;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnCombatSpell] Call stack overflow" << std::endl;
		return;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnCombatSpell, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnCombatSpell);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	lua_pushnumber(L, normalDamage);
	lua_pushnumber(L, elementDamage);
	lua_pushnumber(L, elementType);

	if (scriptInterface.protectedCall(L, 4, 3) != 0) {
		LuaScriptInterface::reportError(nullptr, LuaScriptInterface::popString(L));
	} else {
		normalDamage = LuaScriptInterface::getNumber<int32_t>(L, -3);
		elementType = LuaScriptInterface::getNumber<CombatType_t>(L, -2);
		elementDamage = LuaScriptInterface::getNumber<int32_t>(L, -1);
		lua_pop(L, 3);
	}

	scriptInterface.resetScriptEnv();
}

void Events::eventPlayerOnInventoryUpdate(Player* player, Item* item, slots_t slot, bool equip)
{
	// Player:onInventoryUpdate(item, slot, equip)
	if (info.playerOnInventoryUpdate == -1) {
		return;
	}

	if (!scriptInterface.reserveScriptEnv()) {
		std::cout << "[Error - Events::eventPlayerOnInventoryUpdate] Call stack overflow" << std::endl;
		return;
	}

	ScriptEnvironment* env = scriptInterface.getScriptEnv();
	env->setScriptId(info.playerOnInventoryUpdate, &scriptInterface);

	lua_State* L = scriptInterface.getLuaState();
	scriptInterface.pushFunction(info.playerOnInventoryUpdate);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushUserdata<Item>(L, item);
	LuaScriptInterface::setItemMetatable(L, -1, item);

	lua_pushnumber(L, slot);
	LuaScriptInterface::pushBoolean(L, equip);

	scriptInterface.callVoidFunction(4);
}
// Monster
bool Events::eventMonsterOnSpawn(Monster* monster, const Position& position, bool startup, bool artificial)
{
   // Monster:onSpawn(position)
   if (info.monsterOnSpawn == -1) {
       return true;
   }

   if (!scriptInterface.reserveScriptEnv()) {
       std::cout << "[Error - Events::monsterOnSpawn] Call stack overflow" << std::endl;
       return false;
   }

   ScriptEnvironment* env = scriptInterface.getScriptEnv();
   env->setScriptId(info.monsterOnSpawn, &scriptInterface);

   lua_State* L = scriptInterface.getLuaState();
   scriptInterface.pushFunction(info.monsterOnSpawn);

   LuaScriptInterface::pushUserdata<Monster>(L, monster);
   LuaScriptInterface::setMetatable(L, -1, "Monster");
   LuaScriptInterface::pushPosition(L, position);
   LuaScriptInterface::pushBoolean(L, startup);
   LuaScriptInterface::pushBoolean(L, artificial);

   return scriptInterface.callFunction(4);
}
