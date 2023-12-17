local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have to teach the spells of least importance to some fools."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Magister Puffels, any problem with that?"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where might I hide a watch, you fool?"})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I give nothing for kings, queens... or other people at all."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I give nothing for kings, queens... or other people at all."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fine army that is. Half of them have already deserted."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The day will come even he makes a fatal casting mistake... I know what I am talking about."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have no use for such stuff."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was there once, almost died. The fools there mistook me for an ordinary rat, can you believe that!?"})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah, the whole Tibia can &#&$*# my #$&*!"})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about some remote cities."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sciences are thriving on this isle."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard in Thais the new brand of cheese was... uhm..."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard in Thais the new brand of cheese was... uhm..."})
keywordHandler:addKeyword({'hugo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hugo? I heared it was an accident that created this beast."})
keywordHandler:addKeyword({'beast'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know more about it."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask a shop owner for that."})
keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have 'Magic Rope', 'Levitate', 'Haste', 'Berserk' 'Whirlwind Throw', 'Force Strike', 'Energy Strike', and 'Flame Strike'."})

npcHandler:addModule(FocusModule:new())