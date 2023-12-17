local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the chief druid. I am responsible for all members."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Marvik. Probably you heard from me."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Eh, I haven't seen daylight for a long time. So, don't ask me, what time it is."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kings come and go."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kings come and go."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a great healer."})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Though she focuses not only on Crunor, she is an enlightened person."})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I understand, he's a warrior of some kind."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about armies."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about armies."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A misguided follower of evil."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "An armourer."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A shopkeeper."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A little more seriousity would suite him well."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Paladins are quite proud of their magic but lack the understandig of the powers they wield."})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "So much power and so little philosophy ... a dangerous combination indeed."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Warriors are the main recipients of our healing powers."})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Marvik is my name, so what?"})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't like his kind of humour."})
keywordHandler:addKeyword({'baxter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know him."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He saws the seeds of evil through spreading rumours."})
keywordHandler:addKeyword({'sherry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are true believers."})
keywordHandler:addKeyword({'donald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are true believers."})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are true believers."})
keywordHandler:addKeyword({'caress'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It was a small order of druids in the past. Their followers wanted the druids to become more involved with daily affairs of men."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Crunor, the eternal tree, is more than nature. Even more as the sum of each part of nature."})
keywordHandler:addKeyword({'lugri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A misguided soul who lost the path in the darkness."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even in my visions, I couldn't get any enlightenment about the whereabouts of this weapon of legend."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Why are you so concerned with news, if you haven't even understood the old things you know?"})
keywordHandler:addKeyword({'member'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our members use their magic power to protect their life and the life of other creatures."})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Everyone who joins the Druids has the opportunity to learn many magic spells."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a druid. Druids concentrate their magic on defence, healing, and nature."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorcerers are very aggressive. They use their power for fighting and killing."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your vocation is your profession. There are four vocations in Tibia: Druids, paladins, knights, and sorcerers."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In a spellbook, your spells are listed. There you will find the pronunciation of each spell. If you want to buy one, visit Muriel, the sorcerer."})
keywordHandler:addKeyword({'rod'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask Xodet about those instead! you find him in the magic shop a bit to west from here."})
keywordHandler:addKeyword({'wand'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask Xodet about those instead! you find him in the magic shop a bit to west from here."})

local function greetCallback(cid)
	if Player(cid):isDruid() then
		npcHandler:setMessage(MESSAGE_GREET, "Nice to see you again, |PLAYERNAME|!")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Welcome to my cave, |PLAYERNAME|! How may I help you?")
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
