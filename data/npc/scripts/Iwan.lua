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

shopModule:addBuyableItem({'wedding ring'}, 					Cfweddingring, 990)
shopModule:addBuyableItem({'golden amulet'}, 					Cfgoldenamulet, 6600)
shopModule:addBuyableItem({'ruby necklace'}, 					Cfrubynecklace, 3560)
shopModule:addBuyableItem({'white pearl'}, 					Cfwhitepearl, 320)
shopModule:addBuyableItem({'black pearl'}, 					Cfblackpearl, 560)
shopModule:addBuyableItem({'small diamond'}, 					Cfsmalldiamond, 600)
shopModule:addBuyableItem({'small sapphire'}, 					Cfsmallsapphire, 500)
shopModule:addBuyableItem({'small ruby'}, 					Cfsmallruby, 500)
shopModule:addBuyableItem({'small emerald'}, 					Cfsmallemerald, 500)
shopModule:addBuyableItem({'small amethyst'}, 					Cfsmallamethyst, 400)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell gems of all kind."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am sure even the king would appreciate my wares."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am sure even the king would appreciate my wares."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know not much about the local army."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hope the academy is safe from his assaults."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am sure you'd easily recognize it by the gems attached to it."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We supply Thais with gems found on this isle."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know only so little about our world. It's a pity."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I never visited that city."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our island is rich in precious stones."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I haven't been told anything of interest lately."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I haven't been told anything of interest lately."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you various gems, pearls or some wonderful jewels."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you various gems, pearls or some wonderful jewels."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you various gems, pearls or some wonderful jewels."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you various gems, pearls or some wonderful jewels."})
keywordHandler:addKeyword({'gem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy and sell small diamonds, small sapphires, small rubies, small emeralds, and small amethysts."})
keywordHandler:addKeyword({'pearl'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are white and black pearls you can buy or sell."})
keywordHandler:addKeyword({'jewel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Currently you can purchase wedding rings, golden amulets, and ruby necklaces."})

npcHandler:addModule(FocusModule:new())