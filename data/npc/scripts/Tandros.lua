local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling items of magic power such as runes, life fluids and mana fluids."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Tandros the magnificent."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is a crime against the order of things to try measuring time. The very thought of squeezing the majesty of centuries and centuries into a puny mechanical device is blasphemy."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king is a worldly one. But if you buy enough of my fluids and runes you might become the king of magic one day."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Technically I am an employee of those trade barons of Venore but of course no one can control my magnificent mind."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is so crowded and people there are always busy. I dare to say that this is a city that has lost its magic at some point."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard there are many druids that are quite influential. They should know how to keep the magic of a place alive. I am looking forward to travel there one day."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Edron is rumoured to be a place of ancient mysteries and powerful magic."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The magic is out there somewhere."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world is full of magic that is waiting to be used ... perhaps by you! Take the first step by buying my wares to gather even more magic power for yourself."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarves have little love for magic. That makes them quite suspicious, doesn't it?"})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarves have little love for magic. That makes them quite suspicious, doesn't it?"})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarves have little love for magic. That makes them quite suspicious, doesn't it?"})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves are such marvelous, mythic creatures. They are full of magic."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves are such marvelous, mythic creatures. They are full of magic."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves are such marvelous, mythic creatures. They are full of magic."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "An unremarkable little town, but riding there by carpet is pure magic."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A city that breathes evil and dark magic. Stay away or be at least well prepared if you intend to visit the city of the dead."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He might be evil, but his powers are unimaginable! To stand a chance against evil overlords like him, you have to buy loads of my runes and fluids."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A weapon of unparalleled magic. Don't listen to people that tell you that this is only a myth. It might be a dream but remember, dreams can come true."})
keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are attacking travellers and even our settlement now and then. What can be a better way for you to survive than by preparing yourself well and to buy enough fluids and runes?"})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lizards live far away on the other side of the dangerous jungle. If you want to go there to learn more about their secrets, I strongly advise you to supply yourself with runes and fluids."})
keywordHandler:addKeyword({'dworc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dworcs are fierce enemies and the poison they use is lethal. If you don't have some fluids and runes with you, you are easy prey to them."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'items'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes spellbooks."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes spellbooks."})

npcHandler:addModule(FocusModule:new())