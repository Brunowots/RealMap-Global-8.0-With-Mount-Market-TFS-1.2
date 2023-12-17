local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end


local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	--Mission
	if(msgcontains(msg, "mission")) then
		if(player:getStorageValue(45230) == -1) then			
			player:setStorageValue(45230, 1) 
			npcHandler:say({
					'Hmm, I think I need a proof, just to make sure. I want you to eat a bread with garlic...',
					'you need to mix flour with holy water and use that dough on garlic to create a special dough. Bake it like normal bread, but I guarantee that no vampire can eat that.'
				}, cid)
		end	
		
		if(player:getStorageValue(45230) == 2) then	
			npcHandler:say({
					'Very well. I think I can trust you now... Find {Harlow} and travel to {Vengoth} and find the vampiric crest in the crypt of the castle!'
				}, cid)
		end	
		
	end
	
	
	
	
	return true
end



npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)