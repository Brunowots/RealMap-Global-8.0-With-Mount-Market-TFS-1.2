local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a druid, an explorer and a part-time teacher."})
keywordHandler:addKeyword({'teacher'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, my studies of the local plants and animals are not cheap and I have to earn money somehow. Therefore I teach spells to other druids for a small fee."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Ustan."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those modern watches never caught my interest."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As a commoner I know little about our nobility."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A rich city with mighty trade barons that have their hands in almost every business from the furthest north to the deepest south."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I usually shun big cities and Thais is the biggest one of them."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I studied in Carlin for a while and found its inhabitants most pleasant."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was never there. Perhaps after finishing my studies here I might travel there."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The jungle is fascinating and vibrant of life. There is so much to see, to learn and to discover, it's just overwhelming."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a world full of wonders, isn't it?"})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A city of stone, deep in the interior of the earth."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarves are of a different physique than humans. Actually, this is worth to become an own field of research. I wish I'd find the time for such studies, but the jungle has priority."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarves are of a different physique than humans. Actually, this is worth to become an own field of research. I wish I'd find the time for such studies, but the jungle has priority."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A marvellous city. I travelled there often while I was studying in Carlin."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves have a different view of the world. The wars of the past hurt their collective soul, but time might heal their pain, and maybe one day they will find their way back to the gods."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves have a different view of the world. The wars of the past hurt their collective soul, but time might heal their pain, and maybe one day they will find their way back to the gods."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The continent is of fascinating diversity. The jungle, the mountains and the desert are seperate regions but united in one marvellous continent. To understand the unity in this, is to understand the world."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's an unremarkable settlement with people following a strange philosophy which I know little about."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those mad cultists mock life and Crunor's blessing, and their undead leaders are even worse. If I'd be a warrior instead of a scientist, I would fight the evil."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard he is some powerful sorcerer"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think the best weapon anyone could wield is the own mind."})
keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am sure we could reach an agreement of some kind with the ape people. They are for sure intelligent and might listen to reasonable arguments."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are fascinating and alien creatures. I wonder what kind of secrets they know about and what could be discovered about them."})
keywordHandler:addKeyword({'dworc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Given that the orcish race is able to reproduce itself with all kinds of different humanoid creatures, it is indeed a probability that the dworcs are some crossbreed as one could assume from their name."})
keywordHandler:addKeyword({'syrup'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I had some cough syrup a while ago. It was stolen in an ape raid. I fear if you want more cough syrup you will have to buy it in the druids guild in carlin."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "addon") then
		if player:getStorageValue(1048) < 1 then
			npcHandler:say("Would you like to wear bear paws like I do? No problem, just bring me 50 bear paws and 50 wolf paws and I'll fit them on.", cid)
			player:setStorageValue(1048, 1)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "paws") then
		if player:getStorageValue(1048) == 1 then
			npcHandler:say("Have you brought 50 bear paws and 50 wolf paws?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(5896, 50) and player:removeItem(5897, 50) then
				npcHandler:say("Excellent! Like promised, here are your bear paws.", cid)
				player:setStorageValue(1048, 2)
				player:addOutfitAddon(148, 1)
				player:addOutfitAddon(144, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You dont have the items.", cid)
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())