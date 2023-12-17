local lavaPositions = { --Poi
	Position(32808, 32336, 11),
	Position(32809, 32336, 11),
	Position(32810, 32336, 11),
	Position(32808, 32334, 11),
	Position(32807, 32334, 11),
	Position(32807, 32335, 11),
	Position(32807, 32336, 11),
	Position(32807, 32337, 11),
	Position(32806, 32337, 11),
	Position(32805, 32337, 11),
	Position(32805, 32338, 11),
	Position(32805, 32339, 11),
	Position(32806, 32339, 11),
	Position(32806, 32338, 11),
	Position(32807, 32338, 11),
	Position(32808, 32338, 11),
	Position(32808, 32337, 11),
	Position(32809, 32337, 11),
	Position(32810, 32337, 11),
	Position(32811, 32337, 11),
	Position(32811, 32338, 11),
	Position(32806, 32338, 11),
	Position(32810, 32338, 11),
	Position(32810, 32339, 11),
	Position(32809, 32339, 11),
	Position(32809, 32338, 11),
	Position(32811, 32336, 11),
	Position(32811, 32335, 11),
	Position(32810, 32335, 11),
	Position(32809, 32335, 11),
	Position(32808, 32335, 11),
	Position(32809, 32334, 11),
	Position(32809, 32333, 11),
	Position(32810, 32333, 11),
	Position(32811, 32333, 11),
	Position(32806, 32338, 11),
	Position(32810, 32334, 11),
	Position(32811, 32334, 11),
	Position(32812, 32334, 11),
	Position(32813, 32334, 11),
	Position(32814, 32334, 11),
	Position(32812, 32333, 11),
	Position(32810, 32334, 11),
	Position(32812, 32335, 11),
	Position(32813, 32335, 11),
	Position(32814, 32335, 11),
	Position(32814, 32333, 11),
	Position(32813, 32333, 11)
}

function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if target.actionid == 101 then
		if target.itemid == 354 or target.itemid == 355 then
			target:transform(392)
			target:decay()
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
		return true
	elseif target.uid == 31086 then --The Pits of Inferno Quest
		for i = 1, #lavaPositions do
			Game.createItem(5815, 1, lavaPositions[i])
		end
		
		target:transform(2256)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	end
	return false
end
