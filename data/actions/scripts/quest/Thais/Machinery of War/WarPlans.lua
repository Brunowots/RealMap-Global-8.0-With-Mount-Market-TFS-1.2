function onUse(player, item, fromPosition, target, toPosition, isHotkey)	
	if player:getStorageValue(45210) >= 5 then
			player:sendTextMessage(MESSAGE_CONSOLE_STATUS_ORANGE,'You know the current plans of the orcs now. Better tell Baxter about them.') 
			player:setStorageValue(45210, 6)
	else
			player:sendTextMessage(MESSAGE_CONSOLE_STATUS_ORANGE,'Maybe Baxter is interested in this') 
	end	
	
	return true
end