local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'rope'}, 					Cfrope, 8)

shopModule:addBuyableItem({'torch'}, 					Cftorch, 2)
shopModule:addBuyableItem({'candelabrum'}, 					Cfcandelabrum, 8)
shopModule:addBuyableItem({'candlestick'}, 					Cfcandlestick, 2)
shopModule:addBuyableItem({'bag'}, 					Cfyellowbag, 4)
shopModule:addBuyableItem({'scroll'}, 					Cfscroll, 5)
shopModule:addBuyableItem({'document'}, 					Cfdocument, 12)
shopModule:addBuyableItem({'parchment'}, 					Cfparchment, 8)
shopModule:addBuyableItem({'shovel'}, 					Cfshovel, 10)
shopModule:addBuyableItem({'backpack'}, 					Cfyellowbackpack, 10)
shopModule:addBuyableItem({'scythe'}, 					Cfscythe, 50)
shopModule:addBuyableItem({'pick'}, 					Cfpick, 50)
shopModule:addBuyableItem({'watch'}, 					Cfwatch, 20)
shopModule:addBuyableItem({'rope'}, 					Cfrope, 50)
shopModule:addBuyableItem({'rod'}, 					Cffishingrod, 150, 0, 'fishing rod')
shopModule:addBuyableItem({'crowbar'}, 					Cfcrowbar, 260)
shopModule:addBuyableItem({'present'}, 					Cfpresent, 10)
shopModule:addBuyableItem({'bucket'}, 					Cfbucket, 4, 0)
shopModule:addBuyableItem({'cup'}, 					Cfcup, 2, 0)
shopModule:addBuyableItem({'plate'}, 					Cfplate, 6)
shopModule:addBuyableItem({'bottle'}, 					Cfbottle, 3, 0)
shopModule:addBuyableItem({'oil'}, 					2006, 20, 11, 'vial of oil')
shopModule:addBuyableItem({'water'}, 					Cfwaterhose, 40, 0, 'water hose')
shopModule:addBuyableItem({'worm'}, 					Cfworm, 1, 0, 'worms')

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, I guess your cleverness already made the profession of the humble equipment tradesman obvious to you."})
keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, candlesticks, candelabras, and oil, o seeker of enlightment."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Halif Ibn Onor, known as Halif the honest."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would love to tell you the time, but I can not make the watchmaker's kids starve as a gazelle in the heart of the desert."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am deeply sorry but you have to look for that elsewhere."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, bags, ropes, backpacks, plates, cups, scrolls, documents, parchments, watches, fishing rods and worms. Of course, I sell lightsources, too."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, bags, ropes, backpacks, plates, cups, scrolls, documents, parchments, watches, fishing rods and worms. Of course, I sell lightsources, too."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, bags, ropes, backpacks, plates, cups, scrolls, documents, parchments, watches, fishing rods and worms. Of course, I sell lightsources, too."})
keywordHandler:addKeyword({'hav'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, bags, ropes, backpacks, plates, cups, scrolls, documents, parchments, watches, fishing rods and worms. Of course, I sell lightsources, too."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, bags, ropes, backpacks, plates, cups, scrolls, documents, parchments, watches, fishing rods and worms. Of course, I sell lightsources, too."})

npcHandler:addModule(FocusModule:new())