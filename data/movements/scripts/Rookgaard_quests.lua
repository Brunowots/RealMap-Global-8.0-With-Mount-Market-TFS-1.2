function onStepIn(cid, item, pos, topos)
if isPlayer(cid) == TRUE and item.actionid == 7000 then

	if item.uid == 7035 then
		if getPlayerStorageValue(cid, 7035) <= 0 then
		setPlayerStorageValue(cid, 7035, 1)
		doSendMagicEffect(getPlayerPosition(cid), 13)
		SwordofFuryDisappear(cid)
		elseif getPlayerStorageValue(cid, 7035) <= 1 then
		SwordofFuryDisappear(cid)
		end
	
	elseif item.uid == 7036 then
		if getPlayerStorageValue(cid, 7036) <= 0 then
		setPlayerStorageValue(cid, 7036, 1)
		doSendMagicEffect(getPlayerPosition(cid), 13)
		SwordofFuryDisappear(cid)
		elseif getPlayerStorageValue(cid, 7036) <= 1 then
		SwordofFuryDisappear(cid)
		end	
	
	
end
end
end

function SwordofFuryDisappear(cid)
if getPlayerStorageValue(cid, 7035) >= 1 and getPlayerStorageValue(cid, 7036) >= 1 then
SwordPos = {x=32101, y=32085, z=7, stackpos=2}
GetSword = getThingfromPos(SwordPos)
NewSwordPos = {x=31992, y=32227, z=12}
MinotaurMagePos = {x=31992, y=32228, z=12}

Fire1 = getThingfromPos({x=32100, y=32084, z=7, stackpos=254})
Fire2 = getThingfromPos({x=32100, y=32085, z=7, stackpos=254})
Fire3 = getThingfromPos({x=32100, y=32086, z=7, stackpos=254})
Fire4 = getThingfromPos({x=32101, y=32084, z=7, stackpos=254})
Fire5 = getThingfromPos({x=32102, y=32084, z=7, stackpos=254})
Fire6 = getThingfromPos({x=32102, y=32085, z=7, stackpos=254})
Fire7 = getThingfromPos({x=32102, y=32086, z=7, stackpos=254})
Fire8 = getThingfromPos({x=32101, y=32086, z=7, stackpos=254})
	if GetSword.itemid == 2383 then
	doRemoveItem(GetSword.uid)
	doCreateItem(2383,1,NewSwordPos)
	doSummonCreature("Rook Minotaur Mage", MinotaurMagePos)
	doSendMagicEffect(SwordPos, 13)
	setPlayerStorageValue(cid, 7037, 1)
	doTransformItem(Fire1.uid,1494)
	doTransformItem(Fire2.uid,1494)
	doTransformItem(Fire3.uid,1494)
	doTransformItem(Fire4.uid,1494)
	doTransformItem(Fire5.uid,1494)
	doTransformItem(Fire6.uid,1494)
	doTransformItem(Fire7.uid,1494)
	doTransformItem(Fire8.uid,1494)
	end
end
end