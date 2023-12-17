function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if target.itemid == 5464 then		
		target:transform(5463)
		target:decay()
		Game.createItem(5467, 1, toPosition)
		return true
	end
	
	
	return onUseScythe(player, item, fromPosition, target, toPosition, isHotkey)
end
