-- Advanced NPC System by Jiddo

if NpcHandler == nil then
	-- Constant talkdelay behaviors.
	TALKDELAY_NONE = 0 -- No talkdelay. Npc will reply immedeatly.
	TALKDELAY_ONTHINK = 1 -- Talkdelay handled through the onThink callback function. (Default)
	TALKDELAY_EVENT = 2 -- Not yet implemented

	-- Currently applied talkdelay behavior. TALKDELAY_ONTHINK is default.
	NPCHANDLER_TALKDELAY = TALKDELAY_ONTHINK

	-- Constant indexes for defining default messages.
	MESSAGE_GREET 			= 1 -- When the player greets the npc.
	MESSAGE_FAREWELL 		= 2 -- When the player unGreets the npc.
	MESSAGE_BUY 			= 3 -- When the npc asks the player if he wants to buy something.
	MESSAGE_ONBUY 			= 4 -- When the player successfully buys something via talk.
	MESSAGE_BOUGHT			= 5 -- When the player bought something through the shop window.
	MESSAGE_SELL 			= 6 -- When the npc asks the player if he wants to sell something.
	MESSAGE_ONSELL 			= 7 -- When the player successfully sells something via talk.
	MESSAGE_SOLD			= 8 -- When the player sold something through the shop window.
	MESSAGE_MISSINGMONEY		= 9 -- When the player does not have enough money.
	MESSAGE_NEEDMONEY		= 10 -- Same as above, used for shop window.
	MESSAGE_MISSINGITEM		= 11 -- When the player is trying to sell an item he does not have.
	MESSAGE_NEEDITEM		= 12 -- Same as above, used for shop window.
	MESSAGE_NEEDSPACE 		= 13 -- When the player don't have any space to buy an item
	MESSAGE_NEEDMORESPACE		= 14 -- When the player has some space to buy an item, but not enough space
	MESSAGE_IDLETIMEOUT		= 15 -- When the player has been idle for longer then idleTime allows.
	MESSAGE_WALKAWAY		= 16 -- When the player walks out of the talkRadius of the npc.
	MESSAGE_DECLINE			= 17 -- When the player says no to something.
	MESSAGE_SENDTRADE		= 18 -- When the npc sends the trade window to the player
	MESSAGE_NOSHOP			= 19 -- When the npc's shop is requested but he doesn't have any
	MESSAGE_ONCLOSESHOP		= 20 -- When the player closes the npc's shop window
	MESSAGE_ALREADYFOCUSED		= 21 -- When the player already has the focus of this npc.
	MESSAGE_WALKAWAY_MALE		= 22 -- When a male player walks out of the talkRadius of the npc.
	MESSAGE_WALKAWAY_FEMALE		= 23 -- When a female player walks out of the talkRadius of the npc.
	MESSAGE_PLACEDINQUEUE		= 24 -- When the player has been placed in the costumer queue.

	-- Constant indexes for callback functions. These are also used for module callback ids.
	CALLBACK_CREATURE_APPEAR 	= 1
	CALLBACK_CREATURE_DISAPPEAR	= 2
	CALLBACK_CREATURE_SAY 		= 3
	CALLBACK_ONTHINK 		= 4
	CALLBACK_GREET 			= 5
	CALLBACK_FAREWELL 		= 6
	CALLBACK_MESSAGE_DEFAULT 	= 7
	CALLBACK_PLAYER_ENDTRADE 	= 8
	CALLBACK_PLAYER_CLOSECHANNEL	= 9
	CALLBACK_ONBUY			= 10
	CALLBACK_ONSELL			= 11
	CALLBACK_ONADDFOCUS		= 18
	CALLBACK_ONRELEASEFOCUS		= 19
	CALLBACK_ONTRADEREQUEST		= 20

	-- Addidional module callback ids
	CALLBACK_MODULE_INIT		= 12
	CALLBACK_MODULE_RESET		= 13

	-- Constant strings defining the keywords to replace in the default messages.
	TAG_PLAYERNAME = "|PLAYERNAME|"
	TAG_ITEMCOUNT = "|ITEMCOUNT|"
	TAG_TOTALCOST = "|TOTALCOST|"
	TAG_ITEMNAME = "|ITEMNAME|"
	TAG_QUEUESIZE = "|QUEUESIZE|"
	TAG_TIME = "|TIME|"
	TAG_BLESSCOST = "|BLESSCOST|"
	TAG_TRAVELCOST = "|TRAVELCOST|"

	NpcHandler = {
		keywordHandler = nil,
		focuses = nil,
		talkStart = nil,
		idleTime = 120,
		talkRadius = 3,
		talkDelayTime = 100, -- Seconds to delay outgoing messages.
		queue = nil,
		talkDelay = nil,
		callbackFunctions = nil,
		modules = nil,
		shopItems = nil, -- They must be here since ShopModule uses 'static' functions
		eventSay = nil,
		eventDelayedSay = nil,
		topic = nil,
		messages = {
			-- These are the default replies of all npcs. They can/should be changed individually for each npc.
			[MESSAGE_GREET]		= "Greetings, |PLAYERNAME|.",
			[MESSAGE_FAREWELL] 	= "Good bye, |PLAYERNAME|.",
			[MESSAGE_BUY] 		= "Do you want to buy |ITEMCOUNT| |ITEMNAME| for |TOTALCOST| gold coins?",
			[MESSAGE_ONBUY]		= "Here you are.",
			[MESSAGE_BOUGHT] 	= "Bought |ITEMCOUNT|x |ITEMNAME| for |TOTALCOST| gold.",
			[MESSAGE_SELL] 		= "Do you want to sell |ITEMCOUNT| |ITEMNAME| for |TOTALCOST| gold coins?",
			[MESSAGE_ONSELL] 	= "Here you are, |TOTALCOST| gold.",
			[MESSAGE_SOLD]	 	= "Sold |ITEMCOUNT|x |ITEMNAME| for |TOTALCOST| gold.",
			[MESSAGE_MISSINGMONEY]	= "You don't have enough money.",
			[MESSAGE_NEEDMONEY] 	= "You don't have enough money.",
			[MESSAGE_MISSINGITEM] 	= "You don't have so many.",
			[MESSAGE_NEEDITEM]	= "You do not have this object.",
			[MESSAGE_NEEDSPACE]	= "You do not have enough capacity.",
			[MESSAGE_NEEDMORESPACE]	= "You do not have enough capacity for all items.",
			[MESSAGE_IDLETIMEOUT] 	= "Good bye.",
			[MESSAGE_WALKAWAY] 	= "Good bye.",
			[MESSAGE_DECLINE]	= "Then not.",
			[MESSAGE_SENDTRADE]	= "Of course, just browse through my wares.",
			[MESSAGE_NOSHOP]	= "Sorry, I'm not offering anything.",
			[MESSAGE_ONCLOSESHOP]	= "Thank you, come back whenever you're in need of something else.",
			[MESSAGE_ALREADYFOCUSED]= "|PLAYERNAME|, I am already talking to you.",
			[MESSAGE_WALKAWAY_MALE]	= "Good bye.",
			[MESSAGE_WALKAWAY_FEMALE] 	= "Good bye.",
			[MESSAGE_PLACEDINQUEUE] 	= "|PLAYERNAME|, please wait for your turn. There are |QUEUESIZE| customers before you."
		}
	}

	-- Creates a new NpcHandler with an empty callbackFunction stack.
	function NpcHandler:new(keywordHandler)
		local obj = {}
		obj.callbackFunctions = {}
		obj.modules = {}
		obj.queue = Queue:new(obj)
		obj.eventSay = {}
		obj.eventDelayedSay = {}
		obj.topic = {}
		obj.focuses = 0
		obj.talkStart = {}
		obj.talkDelay = {}
		obj.keywordHandler = keywordHandler
		obj.messages = {}
		obj.shopItems = {}

		setmetatable(obj.messages, self.messages)
		self.messages.__index = self.messages

		setmetatable(obj, self)
		self.__index = self
		return obj
	end

	-- Re-defines the maximum idle time allowed for a player when talking to this npc.
	function NpcHandler:setMaxIdleTime(newTime)
		self.idleTime = newTime
	end

	-- Attackes a new keyword handler to this npchandler
	function NpcHandler:setKeywordHandler(newHandler)
		self.keywordHandler = newHandler
	end

	-- Function used to change the focus of this npc.
	function NpcHandler:addFocus(newFocus)
		self.focuses = newFocus
		self.topic[newFocus] = 0
		self.talkStart[newFocus] = os.time()
		local callback = self:getCallback(CALLBACK_ONADDFOCUS)
		if callback == nil or callback(newFocus) then
			self:processModuleCallback(CALLBACK_ONADDFOCUS, newFocus)
		end
		self:updateFocus()
	end
	NpcHandler.changeFocus = NpcHandler.addFocus --"changeFocus" looks better for CONVERSATION_DEFAULT

	-- Function used to verify if npc is focused to certain player
	function NpcHandler:isFocused(focus)
		return self.focuses == focus
	end

	-- This function should be called on each onThink and makes sure the npc faces the player it is talking to.
	--	Should also be called whenever a new player is focused.
	function NpcHandler:updateFocus()
		doNpcSetCreatureFocus(self.focuses)
	end

	-- Used when the npc should un-focus the player.
	function NpcHandler:releaseFocus(focus)
		if shop_cost[focus] ~= nil then
			table.remove(shop_amount, focus)
			table.remove(shop_cost, focus)
			table.remove(shop_rlname, focus)
			table.remove(shop_itemid, focus)
			table.remove(shop_container, focus)
			table.remove(shop_npcuid, focus)
			table.remove(shop_eventtype, focus)
			table.remove(shop_subtype, focus)
			table.remove(shop_destination, focus)
			table.remove(shop_premium, focus)
		end
		if self.eventDelayedSay[focus] then
			self:cancelNPCTalk(self.eventDelayedSay[focus])
		end
		self.topic[focus] = nil
		self.talkStart[focus] = nil
		self.eventDelayedSay[focus] = nil

		local callback = self:getCallback(CALLBACK_ONRELEASEFOCUS)
		if callback == nil or callback(focus) then
			self:processModuleCallback(CALLBACK_ONRELEASEFOCUS, focus)
		end
		self:changeFocus(0)
	end

	-- Returns the callback function with the specified id or nil if no such callback function exists.
	function NpcHandler:getCallback(id)
		local ret = nil
		if self.callbackFunctions ~= nil then
			ret = self.callbackFunctions[id]
		end
		return ret
	end

	-- Changes the callback function for the given id to callback.
	function NpcHandler:setCallback(id, callback)
		if self.callbackFunctions ~= nil then
			self.callbackFunctions[id] = callback
		end
	end

	-- Adds a module to this npchandler and inits it.
	function NpcHandler:addModule(module)
		if self.modules ~= nil then
			self.modules[#self.modules +1] = module
			module:init(self)
		end
	end

	-- Calls the callback function represented by id for all modules added to this npchandler with the given arguments.
	function NpcHandler:processModuleCallback(id, ...)
		local ret = true
		for i = 1, #self.modules do
			local module = self.modules[i]
			local tmpRet = true
			if id == CALLBACK_CREATURE_APPEAR and module.callbackOnCreatureAppear ~= nil then
				tmpRet = module:callbackOnCreatureAppear(...)
			elseif id == CALLBACK_CREATURE_DISAPPEAR and module.callbackOnCreatureDisappear ~= nil then
				tmpRet = module:callbackOnCreatureDisappear(...)
			elseif id == CALLBACK_CREATURE_SAY and module.callbackOnCreatureSay ~= nil then
				tmpRet = module:callbackOnCreatureSay(...)
			elseif id == CALLBACK_PLAYER_ENDTRADE and module.callbackOnPlayerEndTrade ~= nil then
				tmpRet = module:callbackOnPlayerEndTrade(...)
			elseif id == CALLBACK_PLAYER_CLOSECHANNEL and module.callbackOnPlayerCloseChannel ~= nil then
				tmpRet = module:callbackOnPlayerCloseChannel(...)
			elseif id == CALLBACK_ONBUY and module.callbackOnBuy ~= nil then
				tmpRet = module:callbackOnBuy(...)
			elseif id == CALLBACK_ONSELL and module.callbackOnSell ~= nil then
				tmpRet = module:callbackOnSell(...)
			elseif id == CALLBACK_ONTRADEREQUEST and module.callbackOnTradeRequest ~= nil then
				tmpRet = module:callbackOnTradeRequest(...)
			elseif id == CALLBACK_ONADDFOCUS and module.callbackOnAddFocus ~= nil then
				tmpRet = module:callbackOnAddFocus(...)
			elseif id == CALLBACK_ONRELEASEFOCUS and module.callbackOnReleaseFocus ~= nil then
				tmpRet = module:callbackOnReleaseFocus(...)
			elseif id == CALLBACK_ONTHINK and module.callbackOnThink ~= nil then
				tmpRet = module:callbackOnThink(...)
			elseif id == CALLBACK_GREET and module.callbackOnGreet ~= nil then
				tmpRet = module:callbackOnGreet(...)
			elseif id == CALLBACK_FAREWELL and module.callbackOnFarewell ~= nil then
				tmpRet = module:callbackOnFarewell(...)
			elseif id == CALLBACK_MESSAGE_DEFAULT and module.callbackOnMessageDefault ~= nil then
				tmpRet = module:callbackOnMessageDefault(...)
			elseif id == CALLBACK_MODULE_RESET and module.callbackOnModuleReset ~= nil then
				tmpRet = module:callbackOnModuleReset(...)
			end
			if not tmpRet then
				ret = false
				break
			end
		end
		return ret
	end

	-- Returns the message represented by id.
	function NpcHandler:getMessage(id)
		local ret = nil
		if self.messages ~= nil then
			ret = self.messages[id]
		end
		return ret
	end

	-- Changes the default response message with the specified id to newMessage.
	function NpcHandler:setMessage(id, newMessage)
		if self.messages ~= nil then
			self.messages[id] = newMessage
		end
	end

	-- Translates all message tags found in msg using parseInfo
	function NpcHandler:parseMessage(msg, parseInfo)
		local ret = msg
		if type(ret) == 'string' then
			for search, replace in pairs(parseInfo) do
				ret = string.gsub(ret, search, replace)
			end
		else
			for i = 1, #ret do
				for search, replace in pairs(parseInfo) do
					ret[i] = string.gsub(ret[i], search, replace)
				end
			end
		end
		return ret
	end

	-- Makes sure the npc un-focuses the currently focused player
	function NpcHandler:unGreet(cid)
		if not self:isFocused(cid) then
			return
		end

		local callback = self:getCallback(CALLBACK_FAREWELL)
		if callback == nil or callback() then
			if self:processModuleCallback(CALLBACK_FAREWELL) then
				if self.queue == nil or not self.queue:greetNext() then
					local msg = self:getMessage(MESSAGE_FAREWELL)
					local parseInfo = { [TAG_PLAYERNAME] = Player(cid):getName() }
					self:resetNpc(cid)
					msg = self:parseMessage(msg, parseInfo)
					selfSay(msg)
					self:releaseFocus(cid)
				end
			end
		end
	end

	-- Greets a new player.
	function NpcHandler:greet(cid, message)
		if cid ~= 0  then
			local callback = self:getCallback(CALLBACK_GREET)
			if callback == nil or callback(cid, message) then
				if self:processModuleCallback(CALLBACK_GREET, cid) then
					local msg = self:getMessage(MESSAGE_GREET)
					local parseInfo = { [TAG_PLAYERNAME] = Player(cid):getName() }
					msg = self:parseMessage(msg, parseInfo)
					self:say(msg, cid)
				else
					return
				end
			else
				return
			end
		end
		self:addFocus(cid)
	end

	-- Handles onCreatureAppear events. If you with to handle this yourself, please use the CALLBACK_CREATURE_APPEAR callback.
	function NpcHandler:onCreatureAppear(creature)
		local cid = creature.uid
		local callback = self:getCallback(CALLBACK_CREATURE_APPEAR)
		if callback == nil or callback(cid) then
			if self:processModuleCallback(CALLBACK_CREATURE_APPEAR, cid) then
				--
			end
		end
	end

	-- Handles onCreatureDisappear events. If you with to handle this yourself, please use the CALLBACK_CREATURE_DISAPPEAR callback.
	function NpcHandler:onCreatureDisappear(creature)
		local cid = creature:getId()
		if getNpcCid() == cid then
			return
		end

		local callback = self:getCallback(CALLBACK_CREATURE_DISAPPEAR)
		if callback == nil or callback(cid) then
			if self:processModuleCallback(CALLBACK_CREATURE_DISAPPEAR, cid) then
				if self:isFocused(cid) then
					self:unGreet(cid)
				end
			end
		end
	end

	-- Handles onCreatureSay events. If you with to handle this yourself, please use the CALLBACK_CREATURE_SAY callback.
	function NpcHandler:onCreatureSay(creature, msgtype, msg)
		local cid = creature:getId()
		local callback = self:getCallback(CALLBACK_CREATURE_SAY)
		if callback == nil or callback(cid, msgtype, msg) then
			if self:processModuleCallback(CALLBACK_CREATURE_SAY, cid, msgtype, msg) then
				if not self:isInRange(cid) then
					return
				end

				if self.keywordHandler ~= nil then
					if self:isFocused(cid) or not self:isFocused(cid) then
						local ret = self.keywordHandler:processMessage(cid, msg)
						if(not ret) then
							local callback = self:getCallback(CALLBACK_MESSAGE_DEFAULT)
							if callback ~= nil and callback(cid, msgtype, msg) then
								self.talkStart[cid] = os.time()
							end
						else
							self.talkStart[cid] = os.time()
						end
					end
				end
			end
		end
	end

	-- Handles onBuy events. If you wish to handle this yourself, use the CALLBACK_ONBUY callback.
	function NpcHandler:onBuy(creature, itemid, subType, amount, ignoreCap, inBackpacks)
		local cid = creature:getId()
		local callback = self:getCallback(CALLBACK_ONBUY)
		if callback == nil or callback(cid, itemid, subType, amount, ignoreCap, inBackpacks) then
			if self:processModuleCallback(CALLBACK_ONBUY, cid, itemid, subType, amount, ignoreCap, inBackpacks) then
				--
			end
		end
	end

	-- Handles onSell events. If you wish to handle this yourself, use the CALLBACK_ONSELL callback.
	function NpcHandler:onSell(creature, itemid, subType, amount, ignoreCap, inBackpacks)
		local cid = creature:getId()
		local callback = self:getCallback(CALLBACK_ONSELL)
		if callback == nil or callback(cid, itemid, subType, amount, ignoreCap, inBackpacks) then
			if self:processModuleCallback(CALLBACK_ONSELL, cid, itemid, subType, amount, ignoreCap, inBackpacks) then
				--
			end
		end
	end

	-- Handles onTradeRequest events. If you wish to handle this yourself, use the CALLBACK_ONTRADEREQUEST callback.
	function NpcHandler:onTradeRequest(cid)
		local callback = self:getCallback(CALLBACK_ONTRADEREQUEST)
		if callback == nil or callback(cid) then
			if self:processModuleCallback(CALLBACK_ONTRADEREQUEST, cid) then
				return true
			end
		end
		return false
	end

	-- Handles onThink events. If you wish to handle this yourself, please use the CALLBACK_ONTHINK callback.
	function NpcHandler:onThink()
		local callback = self:getCallback(CALLBACK_ONTHINK)
		if callback == nil or callback() then
			if NPCHANDLER_TALKDELAY == TALKDELAY_ONTHINK then
				for cid, talkDelay in pairs(self.talkDelay) do
					if talkDelay.time ~= nil and talkDelay.message ~= nil and os.time() >= talkDelay.time then
						selfSay(talkDelay.message, cid, talkDelay.publicize and true or false)
						self.talkDelay[cid] = nil
					end
				end
			end

			if self:processModuleCallback(CALLBACK_ONTHINK) then
				if self.focuses ~= 0 then
					if not self:isInRange(self.focuses) then
						self:onWalkAway(self.focuses)
					elseif self.talkStart[self.focuses] ~= nil and (os.time() - self.talkStart[self.focuses]) > self.idleTime then
						self:unGreet(self.focuses)
					else
						self:updateFocus()
					end
				end
			end
		end
	end

	-- Tries to greet the player with the given cid.
	function NpcHandler:onGreet(cid, message)
		if self:isInRange(cid) then
			local player = Player(cid)
			if self.focuses == 0 then
				self:greet(cid, message)
			elseif self.focuses == cid then
				local msg = self:getMessage(MESSAGE_ALREADYFOCUSED)
				local parseInfo = { [TAG_PLAYERNAME] = player:getName() }
				msg = self:parseMessage(msg, parseInfo)
				selfSay(msg)
			else
				if not self.queue:isInQueue(cid) then
					self.queue:push(cid)
				end
				local msg = self:getMessage(MESSAGE_PLACEDINQUEUE)
				local parseInfo = { [TAG_PLAYERNAME] = player:getName(), [TAG_QUEUESIZE] = self.queue:getSize() }
				msg = self:parseMessage(msg, parseInfo)
				selfSay(msg)
			end
		end
	end

	-- Simply calls the underlying unGreet function.
	function NpcHandler:onFarewell(cid)
		self:unGreet(cid)
	end

	-- Should be called on this npc's focus if the distance to focus is greater then talkRadius.
	function NpcHandler:onWalkAway(cid)
		if self:isFocused(cid) then
			local callback = self:getCallback(CALLBACK_CREATURE_DISAPPEAR)
			if callback == nil or callback() then
				if self:processModuleCallback(CALLBACK_CREATURE_DISAPPEAR, cid) then
					if self.queue == nil or not self.queue:greetNext() then
						local msg = self:getMessage(MESSAGE_WALKAWAY)
						local player = Player(cid)
						if player then
							local playerName = player:getName()
							if not playerName then
								playerName = -1
							end
						else
							playerName = -1
						end

						local parseInfo = { [TAG_PLAYERNAME] = playerName }
						msg = self:parseMessage(msg, parseInfo)
						selfSay(msg)
						self:resetNpc(cid)
						self:releaseFocus(cid)
					end
				end
			end
		end
	end

	-- Returns true if cid is within the talkRadius of this npc.
	function NpcHandler:isInRange(cid)
		local distance = Player(cid) ~= nil and getDistanceTo(cid) or -1
		if distance == -1 then
			return false
		end

		return distance <= self.talkRadius
	end

	-- Resets the npc into its initial state (in regard of the keywordhandler).
	--	All modules are also receiving a reset call through their callbackOnModuleReset function.
	function NpcHandler:resetNpc(cid)
		if self:processModuleCallback(CALLBACK_MODULE_RESET) then
			self.keywordHandler:reset(cid)
		end
	end

	function NpcHandler:cancelNPCTalk(events)
		for aux = 1, #events do
			stopEvent(events[aux].event)
		end
		events = nil
	end

	function NpcHandler:doNPCTalkALot(msgs, interval, pcid)
		if self.eventDelayedSay[pcid] then
			self:cancelNPCTalk(self.eventDelayedSay[pcid])
		end

		self.eventDelayedSay[pcid] = {}
		local ret = {}
		for aux = 1, #msgs do
			self.eventDelayedSay[pcid][aux] = {}
			doCreatureSayWithDelay(getNpcCid(), msgs[aux], TALKTYPE_SAY, ((aux-1) * (interval or 4000)) + 700, self.eventDelayedSay[pcid][aux], pcid)
			ret[#ret +1] = self.eventDelayedSay[pcid][aux]
		end
		return(ret)
	end

	-- Makes the npc represented by this instance of NpcHandler say something.
	--	This implements the currently set type of talkdelay.
	--	shallDelay is a boolean value. If it is false, the message is not delayed. Default value is true.
	function NpcHandler:say(message, focus, publicize, shallDelay, delay)
		if type(message) == "table" then
			return self:doNPCTalkALot(message, delay or 6000, focus)
		end

		if self.eventDelayedSay[focus] then
			self:cancelNPCTalk(self.eventDelayedSay[focus])
		end

		local shallDelay = not shallDelay and true or shallDelay
		if NPCHANDLER_TALKDELAY == TALKDELAY_NONE or shallDelay == false then
			selfSay(message, focus, publicize and true or false)
			return
		end

		local player = Player(focus)
		if player then
			selfSay(message:gsub('|PLAYERNAME|', player:getName()))
		end
	end
end
