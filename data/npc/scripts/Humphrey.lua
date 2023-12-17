local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a guardian of nature. Also I am the keeper of the embrace of tibia, one of the five blessings."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Humphrey."})

local blessTable = {
	["phoenix"] = "The spark of the phoenix is given by the dwarven priests of earth and fire in Kazordoon.",
	["suns"] = "You can ask for the blessing of the two suns in the suntower near Ab'Dendriel.",
	["wisdom"] = "Talk to the hermit Eremo on the isle of Cormaya about this blessing.",
	["spiritual"] = "You can ask for the blessing of spiritual shielding the whiteflower temple south of Thais."
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local npc = Npc()
	local table = blessTable[msg]
	if table then
		npc:say(table, TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "heal") then
		if player:getHealth() < 40 then
			npc:say("You are looking really bad. Let me heal your wounds.", TALKTYPE_SAY)
			player:addHealth(40)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		else
			npc:say("You aren't looking really bad. Sorry, I can't help you.", TALKTYPE_SAY)
		end
	elseif msgcontains(msg, 'bless') then
		npc:say("There are five different blessings available in five sacred places. These blessings are: the spiritual shielding, the spark of the phoenix, the embrace of tibia, the fire of the suns and the wisdom of solitude.", TALKTYPE_SAY)
	elseif msgcontains(msg, 'embrace') then
		npc:say("I will give to you the embrace of tibia, but you will have to make a sacrifice. Are you prepared to pay 5.000 gold for the blessing?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
       if not player:hasBlessing(2) then
			if player:removeMoney(5000) then
				player:addBlessing(2)
				npc:say("Kneel down and receive the warmth of sunfire, pilgrim.", TALKTYPE_SAY)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				npcHandler.topic[cid] = 0
			else
				 npc:say("Oh. You do not have enough money.", TALKTYPE_SAY)
				 npcHandler.topic[cid] = 0
			end					
		else
			npc:say("You have already this blessing.", TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		end
	end
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome, child of nature.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())