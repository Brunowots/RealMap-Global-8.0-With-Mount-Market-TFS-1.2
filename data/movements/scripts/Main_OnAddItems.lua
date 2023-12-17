function onAddItem(moveitem, tileitem, pos)
if tileitem.actionid == 8001 then
PlayerPos = {x=32482, y=31906, z=7, stackpos=253}
GetPlayer = getThingfromPos(PlayerPos)
	StairPos = {x=32478, y=31902, z=7}
	GetStair = getTileItemById(StairPos, 1385)
	GetStone = getTileItemById(StairPos, 1304)

	--// Entrance Stair (Paradox Tower //--
    if moveitem.itemid == 2782 and tileitem.uid == 8001 and isPlayer(GetPlayer.uid) == TRUE then
	doTransformItem(GetStone.uid,1385)
	
	--// Entrance Stair (Paradox Tower //--
	elseif moveitem.itemid == 2781 and tileitem.uid == 8001 and getThingfromPos(StairPos).itemid == 1385 then 
	doTransformItem(GetStair.uid,1304)
	
	
	
	--// Ghoul Box (Paradox Tower //--
    elseif moveitem.itemid == 1739 and tileitem.uid == 8002 then	
	doCreateItem(1386,1,{x=32477, y=31904, z=5})
    elseif moveitem.itemid == 1739 and tileitem.uid == 8003 then	
		if getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).itemid == 1386 then
		doRemoveItem(getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).uid)
		end
    elseif moveitem.itemid == 1739 and tileitem.uid == 8004 then	
		if getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).itemid == 1386 then
		doRemoveItem(getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).uid)		
		end	
    elseif moveitem.itemid == 1739 and tileitem.uid == 8005 then	
		if getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).itemid == 1386 then
		doRemoveItem(getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).uid)		
		end		
		
	--//Helmet of the Ancients//--
	elseif tileitem.uid == 8213 then
		if moveitem.itemid == 2339 or moveitem.itemid == 2335 or moveitem.itemid == 2336 or moveitem.itemid == 2337 or moveitem.itemid == 2338 or moveitem.itemid == 2340 or moveitem.itemid == 2341 then
		PayPos = {x=33198, y=32876, z=11}
		Item1 = getTileItemById(PayPos, 2336)
		Item2 = getTileItemById(PayPos, 2337)
		Item3 = getTileItemById(PayPos, 2338)
		Item4 = getTileItemById(PayPos, 2340)
		Item5 = getTileItemById(PayPos, 2341)
		Item6 = getTileItemById(PayPos, 2335)
		Item7 = getTileItemById(PayPos, 2339)
			if Item1.itemid == 2336 and Item2.itemid == 2337 and Item3.itemid == 2338 and Item4.itemid == 2340 and Item5.itemid == 2341 and Item6.itemid == 2335 and Item7.itemid == 2339 then
			doRemoveItem(Item1.uid)
			doRemoveItem(Item2.uid)
			doRemoveItem(Item3.uid)
			doRemoveItem(Item4.uid)
			doRemoveItem(Item6.uid)
			doRemoveItem(Item7.uid)
			doTransformItem(Item5.uid,2342)
			doSendMagicEffect(PayPos, 15)
			end
		end
		
		
	
	end
end
return TRUE
end