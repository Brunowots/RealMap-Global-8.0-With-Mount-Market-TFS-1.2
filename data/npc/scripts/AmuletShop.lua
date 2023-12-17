local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
 
shopModule:addBuyableItem({'scarf'}, 2661, 250, 'scarf')
shopModule:addBuyableItem({'bronze amulet'}, 2172, 250, 'bronze amulet')
shopModule:addBuyableItem({'silver amulet'}, 2170, 250, 'silver amulet')
shopModule:addBuyableItem({'garlic necklace'}, 2199, 250, 'garlic necklace')
shopModule:addBuyableItem({'protection amulet'}, 2200, 250, 'protection amulet')
shopModule:addBuyableItem({'dragon necklace'}, 2201, 250, 'dragon necklace')
shopModule:addBuyableItem({'strange talisman'}, 2161, 250, 'strange talisman')
shopModule:addBuyableItem({'crystal necklace'}, 2125, 250, 'crystal necklace')
shopModule:addBuyableItem({'amulet of loss'}, 2173, 10000, 'crystal necklace')
 
npcHandler:addModule(FocusModule:new())