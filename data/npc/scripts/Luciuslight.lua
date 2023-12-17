
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
	-- 45250  Quest iniciado
	-- 45251  Antorchas
	-- 45252  Puerta
	-- 45253  Cofre
	
	local player = Player(cid)
	if(msgcontains(msg, "mission")) then
		if(player:getStorageValue(45250) == -1) then			
			player:setStorageValue(45250, 1)
			player:setStorageValue(45251, 0)
			doPlayerAddItem(player,9956,1)
			npcHandler:say({
					'This magical torch will be used to light Lightbringer\'s Basin all around the world, which can be done in any order...',
					'To complete the mission, use the Magical torch in 10 Lightbringer\'s Basin...',
					'If the torch finished first.. I can give you another one for $5,000 gold coins ... you\'ll have to start again...',
					'around the world there are at least 15 Lightbringer\'s Basin.. Good luck'
				}, cid)			
		end
		
		if(player:getStorageValue(45251) >= 10  and player:getStorageValue(45252) == -1) then
			player:setStorageValue(45252, 1)		
			npcHandler:say({
					'Congratulations you have accomplished the mission!! ...',
					'Take your reward'
				}, cid)	
		end
	elseif (msgcontains(msg, "torch") and player:getStorageValue(45252) == -1) then
		if player:removeMoneyNpc(5000) then
			player:setStorageValue(45251, 0)
			doPlayerAddItem(player,9956,1)
			npcHandler:say({
					'This magical torch will be used to light Lightbringer\'s Basin all around the world, which can be done in any order...',
					'To complete the mission, light 10 Basin..',
					'If the torch finished first.. I can give you another one for $5,000 gold coins ... you\'ll have to start again...',
					'around the world there are at least 15 Lightbringer\'s Basin.. Good luck'
				}, cid)	
		else
			npcHandler:say({
					'I can give you another one for $5,000 gold coins ... you\'ll have to start again...'
				}, cid)		
		end
		
	else
		if player:removeMoneyNpc(5000) then
			doPlayerAddItem(player,9956,1)
			npcHandler:say({
					'You compleat the mission.. but if you need more take it...'
				}, cid)	
		end
		
		
	end
	
	
	return true
end




npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)