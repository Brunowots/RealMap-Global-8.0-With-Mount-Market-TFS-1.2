local drunk = Condition(CONDITION_DRUNK)
drunk:setParameter(CONDITION_PARAM_TICKS, 60000)

local poison = Condition(CONDITION_POISON)
poison:setParameter(CONDITION_PARAM_DELAYED, true)
poison:setParameter(CONDITION_PARAM_MINVALUE, -50)
poison:setParameter(CONDITION_PARAM_MAXVALUE, -120)
poison:setParameter(CONDITION_PARAM_STARTVALUE, -5)
poison:setParameter(CONDITION_PARAM_TICKINTERVAL, 4000)
poison:setParameter(CONDITION_PARAM_FORCEUPDATE, true)

local fluidMessage = {
	[2] = 'Aaaah...',
	[3] = 'Aah...',
	[4] = 'Urgh!',
	[5] = 'Mmmh.',
	[7] = 'Aaaah...',
	[10] = 'Glup.',
	[11] = 'Urgh!',
	[13] = 'Urgh!',
	[15] = 'Aah...',
	[19] = 'Urgh!',
	[43] = 'Aaaah...'
}



function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetType = ItemType(target.itemid)	
	
	if item.actionid == 2023 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, '2')
		destination = Position(32791, 32332, 10)
		player:teleportTo(destination)
		player:say('Muahahahaha..', TALKTYPE_MONSTER_SAY, false, player)
		fromPosition:sendMagicEffect(CONST_ME_DRAWBLOOD)
		destination:sendMagicEffect(CONST_ME_MORTAREA)			
	end
	
	if targetType:isFluidContainer() then
		if target.type == 0 and item.type ~= 0 then
			target:transform(target.itemid, item.type)
			item:transform(item.itemid, 0)
			return true
		elseif target.type ~= 0 and item.type == 0 then
			target:transform(target.itemid, 0)
			item:transform(item.itemid, target.type)
			return true
		end
	end

	if target.itemid == 1 then
		if item.type == 0 then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, 'It is empty.')

		elseif target.uid == player.uid then
			if isInArray({3, 15, 43}, item.type) then
				player:addCondition(drunk)

			elseif item.type == 4 then
				player:addCondition(poison)
				doSendMagicEffect(toPosition, CONST_ME_GREEN_RINGS)

			elseif item.type == 7 then
				player:addMana(math.random(50, 150))
				doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)

			elseif item.type == 2 then
				player:addHealth(60)
				doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			end

			player:say(fluidMessage[item.type] or 'Gulp.', TALKTYPE_MONSTER_SAY)
			item:transform(2006, 0)
		else
			local pool = Game.createItem(2016, item.type, toPosition)
			if pool then
				pool:decay()
				if item.type == 1 then
					checkWallArito(pool, toPosition)
				end
			end
			item:transform(item.itemid, 0)
		end

	else

		local fluidSource = targetType:getFluidSource()
		if fluidSource ~= 0 then
			item:transform(item.itemid, fluidSource)
		elseif item.type == 0 then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, 'It is empty.')
		else
			if target.actionid == 2023 then
			destination = Position(32791, 32332, 10)
			player:teleportTo(destination)
			player:say('Muahahahaha..', TALKTYPE_MONSTER_SAY, false, player)
			fromPosition:sendMagicEffect(CONST_ME_DRAWBLOOD)
			destination:sendMagicEffect(CONST_ME_MORTAREA)
			else
				if toPosition.x == CONTAINER_POSITION then
					toPosition = player:getPosition()
				end

				local pool = Game.createItem(2016, item.type, toPosition)
				if pool then
					pool:decay()
    				if item.type == 1 then
    					checkWallArito(pool, toPosition)
    				end
				end
			end
			item:transform(item.itemid, 0)
		end
	end

	
	
	
	return true
end
