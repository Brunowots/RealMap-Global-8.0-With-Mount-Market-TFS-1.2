function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.actionid == 50113 then
		player:removeItem(5901, 3)
		player:removeItem(8309, 3)
		Game.createItem(1027, 1, Position(32617, 31513, 9))
		Game.createItem(1205, 1, Position(32617, 31514, 9))
		player:removeItem(8613, 1)
	end
	
	
	
	
	if target.itemid == 6282 or target.itemid == 6284 then
		if player:getStorageValue(45210) == 1 then
			player:setStorageValue(45210, 2)
			player:sendTextMessage(MESSAGE_CONSOLE_STATUS_ORANGE,'Good job, come back with baxter and tell him about your work.') 
		end
		
		player:addExperience(100)
		target:transform(1025)
		 
		if math.random(0, 5) == 5 then 
			item:remove(1)
		end
	elseif target.itemid == 6281 or target.itemid == 6283 then
		if player:getStorageValue(45210) == 1 then
			player:setStorageValue(45210, 2)
			player:sendTextMessage(MESSAGE_CONSOLE_STATUS_ORANGE,'Good job, come back with baxter and tell him about your work.') 
		end
	
		player:addExperience(100)
		target:transform(1026)
		 
		if math.random(0, 5) == 5 then 
			item:remove(1)
		end	 
	end
	
	return true
end
