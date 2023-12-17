local function revert(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.actionid == 54387 and target.itemid == 25531 then
		if player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) >= 8 or player:getStorageValue(Storage.FerumbrasAscension.BoneFlute) < 1 then
			return false
		end
		if player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) < 0 then
			player:setStorageValue(Storage.FerumbrasAscension.BasinCounter, 0)
		end
		if player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) == 7 then
			player:say('You ascended the last basin.', TALKTYPE_MONSTER_SAY)
			item:remove()
			player:setStorageValue(Storage.FerumbrasAscension.MonsterDoor, 1)
		end
		target:transform(25532)
		player:setStorageValue(Storage.FerumbrasAscension.BasinCounter, player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) + 1)
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)
		addEvent(revert, 2 * 60 * 1000, toPosition, 25532, 25531)
		return true
	end
	
	if target.itemid == 5466 then		
		target:transform(5465)
		target:decay()
		return true
	end
	
	--Ballesta
	if target.itemid == 5697 then
		Game.createItem(5063, 1, toPosition)
		player:addExperience(100)
		if player:getStorageValue(45210) == 3 then
			player:setStorageValue(45210, 4)
			player:sendTextMessage(MESSAGE_CONSOLE_STATUS_ORANGE,'Good job, come back with baxter and tell him about your work.') 
		end
	end
	
	
	--Catapult	
	if target.itemid == 5609 then
		Game.createItem(5063, 1, toPosition)
		player:addExperience(100)
		if player:getStorageValue(45210) == 3 then
			player:sendTextMessage(MESSAGE_CONSOLE_STATUS_ORANGE,'Good job, come back with baxter and tell him about your work.') 
			player:setStorageValue(45210, 4)
		end
	end
	
	
	if target.actionid == 12550 or target.actionid == 12551 then
		player:setStorageValue(Storage.secretService.TBIMission01, 2)
		return true
	end
	
	
	
	if target.uid == 2243 then
		Teleport = doCreateTeleport(1387, {x= 32857, y= 32234, z= 11},{x=32849, y=32233, z=9})	
	end
	
	
	
	
	return true
end
