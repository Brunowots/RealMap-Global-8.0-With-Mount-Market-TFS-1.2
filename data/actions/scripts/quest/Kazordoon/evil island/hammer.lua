

function onUse(player, item, fromPosition, target, toPosition, isHotkey)		
	if target.itemid == 8641 and player:removeItem(10152, 1) then
		player:addItem(10119, 1)
		return true
	end
	
	if item.itemid == 10119 and target:getName() == "Rotworm" then		
		if(player:getStorageValue(45101) == 5) then
			player:setStorageValue(45101, 6)
		end
		
		target:addHealth(-target:getHealth())		
		return true
	end
	
end
