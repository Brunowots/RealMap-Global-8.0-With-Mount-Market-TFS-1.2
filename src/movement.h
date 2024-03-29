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

#ifndef FS_MOVEMENT_H_5E0D2626D4634ACA83AC6509518E5F49
#define FS_MOVEMENT_H_5E0D2626D4634ACA83AC6509518E5F49

#include "baseevents.h"
#include "item.h"
#include "luascript.h"
#include "vocation.h"

extern Vocations g_vocations;

enum MoveEvent_t {
	MOVE_EVENT_STEP_IN,
	MOVE_EVENT_STEP_OUT,
	MOVE_EVENT_EQUIP,
	MOVE_EVENT_DEEQUIP,
	MOVE_EVENT_ADD_ITEM,
	MOVE_EVENT_REMOVE_ITEM,
	MOVE_EVENT_ADD_ITEM_ITEMTILE,
	MOVE_EVENT_REMOVE_ITEM_ITEMTILE,

	MOVE_EVENT_LAST,
	MOVE_EVENT_NONE
};

class MoveEvent;

struct MoveEventList {
	std::list<MoveEvent*> moveEvent[MOVE_EVENT_LAST];
};

using VocEquipMap = std::map<uint16_t, bool>;

class MoveEvents final : public BaseEvents
{
	public:
		MoveEvents();
		~MoveEvents();

		// non-copyable
		MoveEvents(const MoveEvents&) = delete;
		MoveEvents& operator=(const MoveEvents&) = delete;

		uint32_t onCreatureMove(Creature* creature, const Tile* tile, MoveEvent_t eventType);
		uint32_t onPlayerEquip(Player* player, Item* item, slots_t slot, bool isCheck);
		uint32_t onPlayerDeEquip(Player* player, Item* item, slots_t slot);
		uint32_t onItemMove(Item* item, Tile* tile, bool isAdd);

		MoveEvent* getEvent(Item* item, MoveEvent_t eventType);
		
		bool registerLuaEvent(MoveEvent* event);
		bool registerLuaFunction(MoveEvent* event);

	protected:
		using MoveListMap = std::map<int32_t, MoveEventList>;
		void clearMap(MoveListMap& map);

		using MovePosListMap = std::map<Position, MoveEventList>;
		void clear() final;
		LuaScriptInterface& getScriptInterface() final;
		std::string getScriptBaseName() const final;
		Event* getEvent(const std::string& nodeName) final;
		bool registerEvent(Event* event, const pugi::xml_node& node) final;

		void addEvent(MoveEvent* moveEvent, int32_t id, MoveListMap& map);

		void addEvent(MoveEvent* moveEvent, const Position& pos, MovePosListMap& map);
		MoveEvent* getEvent(const Tile* tile, MoveEvent_t eventType);

		MoveEvent* getEvent(Item* item, MoveEvent_t eventType, slots_t slot);

		MoveListMap uniqueIdMap;
		MoveListMap actionIdMap;
		MoveListMap itemIdMap;
		MovePosListMap positionMap;

		LuaScriptInterface scriptInterface;
};

using StepFunction = std::function<uint32_t(Creature* creature, Item* item, const Position& pos)>;
using MoveFunction = std::function<uint32_t(Item* item, Item* tileItem, const Position& pos)>;
using EquipFunction = std::function<uint32_t(MoveEvent* moveEvent, Player* player, Item* item, slots_t slot, bool boolean)>;

class MoveEvent final : public Event
{
	public:
		explicit MoveEvent(LuaScriptInterface* interface);

		MoveEvent_t getEventType() const;
		void setEventType(MoveEvent_t type);

		bool configureEvent(const pugi::xml_node& node) final;
		bool loadFunction(const pugi::xml_attribute& attr) final;

		uint32_t fireStepEvent(Creature* creature, Item* item, const Position& pos);
		uint32_t fireAddRemItem(Item* item, Item* tileItem, const Position& pos);
		uint32_t fireEquip(Player* player, Item* item, slots_t slot, bool isCheck);

		uint32_t getSlot() const {
			return slot;
		}

		//scripting
		bool executeStep(Creature* creature, Item* item, const Position& pos);
		bool executeEquip(Player* player, Item* item, slots_t slot, bool isCheck);
		bool executeAddRemItem(Item* item, Item* tileItem, const Position& pos);
		//

		//onEquip information
		uint32_t getReqLevel() const {
			return reqLevel;
		}
		uint32_t getReqMagLv() const {
			return reqMagLevel;
		}
		bool isPremium() const {
			return premium;
		}
		const std::string& getVocationString() const {
			return vocationString;
		}
		std::string getSlotName() {
			return slotName;
		}
		void setSlotName(std::string name) {
			slotName = name;
		}
		void setSlot(uint32_t s) {
			slot = s;
		}
				uint32_t getRequiredLevel() {
			return reqLevel;
		}
		void setRequiredLevel(uint32_t level) {
			reqLevel = level;
		}
		uint32_t getRequiredMagLevel() {
			return reqMagLevel;
		}
		void setRequiredMagLevel(uint32_t level) {
			reqMagLevel = level;
		}
		uint32_t getWieldInfo() {
			return wieldInfo;
		}
		void setWieldInfo(WieldInfo_t info) {
			wieldInfo |= info;
		}
		bool needPremium() {
			return premium;
		}
		void setNeedPremium(bool b) {
			premium = b;
		}
		uint32_t getWieldInfo() const {
			return wieldInfo;
		}
		void setVocationString(const std::string& str) {
			vocationString = str;
		}
		const std::unordered_set<short unsigned int>& getVocationEquipSet() const {
			return vocationEquipSet;
		}
		void addVocationEquipSet(const std::string& vocationName)
		{
			int32_t vocationId = g_vocations.getVocationId(vocationName);
			if (vocationId != -1) {
				vocationEquipSet.insert(vocationId);
			}
		}
		bool hasVocationEquipSet(uint16_t vocationId) const
		{
			return !vocationEquipSet.empty() && vocationEquipSet.find(vocationId) != vocationEquipSet.end();
		}
		std::vector<uint32_t> getItemIdRange() {
			return itemIdRange;
		}
		void addItemId(uint32_t id) {
			itemIdRange.emplace_back(id);
		}
		std::vector<uint32_t> getActionIdRange() {
			return actionIdRange;
		}
		void addActionId(uint32_t id) {
			actionIdRange.emplace_back(id);
		}
		std::vector<uint32_t> getUniqueIdRange() {
			return uniqueIdRange;
		}
		void addUniqueId(uint32_t id) {
			uniqueIdRange.emplace_back(id);
		}
		std::vector<Position> getPosList() {
			return posList;
		}
		void addPosList(Position pos) {
			posList.emplace_back(pos);
		}
				static uint32_t StepInField(Creature* creature, Item* item, const Position& pos);
		static uint32_t StepOutField(Creature* creature, Item* item, const Position& pos);

		static uint32_t AddItemField(Item* item, Item* tileItem, const Position& pos);
		static uint32_t RemoveItemField(Item* item, Item* tileItem, const Position& pos);

		static uint32_t EquipItem(MoveEvent* moveEvent, Player* player, Item* item, slots_t slot, bool boolean);
		static uint32_t DeEquipItem(MoveEvent* moveEvent, Player* player, Item* item, slots_t slot, bool boolean);
		
		MoveEvent_t eventType = MOVE_EVENT_NONE;
		StepFunction stepFunction;
		MoveFunction moveFunction;
		EquipFunction equipFunction;

	protected:
		std::string getScriptEventName() const final;

		uint32_t slot = SLOTP_WHEREEVER;
		std::string slotName;

		//onEquip information
		uint32_t reqLevel = 0;
		uint32_t reqMagLevel = 0;
		bool premium = false;
		std::string vocationString;
		uint32_t wieldInfo = 0;
		//VocEquipMap vocEquipMap;
		std::unordered_set<uint16_t> vocationEquipSet;
		bool tileItem = false;
		
		std::vector<uint32_t> itemIdRange;
		std::vector<uint32_t> actionIdRange;
		std::vector<uint32_t> uniqueIdRange;
		std::vector<Position> posList;
};

#endif
