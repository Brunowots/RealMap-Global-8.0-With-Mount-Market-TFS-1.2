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
shopModule:addBuyableItem({'candleb'}, 					Cfcandelabrum, 8, 0, 'candelabrum')
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
shopModule:addBuyableItem({'bucket'}, 					Cfbucket, 4, 0)
shopModule:addBuyableItem({'bottle'}, 					Cfbottle, 3, 0)
shopModule:addBuyableItem({'water'}, 					Cfwaterskin, 10, 0, 'waterskin')
shopModule:addBuyableItem({'oil'}, 					2006, 20, 11, 'vial of oil')
shopModule:addBuyableItem({'worm'}, 					Cfworm, 1, 0, 'worms')

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell equipment of all kinds. Is there anything you need?"})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell shovels, picks, scythes, bags, ropes, backpacks, cups, scrolls, documents, parchments, and watches. We also sell lightsources."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Let me see ... we have shovels, picks, scythes, bags, ropes, backpacks, scrolls, watches, some lightsources, fishing rods, worms and other stuff."})
keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell torches, candlesticks, candelabra, and oil."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Bezil Coinbiter, daughter of Earth, of the Molten Rocks. I and my bro' Nezil are selling stuff, ye' know?"})
keywordHandler:addKeyword({'nezil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He's my bro'."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, visit the Jolly Axeman Tavern for that."})
keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, things like crowbars, water hoses, presents, buckets, bottles, and the like."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, things like crowbars, water hoses, presents, buckets, bottles, and the like."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, things like crowbars, water hoses, presents, buckets, bottles, and the like."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, things like crowbars, water hoses, presents, buckets, bottles, and the like."})

npcHandler:addModule(FocusModule:new())