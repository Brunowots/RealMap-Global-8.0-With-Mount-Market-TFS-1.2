local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Shalmar Ibn Djinbar, the caliph's magician and astrologer."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I teach magic spells to the worthy."})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph has the strong soul needed to guide his people."})
keywordHandler:addKeyword({'kazzan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph has the strong soul needed to guide his people."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His weakness is evident by the rotting of his soul."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A strong mind and a pure soul has no need for such items."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a city of souls who failed to see the need of ascension."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world is filled with wonderous places and items."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heared it's a city of druids."})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Talk to Kasmir about that issue. It's not my place to pose as a teacher since I am a student, too."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "News are distractions. Nothing of importance happens outside your own soul."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "News are distractions. Nothing of importance happens outside your own soul."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The way of the magician is not that different from the way to ascension."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The way of the magician is not that different from the way to ascension."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm teaching spells to sorcerers and druids. I also used to sell magic goods, but my assistant Asima in the next room does that now for me."})
keywordHandler:addKeyword({'goods'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm teaching spells to sorcerers and druids. I also used to sell magic goods, but my assistant Asima in the next room does that now for me."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm teaching spells to sorcerers and druids. I also used to sell magic goods, but my assistant Asima in the next room does that now for me."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm teaching spells to sorcerers and druids. I also used to sell magic goods, but my assistant Asima in the next room does that now for me."})
keywordHandler:addKeyword({'fluid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't sell this anymore, it sort of kept on confusing me to do that much work. Please talk to my assistant Asima in the next room to purchase magic goods."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't sell this anymore, it sort of kept on confusing me to do that much work. Please talk to my assistant Asima in the next room to purchase magic goods."})

npcHandler:addModule(FocusModule:new())