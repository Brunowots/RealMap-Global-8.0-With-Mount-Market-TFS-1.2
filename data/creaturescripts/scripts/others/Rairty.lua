function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end
	
	local GemRare = math.random(1, 500)	
	local GemEpic = math.random(1, 1350)	
	local GemLege = math.random(1, 2500)	
	
	
	if GemLege >= 2500 then
		creature:addItem(12665, 1)  -- Legendary GEM
		return true
		
    elseif GemEpic >= 1350 then
		creature:addItem(12664, 1)  -- Epic GEM
		return true
		
	elseif GemRare >= 500 then
		creature:addItem(12663, 1)  -- Rare GEM
		return true
	end

	

	return true
end
