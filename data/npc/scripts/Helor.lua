local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a paladin and a teacher."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Helor."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king will learn about the things happening here and he will be not amused."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those tradesmen would gladly sell their souls. And they would sell them cheap."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais has its mistakes but it's a town's people that form a society and it's its people that have to be blamed for a society's failure."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In their own way they are still following the word of the gods."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are certain problems in Edron for sure and the defection of some of the knights was a great loss and caused much shame. But we are growing on the obstacles we have to overcome."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The jungle is a challenge and even here in this city you can feel its corruptive influence. It's always lurking to crush the ones that are weak in body or mind."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The face of the world was sculpted by conflicts of the gods and the mortals."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarves abandoned the gods because they are shortsighted. They are lost people."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarves abandoned the gods because they are shortsighted. They are lost people."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarves abandoned the gods because they are shortsighted. They are lost people."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The believes of the elves are just a pack of lies to comfort their vanity. Only the gods have the power to elevate us beyond the restrictions of our mortal form. The elves' vanity will lead them to nothing."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The believes of the elves are just a pack of lies to comfort their vanity. Only the gods have the power to elevate us beyond the restrictions of our mortal form. The elves' vanity will lead them to nothing."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The believes of the elves are just a pack of lies to comfort their vanity. Only the gods have the power to elevate us beyond the restrictions of our mortal form. The elves' vanity will lead them to nothing."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's up to us to fulfil the will of the gods even here at this remote continent."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The people there are not evil, they just follow a terribly wrong philosophy."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "An abnormality leading an abnormal cult. The day will come where our forces are strong enough to cleanse the city and the minds of the people."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Evil has many faces. He is only one of them."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A weapon that should be used to slay evil wherever it shows its ugly face."})
keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are intelligent enough to raid Port Hope in order to steal tools, so unlike other animals they are responsible for their wrongdoing and should be punished."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lizards are aggressive enemies. It's obvious they never heard about our gods and their ideals."})
keywordHandler:addKeyword({'dworc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are just another breed of orcs and they will be treated like them."})

npcHandler:addModule(FocusModule:new())