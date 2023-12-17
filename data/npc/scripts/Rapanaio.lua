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
		
	--Cuadno responde Mission
	if msgcontains(msg, 'mission') then	
		if player:getStorageValue(45101) == -1 then
			npcHandler:say({
				'Would you like to help me discover the secrets of the island of evil?'
			}, cid)
			npcHandler.topic[cid] = 1  
		elseif player:getStorageValue(45101) == 1 then
			npcHandler:say({
				'Did you find my book?'
			}, cid)
			npcHandler.topic[cid] = 2  
		elseif player:getStorageValue(45101) == 2 then
			npcHandler:say({
				'Did you catch a Mechanical Fish?'
			}, cid)
			npcHandler.topic[cid] = 3 
		elseif player:getStorageValue(45101) == 3 then
			npcHandler:say({
				'Did you have 10 Vials of Rum?'
			}, cid)
			npcHandler.topic[cid] = 4  
			
		elseif player:getStorageValue(45101) == 4 then
			npcHandler:say({
				'Did you have 1 Vial of Fruit Juice?'
			}, cid)
			npcHandler.topic[cid] = 5  

		elseif player:getStorageValue(45101) == 5  or player:getStorageValue(45101) == 6 then
			npcHandler:say({
				'Did you Kill the F°k!ng rotworm?'
			}, cid)
			npcHandler.topic[cid] = 6 
		
		elseif player:getStorageValue(45101) == 7 then
			npcHandler:say({
				'Did you found the Nautical Map?'
			}, cid)
			npcHandler.topic[cid] = 7 
			
			
		elseif player:getStorageValue(45101) == 8 then
			npcHandler:say({
				'Did you found the Tibianus Card?'
			}, cid)
			npcHandler.topic[cid] = 8 	
			
		
		
		else		
		npcHandler:say({'Get out of here Im going to the fan club with the kings card'}, cid)		
		end
	
	
	--Cuando Responde 'YES'
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:setStorageValue(45101, 1) -- Inicia la quest con ir con la hoja
			npcHandler:say({
				'Excellent! ... Your first mission to go for my {book} in the chest crossing the door'
			}, cid)
		elseif npcHandler.topic[cid] == 2 then			
			npcHandler:say({
				'What!! There was only one blank sheet!...',
				'Well .. forget my book! the next mission is: I need you to catch a special fish ... bring me a {Mechanical Fish}...',
				'Please do not use the black market better I give you a fishing rod and a few nails..',
				'Good luck.',
			}, cid)
			player:setStorageValue(45101, 2) -- se da cuenta que esta vacia y va por la segunda mission
			player:addItem(10223, 1)
			player:addItem(8309, 20)
			
		elseif npcHandler.topic[cid] == 3 then
			if player:removeItem("mechanical fish", 1) then
				player:setStorageValue(45101, 3)
				npcHandler:say('Excellent! ... Your next mission is: please bring me {10 Vials of Rum}.', cid)				
			else
				npcHandler:say('You are a liar you dont have it', cid)
			end
			
		elseif npcHandler.topic[cid] == 4 then
			if player:removeItem(2006, 10, 27) then --10 vials
				player:setStorageValue(45101, 4)
				npcHandler:say('Excellent! ... Your next mission is: please bring me {1 Vial of Fruit Juice}.', cid)				
			else
				npcHandler:say('You are a liar you dont have it', cid)
			end
			
		elseif npcHandler.topic[cid] == 5 then
			if player:removeItem(2006, 1, 21) then --1 vial
				player:setStorageValue(45101, 5)
				npcHandler:say({'Excellent! ... Your next mission is: {Kill the rotworm} outside my house.. you need fire and this hammer',
				'Use the crucible to be efective'}, cid)
				player:addItem(10152, 1)				
			else
				npcHandler:say('You are a liar you dont have it', cid)
			end	
			
		elseif npcHandler.topic[cid] == 6 then
			if player:getStorageValue(45101) == 6 then --Kill rotworm
				player:setStorageValue(45101, 7)
				npcHandler:say({'Excellent! ... Well i will stop playing with you ...Your next mission is: Serch and give me the {Nautical Map}',
				'The last time I saw was in Northport'}, cid)								
			else
				npcHandler:say('You are a liar you dont kill it', cid)
			end		
			
		elseif npcHandler.topic[cid] == 7 then
			if player:removeItem(10225, 1) then --Nautical map
				player:setStorageValue(45101, 8)
				player:setStorageValue(45103, 1) -- Aceeso a la isla
				npcHandler:say({'Excellent! ... This map is just what I needed to go to the island of evil...',
				'Another thing .. some kind of monster stole the {Fan Club Membership Card of King Tibianus} that I had stolen ... bring it to me and I will reward you...',
				'I see on the boat going down the stairs'}, cid)
							
			else
				npcHandler:say('You are a liar this is not the map I need', cid)
			end	
		
		elseif npcHandler.topic[cid] == 8 then
			if player:removeItem(10308, 1) then --Membership
				player:setStorageValue(45101, 9)				
				npcHandler:say({'Excellent! ... Thank you child .. you have been useful to me .. take your reward'}, cid)
				player:addExperience(6666)			
			else
				npcHandler:say('You are a liar this is not the Membership I need', cid)
			end			
			
		end

		
	end
	
		
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
