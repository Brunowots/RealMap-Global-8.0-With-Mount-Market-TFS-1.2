function onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end
	

	local targetName, startedTasks, taskId = target:getName():lower(), player:getStartedTasks()
	for i = 1, #startedTasks do
		taskId = startedTasks[i]
		if isInArray(tasks[taskId].creatures, targetName) then
			local killAmount = player:getStorageValue(KILLSSTORAGE_BASE + taskId)
			if killAmount < tasks[taskId].killsRequired then								
				player:setStorageValue(KILLSSTORAGE_BASE + taskId, killAmount + 1)				
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,'You kill: ' .. killAmount + 1 .. "/" .. tasks[taskId].killsRequired .. " " ..tasks[taskId].raceName) 
			else				
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,'You complete task of ' ..tasks[taskId].raceName) 								
			end
		end
	end
	return true
end

--MESSAGE_STATUS_DEFAULT