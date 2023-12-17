local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the head pyromancer of Kazordoon."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Pydar Firefist, Son of Fire, from the Savage Axes."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is our world."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our city was founded in ancient times. Abandoned by the gods we once fought for, we created a secure haven for our people."})
keywordHandler:addKeyword({'old'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This mountain is said to be the oldest in the world. It is the place where fire and earth meet and separate at the same time."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Stupid race. They have no understanding of the ways of the world."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They took the place dwarves once held in the world. They don't see that they are destined to fall just like we did."})
keywordHandler:addKeyword({'orc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The arch enemy. We could have destroyed them long ago, but this would have meant doing a favour to the gods which betrayed us."})
keywordHandler:addKeyword({'minotaur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Another pawn the gods do not care for any longer. A discarded toy like all of the elder races."})
keywordHandler:addKeyword({'pyromanacer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are the keepers and shepherds of the elemental force of fire."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The ways of the gods are imprehensible to mortals. On the other hand, the elements are raw forces and can be understood and tamed."})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Unlike the gods, the elements don't use mortals as toys, A skilled mind can understand and even control them to some extent."})
keywordHandler:addKeyword({'flame'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Unlike the gods, the elements don't use mortals as toys, A skilled mind can understand and even control them to some extent."})
keywordHandler:addKeyword({'durin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Though we are through with the so-called gods, Durin, the first dwarf to aquire divine powers of his own, is considered a protector of our race."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Life feeds on fire and ultimately fire will feed on life."})
keywordHandler:addKeyword({'plant'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care much about plants."})
keywordHandler:addKeyword({'citizen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Many brave people are citizens of our town."})
keywordHandler:addKeyword({'kroox'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a smith. If you are looking for exquisite weapons and armour just talk to him."})
keywordHandler:addKeyword({'jimbin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He and his wife are running the Jolly Axeman tavern."})
keywordHandler:addKeyword({'maryza'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She and her husband are running the Jolly Axeman tavern."})
keywordHandler:addKeyword({'bezil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bezil and Nezil are buying and selling equipment of all kinds."})
keywordHandler:addKeyword({'nezil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bezil and Nezil are buying and selling equipment of all kinds."})
keywordHandler:addKeyword({'uzgod'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uzgod is a weaponsmith just like those in the old legends."})
keywordHandler:addKeyword({'etzel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Etzel is a true master of the elements. He is a role-model for our youngsters, jawoll."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The leader of the Thaian Knights' guild is a man of few words."})
keywordHandler:addKeyword({'duria'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She is the first knight of Kazordoon. She is responsible for teaching our young warriors how to handle an axe."})
keywordHandler:addKeyword({'emperor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our emperor has his halls in the upper caves."})
keywordHandler:addKeyword({'kruzak'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our emperor has his halls in the upper caves."})
keywordHandler:addKeyword({'geomancer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are followers of the path of earth."})
keywordHandler:addKeyword({'technomancer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those heretics believe they have discovered a new elemental force they can control easily. These fools, they'll bring doom on us all!"})
keywordHandler:addKeyword({'motos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the fiercest axefighter of our times and a fine strategist."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the fiercest axefighter of our times and a fine strategist."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our armies can defend Kazordoon against any threat by means of its strong  fortifications."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If he ever dares enter Kazordoon I will gladly dump him into the lava. Tthe sacred flame shall bring justice upon him."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A weapon too powerful to be wielded by mortals. It has to be returned to the fire which gave birth to it."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a busy man. I have no time for idle chitchat."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "May the great flame devour them all!"})
keywordHandler:addKeyword({'devil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They mock the great flame by their existence. BLAST THEM ALL! Jawoll!"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I an not here to help; you have to help yourself."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask around. There's a lot to do, jawoll."})
keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Gold has been given birth to by the great flame. So it is wise to give some back to the fire now and then."})
keywordHandler:addKeyword({'money'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Gold has been given birth to by the great flame. So it is wise to give some back to the fire now and then."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bezil and Nezil are runing a shop where you can buy all the stuff you need."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You should fight like fire, fearless and without mercy."})

local blessTable = {
	["embrace"] = "The druids north of Carlin will provide you with the embrace of tibia.",
	["suns"] = "You can ask for the blessing of the two suns in the suntower near Ab'Dendriel.",
	["wisdom"] = "Talk to the hermit Eremo on the isle of Cormaya about this blessing.",
	["spiritual"] = "You can ask for the blessing of spiritual shielding the whiteflower temple south of Thais."
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local npc = Npc()
	local table = blessTable[msg]
	if table then
		npc:say(table, TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "heal") then
		if player:getHealth() < 40 then
			npc:say("You are looking really bad. Let me heal your wounds.", TALKTYPE_SAY)
			player:addHealth(40)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		else
			npc:say("You aren't looking really bad. Sorry, I can't help you.", TALKTYPE_SAY)
		end
	elseif msgcontains(msg, 'bless') then
		npc:say("There are five different blessings available in five sacred places. These blessings are: the spiritual shielding, the spark of the phoenix, the embrace of tibia, the fire of the suns and the wisdom of solitude.", TALKTYPE_SAY)
	elseif msgcontains(msg, 'spark') or msgcontains(msg, 'phoenix') then
		npc:say("The spark of the phoenix is given by me and by the great pyromancer in the nearby firetemple. Do you wish to receive my part of the blessing of the phoenix?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
       if not player:hasBlessing(3) then
			if player:removeMoney(5000) then
				player:addBlessing(3)
				npc:say("So receive the blessing of the live-giving earth, pilgrim.", TALKTYPE_SAY)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				npcHandler.topic[cid] = 0
			else
				 npc:say("Oh. You do not have enough money.", TALKTYPE_SAY)
				 npcHandler.topic[cid] = 0
			end					
		else
			npc:say("You have already this blessing.", TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())