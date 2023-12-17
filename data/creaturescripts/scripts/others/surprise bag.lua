function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	local MaxHP = target:getMaxHealth()
	local suerte = math.random(1, 100)	
	local suerte2 = math.random(1, 150)	
	local suerte3 = math.random(1, 200)	
	
	if MaxHP >= 1500 then
		if suerte3 >= 198 then
			creature:addItem(6571, 1)  -- super bolsa roja
			return true
		end
	elseif MaxHP >= 200 then		
		if(creature:getLevel() <= 100) then
			if suerte >= 99 then
				creature:addItem(6570, 1)  -- super bolsa azul
				return true
			end
		else
			if suerte2 >= 149 then
				creature:addItem(6570, 1)  -- super bolsa azul
				return true
			end
		end		
	end

	

	return true
end
