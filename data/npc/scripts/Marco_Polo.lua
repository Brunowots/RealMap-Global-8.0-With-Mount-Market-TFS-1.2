dofile('data/lib/QuestPoints/Quest.lua')
dofile('data/lib/QuestPoints/Show.lua')

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
	
local marks = {
				[0] = {pos = {x = 32032, y = 32276, z = 5}, type = MAPMARK_BAG, description = "Armor"},
				[1] = {pos = {x = 32033, y = 32275, z = 7}, type = MAPMARK_BAG, description = "Weapon and Shield"},
				[2] = {pos = {x = 32033, y = 32278, z = 8}, type = MAPMARK_BAG, description = "Torch"},
				[3] = {pos = {x = 32059, y = 32265, z = 7}, type = MAPMARK_BAG, description = "Shovel"},
				[4] = {pos = {x = 32067, y = 32264, z = 8}, type = MAPMARK_BAG, description = "Rope"},
				[5] = {pos = {x = 32070, y = 32266, z = 7}, type = MAPMARK_SHOVEL, description = "Use Shovel"},
				[6] = {pos = {x = 32075, y = 32257, z = 7}, type = MAPMARK_GREENNORTH, description = "Exit"}			
			}
			
	
	
	local player = Player(cid)
	if(msgcontains(msg, "quest")) then
	
		if(player:getStorageValue(50094) == -1) then	
			npcHandler:say({
						'Welcome to the world of Tibia! ...',
						'In Tibia there are endless treasures to discover .. help me and I will reward you with great rewards...',
						'In this small island we start with the most basic ... on your map I marked where the basic testers are located .. good luck'
					}, cid)	
					
			for i = 0, #marks do 
				player:addMapMark(marks[i].pos, marks[i].type, marks[i].description)
			end
			
		else	

			--Modal Windows Int		
			ShowModal(player, "Rookgaard")
						
		end
	
	elseif(msgcontains(msg, "Marks")) then
	--Marks system
		npcHandler:say({
						'What is the quest you want to mark on the map?',						
					}, cid)	
		npcHandler.topic[cid] = 3
	
	
	elseif(npcHandler.topic[cid] == 3) then	
			buyMarks(player,msg)
			

	elseif(msgcontains(msg, "Points")) then
		local QuestPoints = 0
		
		for i = 0, #Quest do			
			if Quest[i].City == "Rookgaard" then
				if player:getStorageValue(Quest[i].Store) >= Quest[i].Qvalue then
					QuestPoints = QuestPoints +Quest[i].Points					
				end	
			end				
		end
		db.query("UPDATE `players` SET `QuestPoints` = " .. QuestPoints .. " WHERE `id` = " .. getPlayerGUID(cid))	
		
		npcHandler:say({
						'You have the amount of  {' .. QuestPoints .. '}  Quest Points...',
						'Remember.. Always come and validate with me the amount of points you have to get the {benefits}.'
					}, cid)	
	
	elseif(msgcontains(msg, "benefits")) then
		npcHandler:say({
						'In Main Land find {Tibian Cortes} to get the benefits.. The Exp benefits you only need logout and login.'
					}, cid)	
	
	end
	
	
	
	
	
	
	return true
end


npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)