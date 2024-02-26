local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'grape'}, 					Cfgrape, 3)
shopModule:addBuyableItem({'cherry'}, 					Cfcherry, 1)
shopModule:addBuyableItem({'apple'}, 					Cfapple, 3)
shopModule:addBuyableItem({'pear'}, 					Cfpear, 4)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Rodney."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell some local fruits."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King Tibianus! May the gods bless him!"})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King Tibianus! May the gods bless him!"})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am glad that the Thaian garrison is here to protect us."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sounds like the name of a foreign soup to me."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What is that? Is it tasty?"})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Thaian protectorate serves our beloved Venore well."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have seen only little of it."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We have little contact with far Carlin, but I heared some renegade Amazons are terrorizing the area."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our climate is quite rough, so we can only grow wheat here, but no fruits."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Rumour goes that some amazons, who where banished from Carlin, took refuge near the swamps."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Rumour goes that some amazons, who where banished from Carlin, took refuge near the swamps."})
keywordHandler:addKeyword({'amazon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Rumour goes that some amazons, who where banished from Carlin, took refuge near the swamps."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer some of the local fruits."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer some of the local fruits."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer some of the local fruits."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer some of the local fruits."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer some of the local fruits."})
keywordHandler:addKeyword({'fruit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have apples, cherries, grapes, and pears. What would you like?"})

npcHandler:addModule(FocusModule:new())