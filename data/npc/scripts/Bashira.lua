local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local rnd_sounds = 0
function onThink()
	if rnd_sounds < os.time() then
		rnd_sounds = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Welcome to Ab'Dendriel's store for general goods.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'vial', 'potion', 'flask'}, 					Cfemptypotion, 5)
shopModule:addSellableItem({'rope'}, 					Cfrope, 8)

shopModule:addBuyableItem({'torch'}, 					Cftorch, 2)
shopModule:addBuyableItem({'candelab'}, 					Cfcandelabrum, 8)
shopModule:addBuyableItem({'bag'}, 					Cfgreenbag, 4)
shopModule:addBuyableItem({'scroll'}, 					Cfscroll, 5)
shopModule:addBuyableItem({'document'}, 					Cfdocument, 12)
shopModule:addBuyableItem({'parchment'}, 					Cfparchment, 8)
shopModule:addBuyableItem({'shovel'}, 					Cfshovel, 50)
shopModule:addBuyableItem({'backpack'}, 					Cfgreenbackpack, 20)
shopModule:addBuyableItem({'scythe'}, 					Cfscythe, 50)
shopModule:addBuyableItem({'pick'}, 					Cfpick, 50)
shopModule:addBuyableItem({'watch'}, 					Cfwatch, 20)
shopModule:addBuyableItem({'rope'}, 					Cfrope, 50)
shopModule:addBuyableItem({'rod'}, 					Cffishingrod, 150, 'fishing rod')
shopModule:addBuyableItem({'present'}, 					Cfpresent, 10)
shopModule:addBuyableItem({'oil'}, 					2006, 20, 11, 'vial of oil')
shopModule:addBuyableItem({'water'}, 					Cfwaterskin, 10, 0, 'waterskin')
shopModule:addBuyableItem({'cup'}, 					Cfcup, 2, 0)
shopModule:addBuyableItem({'plate'}, 					Cfplate, 6)
shopModule:addBuyableItem({'bucket'}, 					Cfbucket, 4, 0)
shopModule:addBuyableItem({'bottle'}, 					bottle, 3, 0)
shopModule:addBuyableItem({'worm'}, 					Cfworm, 1)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell various equipment and buy some stuff."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, bags, ropes, backpacks, plates, cups, scrolls, parchments, documents, watches, various sources of light, fishing rods and worms."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, bags, ropes, backpacks, plates, cups, scrolls, parchments, documents, watches, various sources of light, fishing rods and worms."})
keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, candelabra, and oil."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Bashira Darkmark."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Carlin has some capable fighters, allthough they lack the grace of an elf."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The people of thais boast about their mighty kingdom, but eventually their short lives will doom everything they buld."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Their merchants have no patience and all to fast they loose their masks of friedlyness."})
keywordHandler:addKeyword({'roderick'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His presence here is a waste of space and talking to or even about him a waste of time."})
keywordHandler:addKeyword({'olrik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is quite amusing for a human."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's our race."})
keywordHandler:addKeyword({'dwar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They have some talent in mining and smithing."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They have nothing to give us."})
keywordHandler:addKeyword({'troll'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are lazy and clumsy. We should use dwarfs instead."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Their magic is almost as impressive as their egos."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Without us and our tools nothing would work in this town."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Useless leafeaters."})
keywordHandler:addKeyword({'abdaisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They left; perhaps we should do that, too."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A stupid Cenath-myth."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He may scare the treedwellers or the big-mouthes above, but not the Kuridai."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One god of many. They are all alike and of no use."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Buy a watch."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not dealing with food."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have shovels, picks, scythes, bags, ropes, backpacks, plates, scrolls, watches, some lightsources, and other stuff."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have shovels, picks, scythes, bags, ropes, backpacks, plates, scrolls, watches, some lightsources, and other stuff."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have shovels, picks, scythes, bags, ropes, backpacks, plates, scrolls, watches, some lightsources, and other stuff."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have shovels, picks, scythes, bags, ropes, backpacks, plates, scrolls, watches, some lightsources, and other stuff."})
keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Water hoses, pitchforks, presents, buckets, bottles, and the like."})

npcHandler:addModule(FocusModule:new())