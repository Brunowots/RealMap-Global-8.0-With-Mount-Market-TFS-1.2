local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'rune'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell blank runes."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a FRANS."})
keywordHandler:addKeyword({'frans'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Floating ReeeeAnimated Necromantic Seeeervant ... FRANS."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selliiiing ruuuunes and spellbooooooks."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorcerorssss, druidssss, they all come to ussss."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorcerorssss, druidssss, they all come to ussss."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is aaaall about magic more or lesssss, isn't it?"})
keywordHandler:addKeyword({'vladruc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Heeee is the bossss. Better don't messss with him!"})
keywordHandler:addKeyword({'urghain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Heeee is the bossss. Better don't messss with him!"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Wouldn't he beeee the perfect FRANS?"})
keywordHandler:addKeyword({'market'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, that's a market heeeere, smarty ... Nice to seeeee I am not the only one without a braiiiin here."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We FRANSes don't liiiike any bugssss."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do youuuu think I am? A lousy barberrrr? I'm selliiiing ruuuunes and spellboooooks."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do youuuu think I am? A lousy barberrrr? I'm selliiiing ruuuunes and spellboooooks."})
keywordHandler:addKeyword({'items'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do youuuu think I am? A lousy barberrrr? I'm selliiiing ruuuunes and spellboooooks."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do youuuu think I am? A lousy barberrrr? I'm selliiiing ruuuunes and spellboooooks."})

npcHandler:addModule(FocusModule:new())