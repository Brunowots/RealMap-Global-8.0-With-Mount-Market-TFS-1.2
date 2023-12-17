local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'vial', 'potion', 'flask'}, 					Cfemptypotion, 5)

shopModule:addBuyableItem({'torch'}, 					Cftorch, 2)
shopModule:addBuyableItem({'candelabrum'}, 					Cfcandelabrum, 8)
shopModule:addBuyableItem({'candlestick'}, 					Cfcandlestick, 2)
shopModule:addBuyableItem({'bag'}, 					Cfgreybag, 4)
shopModule:addBuyableItem({'scroll'}, 					Cfscroll, 5)
shopModule:addBuyableItem({'document'}, 					Cfdocument, 12)
shopModule:addBuyableItem({'parchment'}, 					Cfparchment, 8)
shopModule:addBuyableItem({'shovel'}, 					Cfshovel, 10)
shopModule:addBuyableItem({'backpack'}, 					Cfgreybackpack, 10)
shopModule:addBuyableItem({'scythe'}, 					Cfscythe, 40)
shopModule:addBuyableItem({'pick'}, 					Cfpick, 50)
shopModule:addBuyableItem({'watch'}, 					Cfwatch, 20)
shopModule:addBuyableItem({'rope'}, 					Cfrope, 50)
shopModule:addBuyableItem({'rod'}, 					Cffishingrod, 150, 0, 'fishing rod')
shopModule:addBuyableItem({'crowbar'}, 					Cfcrowbar, 260)
shopModule:addBuyableItem({'present'}, 					Cfpresent, 10)
shopModule:addBuyableItem({'bucket'}, 					Cfbucket, 10, 0)
shopModule:addBuyableItem({'bottle'}, 					Cfbottle, 3, 0)
shopModule:addBuyableItem({'water'}, 					Cfwaterhose, 10, 0, 'water hose')
shopModule:addBuyableItem({'oil'}, 					2006, 20, 11, 'vial of oil')
shopModule:addBuyableItem({'worm'}, 					Cfworm, 1)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell equipment of all kinds. Is there anything you need?"})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell shovels, picks, scythes, bags, ropes, backpacks, cups, scrolls, documents, parchments, and watches. We also sell lightsources."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell shovels, picks, scythes, bags, ropes, backpacks, cups, scrolls, documents, parchments, and watches. We also sell lightsources."})
keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell torches, candlesticks, candelabra, and oil."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Nezil Whetstone, son of Fire, of the Savage Axes. I and my sis' Bezil are selling stuff, ye' know?"})
keywordHandler:addKeyword({'bezil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She's my sis'."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, visit the Jolly Axeman Tavern for that."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Let me see ... we have shovels, picks, scythes, bags, ropes, backpacks, scrolls, documents, parchments, watches, fishing rods, sixpacks of worms and some lightsources."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Let me see ... we have shovels, picks, scythes, bags, ropes, backpacks, scrolls, documents, parchments, watches, fishing rods, sixpacks of worms and some lightsources."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Let me see ... we have shovels, picks, scythes, bags, ropes, backpacks, scrolls, documents, parchments, watches, fishing rods, sixpacks of worms and some lightsources."})

npcHandler:addModule(FocusModule:new())