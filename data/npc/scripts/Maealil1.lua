local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a mystic."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known as Maealil."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't own one of those little machines."})
keywordHandler:addKeyword({'mystic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a philosopher and healer."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are an ancient race, abandoned by the gods and doomed to find our way alone."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They cultivate earth but don't understand it."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are somewhat orcish in their nature."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My parents were Deraisim but joined the Cenath caste before my birth."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hope they don't do something foolish one day."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Unfortunately they are to busy to care for the finer things in life."})
keywordHandler:addKeyword({'abdaisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They should join our town for their and our own safety."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would love to learn more about the Teshial."})
keywordHandler:addKeyword({'dream'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would love to learn more about the Teshial."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The great tree is the beginning for all things living and Priyla helps us to understand that."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Only another servant of evil."})
keywordHandler:addKeyword({'priyla'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The daughter of the stars gives us knowledge and teaches us magic."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is that a new kind of bug the Deraisim found?"})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know anything of importance."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Druids are great healers."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They understand so few..."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have none here."})
keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I teach the spells 'Light Healing', 'Antidote', 'Antidote Rune', 'Intense Healing', 'Intense Healing Rune, 'Ultimate Healing', and 'Ultimate Healing Rune'."})
keywordHandler:addKeyword({'bles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lifeforce of this world is waning. There are no more blessings avaliable on this world."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can heal you or even teach you some spells of healing."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, "heal") then
		if player:getHealth() < 40 then
			npc:say("You are looking really bad. Let me heal your wounds.", TALKTYPE_SAY)
			player:addHealth(40)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		else
			npc:say("You aren't looking really bad. Sorry, I can't help you.", TALKTYPE_SAY)
		end
	elseif msgcontains(msg, 'wooden stake') then
		if player:getStorageValue(1081) == 4 then
			if player:getItemCount(5941) >= 1 then
				npcHandler:say('Yes, I was informed what to do. Are you prepared to receive my line of the prayer?', cid)
				npcHandler.topic[cid] = 1
			end
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		if player:getItemCount(5941) >= 1 then
			player:setStorageValue(1081, 5)
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			npcHandler:say('So receive my prayer: \'Peace may fill your soul - evil shall be cleansed\'. Now, bring your stake to Yberius in the Venore temple for the next line of the prayer. I will inform him what to do.', cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())