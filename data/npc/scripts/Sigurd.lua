local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Sigurd Fireworker, brother to Etzel Fireworker, son of fire, of the Molten Rocks."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I help my brother handling his little magic store so he can focus on studying spells."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'items'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})

npcHandler:addModule(FocusModule:new())