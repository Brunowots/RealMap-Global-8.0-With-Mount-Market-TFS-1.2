local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local player = Player(cid)
	if player:isKnight() then
		npcHandler:setMessage(MESSAGE_GREET, "Hiho, fellow knight ".. player:getName() .."!")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hiho, visitor ".. player:getName() .."! What do you want?")
	end	
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Iam the Highknight of the dwarfs."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Duria Steelbender, daughter of Fire, of the Dragoneaters."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dunno."})
keywordHandler:addKeyword({'hero'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Heroes are rare in this days, jawoll."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah, to much plantsandstuff, to few tunnels ifyoudaskme."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Was there once. Can't handle the crime overthere."})
keywordHandler:addKeyword({'knight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Knights are proud of being dwarfs, jawoll."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Vocation, vocation, wouldratherlike a vacation."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sellingno spellbooks here. Do I look like a sorc?"})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())