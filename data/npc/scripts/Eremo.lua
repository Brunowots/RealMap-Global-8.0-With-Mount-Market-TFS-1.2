local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local player = Player(cid)
	if player:getVocation():getId() <= 4 then
		npcHandler:setMessage(MESSAGE_GREET, "Welcome to my little garden, adventurer ".. player:getName() .."!")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Welcome to my little garden, humble ".. player:getName() .."!")
	end	
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'amulet of loss'}, 					Cfamuletofloss, 50000)
shopModule:addBuyableItem({'protection amulet'}, 					Cfprotectionamulet, 700, 250)
shopModule:addBuyableItem({'broken amulet', 'amulet of life'}, 					Cfbrokenamulet, 50000)

local travelNode = keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, text = 'Should I teleport you back to Pemaret?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = Position(33288, 31956, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'Maybe later.'})
	
local travelNode = keywordHandler:addKeyword({'back'}, StdModule.say, {npcHandler = npcHandler, text = 'Should I teleport you back to Pemaret?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = Position(33288, 31956, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'Maybe later.'})

local travelNode = keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Should I teleport you back to Pemaret?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = Position(33288, 31956, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'Maybe later.'})

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Eremo, an old man who has seen many things."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I teach some spells, provide one of the five blessings, and sell some amulets."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I teach some spells, provide one of the five blessings, and sell some amulets."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I teach some spells, provide one of the five blessings, and sell some amulets."})
keywordHandler:addKeyword({'island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have retired from my adventures to this place"})
keywordHandler:addKeyword({'isle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have retired from my adventures to this place"})
keywordHandler:addKeyword({'garden'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have retired from my adventures to this place"})
keywordHandler:addKeyword({'adventure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I explored dungeons, I walked through deserts, I sailed on the seas and climbed up on many a mountain."})
keywordHandler:addKeyword({'thing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I explored dungeons, I walked through deserts, I sailed on the seas and climbed up on many a mountain."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A great world full of magic and wonder."})
keywordHandler:addKeyword({'amulet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I've collected quite a few protection amulets, and some amulets of loss as well. Also, I'm interested in buying broken amulets."})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())