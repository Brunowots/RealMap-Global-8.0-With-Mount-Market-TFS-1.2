function onStepIn(cid, item, pos, topos)
if isPlayer(cid) == TRUE and item.actionid == 8000 then

	if item.uid == 8193 then
	Skull1 = getThingfromPos({x=32563, y=31957, z=1, stackpos=2})
	Skull2 = getThingfromPos({x=32565, y=31957, z=1, stackpos=2})
	Skull3 = getThingfromPos({x=32567, y=31957, z=1, stackpos=2})
	Skull4 = getThingfromPos({x=32569, y=31957, z=1, stackpos=2})
		if Skull1.itemid == 2229 and Skull2.itemid == 2229 and Skull3.itemid == 2229 and Skull4.itemid == 2229 then
		doRemoveItem(Skull1.uid)
		doRemoveItem(Skull2.uid)
		doRemoveItem(Skull3.uid)
		doRemoveItem(Skull4.uid)
		doTeleportThing(cid,{x=32479, y=31923, z=7})
		doSendMagicEffect({x=32479, y=31923, z=7}, 10)
		end
	
	elseif item.uid == 8194 then
	doTeleportThing(cid,{x=32566, y=31958, z=1})
	doSendMagicEffect({x=32566, y=31958, z=1}, 10)
	
	
	--//Paradox Quest, Removing Rewards//--
	elseif item.uid == 8196 and getPlayerStorageValue(cid,8200) <= 0 then --Remove Money
	setPlayerStorageValue(cid,8200,1)
	CHESTPOS = {x=32478, y=31900, z=1}
	doSendMagicEffect(CHESTPOS, 15)	
	elseif item.uid == 8197 and getPlayerStorageValue(cid,8201) <= 0 then --Remove Wand
	setPlayerStorageValue(cid,8201,1)
	CHESTPOS = {x=32480, y=31900, z=1}
	doSendMagicEffect(CHESTPOS, 15)		
	elseif item.uid == 8198 and getPlayerStorageValue(cid,8202) <= 0 then --Remove Talons
	setPlayerStorageValue(cid,8202,1)
	CHESTPOS = {x=32479, y=31900, z=1}
	doSendMagicEffect(CHESTPOS, 15)	
	elseif item.uid == 8199 and getPlayerStorageValue(cid,8203) <= 0 then --Phoenix Egg
	setPlayerStorageValue(cid,8203,1)
	CHESTPOS = {x=32477, y=31900, z=1}
	doSendMagicEffect(CHESTPOS, 15)	

	--//HOTA TOMBS Omruc's cave//--
	elseif item.uid == 8205 then
	doTeleportThing(cid,{x=33025, y=32872, z=8})
	doSendMagicEffect({x=33025, y=32872, z=8}, 15)
	--//HOTA TOMBS Ashmunrah cave//--
	elseif item.uid == 8205 then
	doTeleportThing(cid,{x=33159, y=32838, z=8})
	doSendMagicEffect({x=33159, y=32838, z=8}, 15)
	end
end


if item.itemid == 426 then
doTransformItem(item.uid,item.itemid-1)
end

return true
end

function onStepOut(cid, item, pos, topos)
	if item.uid == 8213 then
		if getPlayerItemCount(cid, 2342) >= 1 and getPlayerStorageValue(cid,8213) <= 0 then
		setPlayerStorageValue(cid,8213,1)
		end
	end
	
	
if item.itemid == 425 then
doTransformItem(item.uid,item.itemid+1)
end
end