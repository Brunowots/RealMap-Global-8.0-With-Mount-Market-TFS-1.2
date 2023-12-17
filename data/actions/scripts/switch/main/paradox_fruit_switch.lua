function onUse(cid, item, frompos, item2, topos)
MELON = 2682
BANANA = 2676
CHERRY = 2679
APPLE = 2674
GRAPES = 2681
COCONUT = 2678
Fruit1 = getThingfromPos({x=32476, y=31900, z=4, stackpos=2})
Fruit2 = getThingfromPos({x=32477, y=31900, z=4, stackpos=2})
Fruit3 = getThingfromPos({x=32478, y=31900, z=4, stackpos=2})
Fruit4 = getThingfromPos({x=32479, y=31900, z=4, stackpos=2})
Fruit5 = getThingfromPos({x=32480, y=31900, z=4, stackpos=2})
Fruit6 = getThingfromPos({x=32481, y=31900, z=4, stackpos=2})


if item.itemid == 1945 then
	if Fruit1.itemid == MELON and Fruit2.itemid == BANANA and Fruit3.itemid == CHERRY and Fruit4.itemid == APPLE and Fruit5.itemid == GRAPES and Fruit6.itemid == COCONUT then
	doRemoveItem(Fruit1.uid)
	doRemoveItem(Fruit2.uid)
	doRemoveItem(Fruit3.uid)
	doRemoveItem(Fruit4.uid)
	doRemoveItem(Fruit5.uid)
	doRemoveItem(Fruit6.uid)
	LadderPos = {x=32476, y=31904, z=4}
	doCreateItem(1386,1,LadderPos)
	doTransformItem(item.uid,1946)
	else
	doPlayerSendCancel(cid,"The switch seems to be stuck.")
	end
else
doPlayerSendCancel(cid,"The switch seems to be stuck.")
end
return TRUE
end