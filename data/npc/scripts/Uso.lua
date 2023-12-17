local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the head of a little mining operation here and I train knights in my spare time to prevent my old body from rusting."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am called Uso Oredigger, son of the flame from the dragoneater fellowship."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time is of little importance at this forsaken place."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There is a somewhat provisional temple of the humans here."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Human kings are not of my concern."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To me one human is like the other. I don't care what city they are from."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To me one human is like the other. I don't care what city they are from."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To me one human is like the other. I don't care what city they are from."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To me one human is like the other. I don't care what city they are from."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "All those trees and the heat are horrible. If it wasn't for the gold, we wouldn't be here, jawoll."})
keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There IS gold out there. And a lot of it. I can feel it in my old bones."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We dwarves call it our home since the dawn of time. I miss Kazordoon a lot, but gold is of more importance. After I have made a fortune here I will return home and might settle down."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are a proud race. Dwarves are strong and fearless. Even in this forsaken jungle we can survive, jawoll."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are a proud race. Dwarves are strong and fearless. Even in this forsaken jungle we can survive, jawoll."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is no city but just a bunch of trees."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I wonder why we see so few elves over here. Those tree people should love this cursed jungle. But even they stay away from here. It makes me wonder why."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I wonder why we see so few elves over here. Those tree people should love this cursed jungle. But even they stay away from here. It makes me wonder why."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I wonder which part of Darama is worst, that jungle or that desert. This whole continent is a dwarf's nightmare."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Another monument of the madness of the human race. Worship of death or undeath or whatever ... I wonder how often I must be slammed on my head to think of such a crazy idea."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He would be at least a diversion from all those crawling and flying insects."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If it ever had been in this area, it surely would be rusted through by now."})
keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It wouldn't surprise me if they were only elves disguised with furs."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They say the lizards had a lot of gold in their ancient cities. Perhaps one day we will go there and look for it."})
keywordHandler:addKeyword({'dworc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I recently broke the nose of a guy who dared to claim that those headhunters are related to dwarves."})

npcHandler:addModule(FocusModule:new())