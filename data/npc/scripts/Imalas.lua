local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'banana'}, 					Cfbanana, 2)
shopModule:addBuyableItem({'cherry'}, 					Cfcherry, 1)
shopModule:addBuyableItem({'grapes'}, 					Cfgrape, 3)
shopModule:addBuyableItem({'melon'}, 					Cfmelon, 8)
shopModule:addBuyableItem({'pumpkin'}, 					Cfpumpkin, 10)
shopModule:addBuyableItem({'carrot'}, 					Cfcarrot, 2)
shopModule:addBuyableItem({'cookie'}, 					Cfcookie, 2)
shopModule:addBuyableItem({'roll'}, 					Cfroll, 2)
shopModule:addBuyableItem({'brown bread'}, 					Cfbrownbread, 3)
shopModule:addBuyableItem({'egg'}, 					Cfegg, 2)
shopModule:addBuyableItem({'cheese'}, 					Cfcheese, 5)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm a shopkeeper. You can buy food here."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Imalas."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I have no watch."})
keywordHandler:addKeyword({'ghostlands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry I know nothing more then it has to be a horrible place and that scares me enough."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just have a look at my blackboard."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just have a look at my blackboard."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just have a look at my blackboard."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just have a look at my blackboard."})

npcHandler:addModule(FocusModule:new())