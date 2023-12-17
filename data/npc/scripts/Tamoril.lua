local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                            npcHandler:onThink()                        end

local function greetCallback(cid)
	npcHandler:setMessage(MESSAGE_GREET, "Another pesky mortal who believes his gold outweighs his nutrition value.")
	return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

	local player = Player(cid)
	if msgcontains(msg, "first dragon") then
		npcHandler:say("The First Dragon? The first of all of us? The Son of Garsharak? I'm surprised you heard about him. It is such a long time that he wandered Tibia. Yet, there are some {rumours}.", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "rumours") and npcHandler.topic[cid] == 1 then
		npcHandler.topic[cid] = 2
		npcHandler:say("It is told that the First Dragon had four {descendants}, who became the ancestors of the four kinds of dragons we know in Tibia. They perhaps still have knowledge about the First Dragon's whereabouts - if one could find them.", cid)
	elseif msgcontains(msg, "descendants") and npcHandler.topic[cid] == 2 then
		npcHandler.topic[cid] = 3
		npcHandler:say("The names of these four are Tazhadur, Kalyassa, Gelidrazah and Zorvorax. Not only were they the ancestors of all dragons after but also the primal representation of the {draconic incitements}. About whom do you want to learn more?", cid)
	elseif msgcontains(msg, "draconic incitements") and npcHandler.topic[cid] == 3 then
		npcHandler.topic[cid] = 4
		npcHandler:say({
			'Each kind of dragon has its own incitement, an important aspect that impels them and occupies their mind. For the common dragons this is the lust for power, for the dragon lords the greed for treasures. ...',
			'The frost dragons\' incitement is the thirst for knowledge und for the undead dragons it\'s the desire for life, as they regret their ancestor\'s mistake. ...',
			'These incitements are also a kind of trial that has to be undergone if one wants to {find} the First Dragon\'s four descendants.'
		}, cid)
	elseif msgcontains(msg, "find") then
		npcHandler.topic[cid] = 5
		npcHandler:say("What do you want to do, if you know about these mighty dragons' abodes? Go there and look for a fight?", cid)
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 5 then
		npcHandler.topic[cid] = 6
		npcHandler:say({
			' Fine! I\'ll tell you where to find our ancestors. You now may ask yourself why I should want you to go there and fight them. It\'s quite simple: I am a straight descendant of Kalyassa herself. She was not really a caring mother. ...',
			'No, she called herself an empress and behaved exactly like that. She was domineering, farouche and conceited and this finally culminated in a serious quarrel between us. ...',
			'I sought support by my aunt and my uncles but they were not a bit better than my mother was! So, feel free to go to their lairs and challenge them. I doubt you will succeed but then again that\'s not my problem. ...',
			'So, you want to know about their secret lairs?'
		}, cid)
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 6 then
		npcHandler:say({
			'So listen: The lairs are secluded and you can only reach them by using a magical gem teleporter. You will find a teleporter carved out of a giant emerald in the dragon lairs deep beneath the Darama desert, which will lead you to Tazhadur\'s lair. ...',
			'A ruby teleporter located in the western Dragonblaze Peaks allows you to enter the lair of Kalyassa. A teleporter carved out of sapphire is on the island Okolnir and leads you to Gelidrazah\'s lair. ...',
			'And finally an amethyst teleporter in undead-infested caverns underneath Edron allows you to enter the lair of Zorvorax.'
		}, cid)
		npcHandler.topic[cid] = 0
		player:setStorageValue(Storage.FirstDragon.Start, 1)
	end
	return true
end
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

keywordHandler:addSpellKeyword({'animate','dead'}, {npcHandler = npcHandler, spellName = 'Animate Dead', price = 1200, level = 27, vocation ={1}})
keywordHandler:addSpellKeyword({'creature','illusion'}, {npcHandler = npcHandler, spellName = 'Creature Illusion', price = 1000, level = 23, vocation ={1}})
keywordHandler:addSpellKeyword({'cure','poison'}, {npcHandler = npcHandler, spellName = 'Cure Poison', price = 150, level = 10, vocation ={1}})
keywordHandler:addSpellKeyword({'death','strike'}, {npcHandler = npcHandler, spellName = 'Death Strike', price = 800, level = 16, vocation ={1}})
keywordHandler:addSpellKeyword({'destroy','field'}, {npcHandler = npcHandler, spellName = 'Destroy Field', price = 700, level = 17, vocation ={1}})
keywordHandler:addSpellKeyword({'disintegrate'}, {npcHandler = npcHandler, spellName = 'Disintegrate', price = 900, level = 21, vocation ={1}})
keywordHandler:addSpellKeyword({'energy','beam'}, {npcHandler = npcHandler, spellName = 'Energy Beam', price = 1000, level = 23, vocation ={1}})
keywordHandler:addSpellKeyword({'energy','bomb'}, {npcHandler = npcHandler, spellName = 'Energy Bomb', price = 2300, level = 37, vocation ={1}})
keywordHandler:addSpellKeyword({'energy','field'}, {npcHandler = npcHandler, spellName = 'Energy Field', price = 700, level = 18, vocation ={1}})
keywordHandler:addSpellKeyword({'energy','strike'}, {npcHandler = npcHandler, spellName = 'Energy Strike', price = 800, level = 12, vocation ={1}})
keywordHandler:addSpellKeyword({'energy','wall'}, {npcHandler = npcHandler, spellName = 'Energy Wall', price = 2500, level = 41, vocation ={1}})
keywordHandler:addSpellKeyword({'energy','wave'}, {npcHandler = npcHandler, spellName = 'Energy Wave', price = 2500, level = 38, vocation ={1}})
keywordHandler:addSpellKeyword({'explosion'}, {npcHandler = npcHandler, spellName = 'Explosion', price = 1800, level = 31, vocation ={1}})
keywordHandler:addSpellKeyword({'find','person'}, {npcHandler = npcHandler, spellName = 'Find Person', price = 80, level = 8, vocation ={1}})
keywordHandler:addSpellKeyword({'fire','bomb'}, {npcHandler = npcHandler, spellName = 'Fire Bomb', price = 1500, level = 27, vocation ={1}})
keywordHandler:addSpellKeyword({'fire','field'}, {npcHandler = npcHandler, spellName = 'Fire Field', price = 500, level = 15, vocation ={1}})
keywordHandler:addSpellKeyword({'fire','wall'}, {npcHandler = npcHandler, spellName = 'Fire Wall', price = 2000, level = 33, vocation ={1}})
keywordHandler:addSpellKeyword({'fire','wave'}, {npcHandler = npcHandler, spellName = 'Fire Wave', price = 850, level = 18, vocation ={1}})
keywordHandler:addSpellKeyword({'fireball'}, {npcHandler = npcHandler, spellName = 'Fireball', price = 1600, level = 27, vocation ={1}})
keywordHandler:addSpellKeyword({'flame','strike'}, {npcHandler = npcHandler, spellName = 'Flame Strike', price = 800, level = 14, vocation ={1}})
keywordHandler:addSpellKeyword({'great','energy','beam'}, {npcHandler = npcHandler, spellName = 'Great Energy Beam', price = 1800, level = 29, vocation ={1}})
keywordHandler:addSpellKeyword({'great','light'}, {npcHandler = npcHandler, spellName = 'Great Light', price = 500, level = 13, vocation ={1}})
keywordHandler:addSpellKeyword({'haste'}, {npcHandler = npcHandler, spellName = 'Haste', price = 600, level = 14, vocation ={1}})
keywordHandler:addSpellKeyword({'heavy','magic','missile'}, {npcHandler = npcHandler, spellName = 'Heavy Magic Missile', price = 1500, level = 25, vocation ={1}})
keywordHandler:addSpellKeyword({'ice','strike'}, {npcHandler = npcHandler, spellName = 'Ice Strike', price = 800, level = 15, vocation ={1}})
keywordHandler:addSpellKeyword({'intense','healing'}, {npcHandler = npcHandler, spellName = 'Intense Healing', price = 350, level = 20, vocation ={1}})
keywordHandler:addSpellKeyword({'invisible'}, {npcHandler = npcHandler, spellName = 'Invisible', price = 2000, level = 35, vocation ={1}})
keywordHandler:addSpellKeyword({'levitate'}, {npcHandler = npcHandler, spellName = 'Levitate', price = 500, level = 12, vocation ={1}})
keywordHandler:addSpellKeyword({'light'}, {npcHandler = npcHandler, spellName = 'Light', price = 0, level = 8, vocation ={1}})
keywordHandler:addSpellKeyword({'light','healing'}, {npcHandler = npcHandler, spellName = 'Light Healing', price = 0, level = 8, vocation ={1}})
keywordHandler:addSpellKeyword({'light','magic','missile'}, {npcHandler = npcHandler, spellName = 'Light Magic Missile', price = 500, level = 15, vocation ={1}})
keywordHandler:addSpellKeyword({'magic','rope'}, {npcHandler = npcHandler, spellName = 'Magic Rope', price = 200, level = 9, vocation ={1}})
keywordHandler:addSpellKeyword({'magic','shield'}, {npcHandler = npcHandler, spellName = 'Magic Shield', price = 450, level = 14, vocation ={1}})
keywordHandler:addSpellKeyword({'magic','wall'}, {npcHandler = npcHandler, spellName = 'Magic Wall', price = 2100, level = 32, vocation ={1}})
keywordHandler:addSpellKeyword({'poison','field'}, {npcHandler = npcHandler, spellName = 'Poison Field', price = 300, level = 14, vocation ={1}})
keywordHandler:addSpellKeyword({'poison','wall'}, {npcHandler = npcHandler, spellName = 'Poison Wall', price = 1600, level = 29, vocation ={1}})
keywordHandler:addSpellKeyword({'soulfire'}, {npcHandler = npcHandler, spellName = 'Soulfire', price = 1800, level = 27, vocation ={1}})
keywordHandler:addSpellKeyword({'stalagmite'}, {npcHandler = npcHandler, spellName = 'Stalagmite', price = 1400, level = 24, vocation ={1}})
keywordHandler:addSpellKeyword({'strong','haste'}, {npcHandler = npcHandler, spellName = 'Strong Haste', price = 1300, level = 20, vocation ={1}})
keywordHandler:addSpellKeyword({'sudden','death'}, {npcHandler = npcHandler, spellName = 'Sudden Death', price = 3000, level = 45, vocation ={1}})
keywordHandler:addSpellKeyword({'summon','creature'}, {npcHandler = npcHandler, spellName = 'Summon Creature', price = 2000, level = 25, vocation ={1}})
keywordHandler:addSpellKeyword({'summon','thundergiant'}, {npcHandler = npcHandler, spellName = 'Summon Thundergiant', price = 50000, level = 200, vocation ={1}})
keywordHandler:addSpellKeyword({'terra','strike'}, {npcHandler = npcHandler, spellName = 'Terra Strike', price = 800, level = 13, vocation ={1}})
keywordHandler:addSpellKeyword({'thunderstorm'}, {npcHandler = npcHandler, spellName = 'Thunderstorm', price = 1100, level = 28, vocation ={1}})
keywordHandler:addSpellKeyword({'ultimate','healing'}, {npcHandler = npcHandler, spellName = 'Ultimate Healing', price = 1000, level = 30, vocation ={1}})
keywordHandler:addSpellKeyword({'ultimate','light'}, {npcHandler = npcHandler, spellName = 'Ultimate Light', price = 1600, level = 26, vocation ={1}})
keywordHandler:addKeyword({'attack', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Death Strike}', '{Energy Beam}', '{Energy Strike}', '{Energy Wave}', '{Fire Wave}', '{Flame Strike}', '{Great Energy Beam}', '{Ice Strike}' and '{Terra Strike}'."})
keywordHandler:addKeyword({'healing', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Cure Poison}', '{Intense Healing}', '{Light Healing}' and '{Ultimate Healing}'."})
keywordHandler:addKeyword({'support', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Animate Dead}', '{Creature Illusion}', '{Destroy Field}', '{Disintegrate}', '{Energy Bomb}', '{Energy Field}', '{Energy Wall}', '{Explosion}', '{Find Person}', '{Fire Bomb}', '{Fire Field}', '{Fire Wall}', '{Fireball}', '{Great Light}', '{Haste}', '{Heavy Magic Missile}', '{Invisible}', '{Levitate}', '{Light}', '{Light Magic Missile}', '{Magic Rope}', '{Magic Shield}', '{Magic Wall}', '{Poison Field}', '{Poison Wall}', '{Soulfire}', '{Stalagmite}', '{Strong Haste}', '{Sudden Death}', '{Summon Creature}', '{Summon Thundergiant}', '{Thunderstorm}' and '{Ultimate Light}'."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'I can teach you {Attack spells}, {Healing spells} and {Support spells}.'})