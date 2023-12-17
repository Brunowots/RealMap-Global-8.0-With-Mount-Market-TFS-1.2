function onUse(cid, item, frompos, item2, topos)
WHITETOKEN = 2628
BLACKTOKEN = 2634

WHITEKNIGHT = getThingfromPos({x=32478, y=31903, z=3, stackpos=1})
BLACKKNIGHT = getThingfromPos({x=32479, y=31903, z=3, stackpos=1})


if item.itemid == 1945 then
	if WHITEKNIGHT.itemid == WHITETOKEN and BLACKKNIGHT.itemid == BLACKTOKEN then
	doRemoveItem(WHITEKNIGHT.uid)
	doRemoveItem(BLACKKNIGHT.uid)
	LadderPos = {x=32479, y=31904, z=3}
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