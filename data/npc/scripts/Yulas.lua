local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'big table'}, 					Cfbigtable, 30)
shopModule:addBuyableItem({'round table'}, 					Cfroundtable, 25)
shopModule:addBuyableItem({'small table'}, 					Cfsmalltable, 20)
shopModule:addBuyableItem({'square table'}, 					Cfsquaretable, 20)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Yulas. I will be your salesperson today."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are into home improvement."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, we are not allowed to chat."})
keywordHandler:addKeyword({'allen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To think just because he is around here to watch what we do, he want to be considered one of us..."})
keywordHandler:addKeyword({'richardson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To think just because he is around here to watch what we do, he want to be considered one of us..."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell furniture and equipment. At this counter you can buy tables."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell furniture and equipment. At this counter you can buy tables."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell furniture and equipment. At this counter you can buy tables."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell furniture and equipment. At this counter you can buy tables."})
keywordHandler:addKeyword({'furniture'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell furniture and equipment. At this counter you can buy tables."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell furniture and equipment. At this counter you can buy tables."})
keywordHandler:addKeyword({'table'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell big tables, round tables, small tables and square tables, which would you like to buy?"})

npcHandler:addModule(FocusModule:new())