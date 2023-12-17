dofile('data/lib/QuestPoints/Quest.lua')
dofile('data/lib/QuestPoints/Show.lua')
dofile('data/lib/QuestPoints/BuyMarks.lua')

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
	if(msgcontains(msg, "quest") and npcHandler.topic[cid] ~= 3) then			
			npcHandler:say({
						"The land of tibia is very extensive and its secrets too many ... What do you want to talk about?...",
						"{Ab'Dendriel}, {Ankrahmun}, {Carlin}, {Darashia}, {Desert}, {Edron}, {Farmine}, {Kazordoon}, {Liberty bay}, {Outfits}, {POH}, {Port Hope}, {Rookgaard}, {Svargrond}, {Thais}, {Venore}, {Yalahar} or {Tibia}?"
					}, cid)	
		    npcHandler.topic[cid] = 2
	
	elseif(npcHandler.topic[cid] == 2) then
		local playerSayCiudad = ""
		if msgcontains(msg, "Ab'Dendriel") then playerSayCiudad = "Ab'Dendriel"
		elseif msgcontains(msg, "Ankrahmun") then playerSayCiudad = "Ankrahmun" 
		elseif msgcontains(msg, "Carlin") then playerSayCiudad = "Carlin" 
		elseif msgcontains(msg, "Darashia") then playerSayCiudad = "Darashia" 
		elseif msgcontains(msg, "Desert") then playerSayCiudad = "Desert" 
		elseif msgcontains(msg, "Edron") then playerSayCiudad = "Edron" 
		elseif msgcontains(msg, "Farmine") then playerSayCiudad = "Farmine" 
		elseif msgcontains(msg, "Kazordoon") then playerSayCiudad = "Kazordoon" 
		elseif msgcontains(msg, "Liberty bay") then playerSayCiudad = "Liberty bay" 
		elseif msgcontains(msg, "Outfits") then playerSayCiudad = "Outfits" 
		elseif msgcontains(msg, "POH") then playerSayCiudad = "POH" 
		elseif msgcontains(msg, "Port Hope") then playerSayCiudad = "Port Hope" 
		elseif msgcontains(msg, "Rookgaard") then playerSayCiudad = "Rookgaard" 
		elseif msgcontains(msg, "Svargrond") then playerSayCiudad = "Svargrond" 
		elseif msgcontains(msg, "Thais") then playerSayCiudad = "Thais" 
		elseif msgcontains(msg, "Venore") then playerSayCiudad = "Venore" 
		elseif msgcontains(msg, "Yalahar") then playerSayCiudad = "Yalahar" 
		elseif msgcontains(msg, "Tibia") then playerSayCiudad = "Tibia" end
		
		
		 if playerSayCiudad == "" then
			npcHandler:say({
						"I never heard about that place...What do you want to talk about? ", 
						"{Ab'Dendriel}, {Ankrahmun}, {Carlin}, {Darashia}, {Desert}, {Edron}, {Farmine}, {Kazordoon}, {Liberty bay}, {Outfits}, {POH}, {Port Hope}, {Rookgaard}, {Svargrond}, {Thais}, {Venore}, {Yalahar} or {Tibia}?"
					}, cid)	
		 else
			
			
			--Modal Windows Int		
			ShowModal(player, playerSayCiudad)
			
		end
				


	elseif(msgcontains(msg, "Points")) then
		local QuestPoints = 0
		
		for i = 0, #Quest do			
			if player:getStorageValue(Quest[i].Store) >= Quest[i].Qvalue then
				QuestPoints = QuestPoints +Quest[i].Points					
			end				
		end
		db.query("UPDATE `players` SET `QuestPoints` = " .. QuestPoints .. " WHERE `id` = " .. getPlayerGUID(cid))	
		
		npcHandler:say({
						'You have the amount of  {' .. QuestPoints .. '}  Quest Points...',
						'Remember.. Always come and validate with me the amount of points you have to get the {benefits}.'
					}, cid)	
	





	
	elseif(msgcontains(msg, "Marks")) then
	--Marks system
		npcHandler:say({
						'What is the quest you want to mark on the map?',						
					}, cid)	
		npcHandler.topic[cid] = 3
	
	
	elseif(npcHandler.topic[cid] == 3) then	
			buyMarks(player,msg)
	
	
	elseif(msgcontains(msg, "benefits")) then
	--QuestPoints system
	local QuestPoints = 0	
	local points = db.storeQuery("SELECT `QuestPoints` FROM `players` WHERE `id` = " .. getPlayerGUID(player))	
    if points then
        QuestPoints = result.getDataInt(points, "QuestPoints")
    end
	
		--30K
		if (QuestPoints >= 15 and player:getStorageValue(62103) == -1) then		
			doPlayerAddItem(player,2160,3)
			doPlayerAddItem(player,12663,3)			
			player:setStorageValue(62103, 1)
			npcHandler:say({'Take 30k as Reward.'}, cid)	
			
		--Puerta Monks
		elseif (QuestPoints >= 30 and player:getStorageValue(62100) == -1) then
			player:setStorageValue(62100, 1)
			npcHandler:say({'You have my permission to train with the monks.'}, cid)
		

		--500k
		elseif (QuestPoints >= 60 and player:getStorageValue(62107) == -1) then
			player:setStorageValue(62107, 1)
			doPlayerAddItem(player,2160,50)
			doPlayerAddItem(player,12664,3)
			npcHandler:say({'Take 500k as Reward.'}, cid)
							
		--Nueva Isla
		elseif (QuestPoints >= 90 and player:getStorageValue(62102) == -1) then
			player:setStorageValue(62102, 1)
			npcHandler:say({'I will give you access to Prye Island.'}, cid)
			
		--Holy Icon
		elseif (QuestPoints >= 120 and player:getStorageValue(62105) == -1) then
			doPlayerAddItem(player,10305,1)	
			doPlayerAddItem(player,2160,100)
			player:setStorageValue(62105, 1)
			doPlayerAddItem(player,12665,3)			
			npcHandler:say({'Take this Holy Icon the jedi symbol. and 1M'}, cid)
			
		--Puerta Castillos
		elseif (QuestPoints >= 160 and player:getStorageValue(62101) == -1) then
			player:setStorageValue(62101, 1)
			npcHandler:say({'The Jedi high counsel authorizes the entrance to the castle we belong.. but it does not mean that you still have a vote.'}, cid)
			
		--Magic Long Sword
		elseif (QuestPoints >= 300 and player:getStorageValue(62106) == -1) then
			player:setStorageValue(62106, 1)
			doPlayerAddItem(player,2390,1)
			npcHandler:say({'This is a special day we name you the great Jedi Master '}, cid)
		else
			npcHandler:say({'I\'m sorry but .. you need to solve more quest.'}, cid)
		end
	
	end
	
	-- 34070 Lam
	
	
	
	
	return true
end


npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)