function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return true
	end
	
	local points = player:getStorageValue(45251)
	
	
	if target.itemid == 9957 then
		player:setStorageValue(45251, points+1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You currently have " ..points+1 .. " Lightbringer Points" )
		
		Item(target.uid):remove(1)		
		addEvent(Game.createItem, 60* 60 * 1000, 9957, 1, toPosition)  -- 1 hora
	end
	
	return true
end