local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'small purple pillow'}, 					Cfpurplepillow, 20)
shopModule:addBuyableItem({'small green pillow'}, 					Cfgreenpillow, 20)
shopModule:addBuyableItem({'small red pillow'}, 					Cfredpillow, 20)
shopModule:addBuyableItem({'small blue pillow'}, 					Cfbluepillow, 20)
shopModule:addBuyableItem({'small orange pillow'}, 					Cforangepillow, 20)
shopModule:addBuyableItem({'small turqoise pillow'}, 					Cfturqoisepillow, 20)
shopModule:addBuyableItem({'small white pillow'}, 					Cfwhitepillow, 20)
shopModule:addBuyableItem({'heart pillow'}, 					Cfheartpillow, 30)
shopModule:addBuyableItem({'round blue pillow'}, 					Cfblueroundpillow, 25)
shopModule:addBuyableItem({'round red pillow'}, 					Cfredroundpillow, 25)
shopModule:addBuyableItem({'round purple pillow'}, 					Cfpurpleroundpillow, 25)
shopModule:addBuyableItem({'round turqoise pillow'}, 					Cfturqoiseroundpillow, 25)
shopModule:addBuyableItem({'square blue pillow'}, 					Cfbluesquarepillow, 30)
shopModule:addBuyableItem({'square red pillow'}, 					Cfredsquarepillow, 30)
shopModule:addBuyableItem({'square green pillow'}, 					Cfgreensquarepillow, 30)
shopModule:addBuyableItem({'square yellow pillow'}, 					Cfyellowsquarepillow, 30)

shopModule:addBuyableItem({'green tapestry'}, 					Cfgreentapestry, 25)
shopModule:addBuyableItem({'yellow tapestry'}, 					Cfyellowtapestry, 25)
shopModule:addBuyableItem({'orange tapestry'}, 					Cforangetapestry, 25)
shopModule:addBuyableItem({'red tapestry'}, 					Cfredtapestry, 25)
shopModule:addBuyableItem({'blue tapestry'}, 					Cfbluetapestry, 25)
shopModule:addBuyableItem({'white tapestry'}, 					Cfwhitetapestry, 25)

keywordHandler:addKeyword({'tapestry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell green, yellow, orange, red, blue and white tapestry."})
keywordHandler:addKeyword({'tapestries'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell green, yellow, orange, red, blue and white tapestry."})
keywordHandler:addKeyword({'pillow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell small purple, green, red, blue, orange, turqoise and white pillows. and round blue, red, purple and turqoise pillows. and square blue, red, green and yellow pillows. and also heart pillows."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Velvet. How can I help you?"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm working here in this shop. Are you interested in any of our goods?"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell pillows and tapestries."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell pillows and tapestries."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell pillows and tapestries."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell pillows and tapestries."})
keywordHandler:addKeyword({'furniture'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell pillows and tapestries."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell pillows and tapestries."})
keywordHandler:addKeyword({'tapestry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({'tapestrie'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})

npcHandler:addModule(FocusModule:new())