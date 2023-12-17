local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... Selling Spells"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... Chatterbone"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... Time?... Not important... anymore."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "..."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "..."})
keywordHandler:addKeyword({'vladruc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... Maaaaassssterrrrr"})
keywordHandler:addKeyword({'urghain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... Maaaaassssterrrrr"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... un...important"})
keywordHandler:addKeyword({'market'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... You buy?"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... we hid it... so long ago... so long..."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... they build a new city... Carlin shall be its name..."})
keywordHandler:addKeyword({'flaming'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... we conquered them... held them so long... long ago..."})
keywordHandler:addKeyword({'inferno'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... we conquered them... held them so long... long ago..."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... You... buy spells?"})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... You... buy spells?"})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... Ask Smiley..."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... You buy book... store spells... other counter..."})
keywordHandler:addKeyword({'rune'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "... Runes... mighty stones... other counter..."})

npcHandler:addModule(FocusModule:new())