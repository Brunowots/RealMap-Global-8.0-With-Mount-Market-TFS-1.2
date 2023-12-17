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

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a jeweller. Maybe you want to have a look at my wonderful offers."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Ishina."})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph buys the most precious gems and jewellery for himself."})
keywordHandler:addKeyword({'kazzan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph buys the most precious gems and jewellery for himself."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, I am not an expert in mythology and philosophy. Better ask the enlightened Kasmir about this."})
keywordHandler:addKeyword({'kasmir'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You will find Kasmir in the Muhayin. He's a philosopher and teacher in the ways of Daraman."})
keywordHandler:addKeyword({'muhayin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's the sacred tower. A place of solitude and meditation."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you various gems, pearls, or some wonderful jewels."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you various gems, pearls, or some wonderful jewels."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you various gems, pearls, or some wonderful jewels."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you various gems, pearls, or some wonderful jewels."})
keywordHandler:addKeyword({'gem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy and sell small diamonds, sapphires, rubies, emeralds, and amethysts."})
keywordHandler:addKeyword({'pearl'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are white and black pearls you can buy or sell."})
keywordHandler:addKeyword({'jewel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Currently you can purchase wedding rings, golden amulets, and ruby necklaces."})
keywordHandler:addKeyword({'talon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't trade or work with these magic gems. It's better you ask a mage about this."})

npcHandler:addModule(FocusModule:new())