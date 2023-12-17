local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'lemonade'}, 					Cfmug, 2, 5, 'mug of lemonade')
shopModule:addBuyableItem({'beer'}, 					Cfmug, 2, 3, 'mug of beer')
shopModule:addBuyableItem({'wine'}, 					Cfmug, 3, 15, 'mug of wine')
shopModule:addBuyableItem({'water'}, 					Cfmug, 1, 1, 'mug of water')

shopModule:addBuyableItem({'cheese'}, 					Cfcheese, 6, 1, 'cheese')
shopModule:addBuyableItem({'meat'}, 					Cfmeat, 5, 1, 'meat')
shopModule:addBuyableItem({'ham'}, 					Cfham, 8, 1, 'ham')
shopModule:addBuyableItem({'bread'}, 					Cfbread, 4, 1, 'bread')

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the owner of this tavern, which is known far beyond Edron."})
keywordHandler:addKeyword({'tavern'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the owner of this tavern, which is known far beyond Edron."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He's my cousin and lives in Thais."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Mirabell."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King Tibianus III should visit our beautiful isle more often."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King Tibianus III should visit our beautiful isle more often."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sadly most of them are too disciplined to visit my tavern."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard horrible things about him."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard the Knights of the True Blood are looking for it on this isle."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais will loose influence on Edron more and more."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think Edron is the best place in Tibia."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They should return to the Thaian realm."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think it is the best place in Tibia."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, there are so many. Just ask other travellers like you."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, there are so many. Just ask other travellers like you."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you food and drinks."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you food and drinks."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you food and drinks."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you looking for food? I have bread, cheese, ham, and meat."})
keywordHandler:addKeyword({'drink'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you beer, wine, lemonade, and water."})

npcHandler:addModule(FocusModule:new())