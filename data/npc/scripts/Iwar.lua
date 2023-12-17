local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'knight statue'}, 					3916, 50)
shopModule:addBuyableItem({'goblin statue'}, 					3930, 50)
shopModule:addBuyableItem({'minotaur statue'}, 					3925, 50)

keywordHandler:addKeyword({'statue'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell knight, goblin and minotaur statues."})

shopModule:addBuyableItem({'big table'}, 					Cfbigtable, 30)
shopModule:addBuyableItem({'square table'}, 					Cfsquaretable, 25)
shopModule:addBuyableItem({'small table'}, 					Cfsmalltable, 20)
shopModule:addBuyableItem({'small round table'}, 					Cfsmallroundtable, 25)

keywordHandler:addKeyword({'table'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell big, small, small round and square tables."})

shopModule:addBuyableItem({'wooden chair'}, 					Cfwoodenchair, 15)
shopModule:addBuyableItem({'sofa chair'}, 					Cfsofachair, 55)
shopModule:addBuyableItem({'red cushioned chair'}, 					Cfredcushionedchair, 40)
shopModule:addBuyableItem({'green cushioned chair'}, 					Cfgreencushionedchair, 40)

keywordHandler:addKeyword({'chair'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell wooden, sofa, red cushioned and green cushioned chairs."})

shopModule:addBuyableItem({'flower bowl'}, 					Cfflowerbowl, 6)
shopModule:addBuyableItem({'honey flower'}, 					Cfhoneyflower, 5)
shopModule:addBuyableItem({'potted flower'}, 					Cfpottedflower, 5)
shopModule:addBuyableItem({'indoor plant'}, 					Cfindoorplant, 8)

keywordHandler:addKeyword({'flower'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell flower bowls, honey flowers, potted flowers and indoor plants."})

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

keywordHandler:addKeyword({'pillow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell small purple, green, red, blue, orange, turqoise and white pillows. and round blue, red, purple and turqoise pillows. and square blue, red, green and yellow pillows. and also heart pillows."})

shopModule:addBuyableItem({'vase'}, 					Cfvase, 3, 0)
shopModule:addBuyableItem({'coal basin'}, 					Cfcoalbasin, 25)
shopModule:addBuyableItem({'large amphora'}, 					Cflargeamphora, 50)
shopModule:addBuyableItem({'amphora'}, 					Cfamphora, 4)

keywordHandler:addKeyword({'pottery'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell vase, coal basin, amphora and large amphora."})

shopModule:addBuyableItem({'wooden drawer'}, 					Cfwoodendrawer, 20)
shopModule:addBuyableItem({'dresser'}, 					Cfdresser, 25)
shopModule:addBuyableItem({'locker'}, 					Cflocker, 30)
shopModule:addBuyableItem({'large trunk'}, 					Cflargetrunk, 10)
shopModule:addBuyableItem({'box'}, 					1738, 10)
shopModule:addBuyableItem({'chest'}, 					1740, 10)
shopModule:addBuyableItem({'crate'}, 					1739, 10)
shopModule:addBuyableItem({'trough'}, 					1775, 7)
shopModule:addBuyableItem({'barrel'}, 					Cfbarrel, 12)

keywordHandler:addKeyword({'container'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I seel wooden drawer, dresser, locker, large trunk, box, chest, crate, barrel and trough."})

shopModule:addBuyableItem({'water pipe'}, 					Cfwaterpipe, 40)
shopModule:addBuyableItem({'coal basin'}, 					Cfcoalbasin, 25)
shopModule:addBuyableItem({'birdcage'}, 					Cfbirdcage, 50)
shopModule:addBuyableItem({'globe'}, 					Cfglobe, 50)
shopModule:addBuyableItem({'pendulum clock'}, 					Cfpendulumclock, 75)
shopModule:addBuyableItem({'table lamp'}, 					Cftablelamp, 35)
shopModule:addBuyableItem({'cuckoo clock'}, 					Cfcuckooclock, 40)
shopModule:addBuyableItem({'rocking horse'}, 					3922, 30)
shopModule:addBuyableItem({'globe'}, 					3927, 50)

keywordHandler:addKeyword({'decoration'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell coal basin, water pipe, birdcage, globe, pendulum clock, table lamp, rocking horse, globe and cuckoo clock."})

shopModule:addBuyableItem({'green tapestry'}, 					Cfgreentapestry, 25)
shopModule:addBuyableItem({'yellow tapestry'}, 					Cfyellowtapestry, 25)
shopModule:addBuyableItem({'orange tapestry'}, 					Cforangetapestry, 25)
shopModule:addBuyableItem({'red tapestry'}, 					Cfredtapestry, 25)
shopModule:addBuyableItem({'blue tapestry'}, 					Cfbluetapestry, 25)
shopModule:addBuyableItem({'white tapestry'}, 					Cfwhitetapestry, 25)

keywordHandler:addKeyword({'tapestry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell green, yellow, orange, red, blue and white tapestry."})
keywordHandler:addKeyword({'tapestries'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell green, yellow, orange, red, blue and white tapestry."})

shopModule:addBuyableItem({'wooden chair'}, 					Cfwoodenchair, 15)
shopModule:addBuyableItem({'sofa chair'}, 					Cfsofachair, 55)
shopModule:addBuyableItem({'red cushioned chair'}, 					Cfredcushionedchair, 40)
shopModule:addBuyableItem({'green cushioned chair'}, 					Cfgreencushionedchair, 40)

keywordHandler:addKeyword({'chair'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell wooden, sofa, red cushioned and green cushioned chairs."})

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me is Iwar Woodpecker, son of Earth, from the Savage Axes. Me run this store."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You moving to new home? Me specialist for equipping it."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You meaning my specials, eh?"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me no idea."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me selling statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me selling statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me selling statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me selling statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'furniture'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me selling statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me selling statues, tables, chairs, flowers, pillows, pottery, instruments, decoration, tapestries and containers."})
keywordHandler:addKeyword({'special'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My offers permanently extraordinary cheap."})

npcHandler:addModule(FocusModule:new())