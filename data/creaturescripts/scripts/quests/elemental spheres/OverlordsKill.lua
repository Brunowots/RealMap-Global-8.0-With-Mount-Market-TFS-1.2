local overlords = {
	['lord of the elements'] = {}
}

function onKill(creature, target)
	if not target:isMonster() then
		return true
	end

	local bossName = target:getName()
	local bossConfig = overlords[bossName:lower()]
	if not bossConfig then
		return true
	end

	creature:say('You slayed ' .. bossName .. '.', TALKTYPE_MONSTER_SAY)
	return true
end
