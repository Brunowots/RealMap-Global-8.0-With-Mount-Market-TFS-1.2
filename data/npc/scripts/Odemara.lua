local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'white pearl'}, 					Cfwhitepearl, 160)
shopModule:addSellableItem({'black pearl'}, 					Cfblackpearl, 280)
shopModule:addSellableItem({'small diamond'}, 					Cfsmalldiamond, 300)
shopModule:addSellableItem({'small sapphire'}, 					Cfsmallsapphire, 250)
shopModule:addSellableItem({'small ruby'}, 					Cfsmallruby, 250)
shopModule:addSellableItem({'small emerald'}, 					Cfsmallemerald, 250)
shopModule:addSellableItem({'small amethyst'}, 					Cfsmallamethyst, 200)

shopModule:addBuyableItem({'white pearl'}, 					Cfwhitepearl, 320)
shopModule:addBuyableItem({'black pearl'}, 					Cfblackpearl, 560)
shopModule:addBuyableItem({'small diamond'}, 					Cfsmalldiamond, 600)
shopModule:addBuyableItem({'small sapphire'}, 					Cfsmallsapphire, 500)
shopModule:addBuyableItem({'small ruby'}, 					Cfsmallruby, 500)
shopModule:addBuyableItem({'small emerald'}, 					Cfsmallemerald, 500)
shopModule:addBuyableItem({'small amethyst'}, 					Cfsmallamethyst, 400)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am responsible for buying and selling gems, pearls, and the like."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Odemara Taleris, it's a pleasure to meet you."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We offer a great assortment of gems and pearls."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We offer a great assortment of gems and pearls."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We offer a great assortment of gems and pearls."})
keywordHandler:addKeyword({'gem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We trade small diamonds, sapphires, rubies, emeralds, and amethysts."})
keywordHandler:addKeyword({'pearls'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We trade white and black pearls."})

npcHandler:addModule(FocusModule:new())