local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local voices = { {text = 'Offering all sorts of magic equipment.'} }
npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local items = {[1] = 2190, [2] = 2182}
	local itemId = items[player:getVocation():getBase():getId()]
	if msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand') then
		if player:isMage() then
			if player:getStorageValue(2004) ~= 1 then
				npcHandler:say('So you ask me for a ' .. ItemType(itemId):getName() .. ' to begin your adventure?', cid)
				npcHandler.topic[cid] = 1
			else
				npcHandler:say('What? I have already gave you one ' .. ItemType(itemId):getName() .. '!', cid)
			end
		else
			npcHandler:say('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:addItem(itemId, 1)
			npcHandler:say('Here you are young adept, take care yourself.', cid)
			player:setStorageValue(2004, 1)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		npcHandler:say('Ok then.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the mourned Fenech."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Buy a watch on the bazar."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask the guards for locations."})
keywordHandler:addKeyword({'arena'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask the guards for locations."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask the guards for locations."})
keywordHandler:addKeyword({'arkhothep'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Praised may he be."})
keywordHandler:addKeyword({'ashmunrah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know. Read some books."})
keywordHandler:addKeyword({'scarab'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Scarabs are dangerous. Stay away from them like I do."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know only Ankrahmun. What else could there be?"})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know any foreign places or races."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know any foreign places or races."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know any foreign places or races."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know any foreign places or races."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know any foreign places or races."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know any foreign places or races."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know any foreign places or races."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know any foreign places or races."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know any foreign places or races."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know any foreign places or races."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not a studied person. Ask someone else."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is our land."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Its somewhere in the north as far as I know."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Its my home and all I know."})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask the priest in the temple."})
keywordHandler:addKeyword({"Akh'rah Uthun"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask the priest in the temple."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Be mourned pilgrim in flesh and welcome to the magic store.")
npcHandler:setMessage(MESSAGE_FAREWELL, "May enlightenment be your path.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "May enlightenment be your path.")
npcHandler:addModule(FocusModule:new())