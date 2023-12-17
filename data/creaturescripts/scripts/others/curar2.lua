local ActualLife = 0
local MaxLife = 0
local Vlife = 0

function onThink(cid, interval, lastExecution)
	local amount = math.random(3, 12)	
	local master = getCreatureMaster(cid)	
	creature = Creature(master)
	
	if isPlayer(master) then		
		ActualLife = creature:getHealth()
		MaxLife = creature:getMaxHealth()
		Vlife = MaxLife - ActualLife
		
		if Vlife > 0 then
			doCreatureAddHealth(master, amount)
		else
			doPlayerAddMana(master, amount)
		end
		
	end
    return true
end