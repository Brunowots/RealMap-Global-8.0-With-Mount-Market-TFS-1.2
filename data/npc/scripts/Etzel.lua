local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local player = Player(cid)
	if player:isSorcerer() then
		npcHandler:setMessage(MESSAGE_GREET, "Hiho <cough> and welcome back, ".. player:getName() .."!")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hiho, ".. player:getName() .." <cough>")
	end	
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am der dwarfish mastermage. I am keeper of the secrets of magic."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Etzel Fireworker, <cough> son of fire, of the Molten Rocks."})
keywordHandler:addKeyword({'wisdom'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Wisdom is not aquired cheeply."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorcery is not for the lazy or the impatient."})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Great power brings great responsibility, young one."})
keywordHandler:addKeyword({'arcane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Great power brings great responsibility, young one."})
keywordHandler:addKeyword({'responsibility'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Great power brings great responsibility, young one."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Being sorcerer is belonging to a vocation of great arcane power and responsibility."})
keywordHandler:addKeyword({'rune'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't sell these anymore. <cough> I'm old and have to focus on more important things. Please ask my brother Sigurd next door. <cough>"})
keywordHandler:addKeyword({'fluid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't sell these anymore. <cough> I'm old and have to focus on more important things. Please ask my brother Sigurd next door. <cough>"})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't sell these anymore. <cough> I'm old and have to focus on more important things. Please ask my brother Sigurd next door. <cough>"})
keywordHandler:addKeyword({'wand'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't sell these anymore. <cough> I'm old and have to focus on more important things. Please ask my brother Sigurd next door. <cough>"})
keywordHandler:addKeyword({'rod'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't sell these anymore. <cough> I'm old and have to focus on more important things. Please ask my brother Sigurd next door. <cough>"})
keywordHandler:addKeyword({'vial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't buy these anymore. <cough> I'm old and have to focus on more important things. Please ask my brother Sigurd next door. <cough>"})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())