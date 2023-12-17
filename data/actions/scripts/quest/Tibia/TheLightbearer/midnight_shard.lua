function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return true
	end
	
	local points = player:getLevel()
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You recive " ..points*300 .. " XP" )
	player:addExperience(points*300)
	
	
	return true
end