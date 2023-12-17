-- Custom Modules, created to help us in this datapack
local travelDiscounts = {
	['postman'] = {price = 10, storage = 2015, value = 3}
}

function StdModule.travelDiscount(player, discounts)
	local discountPrice, discount = 0
	if type(discounts) == 'string' then
		discount = travelDiscounts[discounts]
		if discount and player:getStorageValue(discount.storage) >= discount.value then
			return discount.price
		end
	else
		for i = 1, #discounts do
			discount = travelDiscounts[discounts[i]]
			if discount and player:getStorageValue(discount.storage) >= discount.value then
				discountPrice = discountPrice + discount.price
			end
		end
	end

	return discountPrice
end

function StdModule.kick(cid, message, keywords, parameters, node)
	local npcHandler = parameters.npcHandler
	if npcHandler == nil then
		error("StdModule.travel called without any npcHandler instance.")
	end


	npcHandler:say(parameters.text or "Off with you!", cid)

	local destination = parameters.destination
	if type(destination) == 'table' then
		destination = destination[math.random(#destination)]
	end

	Player(cid):teleportTo(destination, true)
	return true
end

local GreetModule = {}
function GreetModule.greet(cid, message, keywords, parameters)
	if not parameters.npcHandler:isInRange(cid) then
		return true
	end

	if parameters.npcHandler:isFocused(cid) then
		return true
	end

	local parseInfo = { [TAG_PLAYERNAME] = Player(cid):getName() }
	parameters.npcHandler:say(parameters.npcHandler:parseMessage(parameters.text, parseInfo), cid, true)
	parameters.npcHandler:addFocus(cid)
	return true
end

function GreetModule.farewell(cid, message, keywords, parameters)
	if not parameters.npcHandler:isFocused(cid) then
		return false
	end

	local parseInfo = { [TAG_PLAYERNAME] = Player(cid):getName() }
	parameters.npcHandler:say(parameters.npcHandler:parseMessage(parameters.text, parseInfo), cid, true)
	parameters.npcHandler:resetNpc(cid)
	parameters.npcHandler:releaseFocus(cid)
	return true
end

-- Adds a keyword which acts as a greeting word
function KeywordHandler:addGreetKeyword(keys, parameters, condition, action)
	local keys = keys
	keys.callback = FocusModule.messageMatcherDefault
	return self:addKeyword(keys, GreetModule.greet, parameters, condition, action)
end

-- Adds a keyword which acts as a farewell word
function KeywordHandler:addFarewellKeyword(keys, parameters, condition, action)
	local keys = keys
	keys.callback = FocusModule.messageMatcherDefault
	return self:addKeyword(keys, GreetModule.farewell, parameters, condition, action)
end

-- VoiceModule
VoiceModule = {
	voices = nil,
	voiceCount = 0,
	lastVoice = 0,
	timeout = nil,
	chance = nil,
	npcHandler = nil
}

-- Creates a new instance of VoiceModule
function VoiceModule:new(voices, timeout, chance)
	local obj = {}
	setmetatable(obj, self)
	self.__index = self

	obj.voices = voices
	for i = 1, #obj.voices do
		if obj.voices[i].yell then
			obj.voices[i].yell = nil
			obj.voices[i].talktype = TALKTYPE_YELL
		else
			obj.voices[i].talktype = TALKTYPE_SAY
		end
	end

	obj.voiceCount = #voices
	obj.timeout = timeout or 10
	obj.chance = chance or 25
	return obj
end

function VoiceModule:init(handler)
	return true
end

function VoiceModule:callbackOnThink()
	if self.lastVoice < os.time() then
		self.lastVoice = os.time() + self.timeout
		if math.random(100) < self.chance  then
			local voice = self.voices[math.random(self.voiceCount)]
			Npc():say(voice.text, voice.talktype)
		end
	end
	return true
end
