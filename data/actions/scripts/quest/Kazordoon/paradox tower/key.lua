function onUse(player, item, frompos, item2, topos)
	if player:getStorageValue(11001) ~= 1 then
		local newItem = Game.createItem(2089, 1)
		newItem:setActionId(3899)
		player:addItemEx(newItem)
		player:setStorageValue(11001, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a copper key.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
	end
end