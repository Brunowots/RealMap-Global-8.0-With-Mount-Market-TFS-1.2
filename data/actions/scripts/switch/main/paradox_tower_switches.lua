function onUse(cid, item, frompos, item2, topos)
Switch1 = getThingfromPos({x=32476, y=31900, z=6, stackpos=1})
Switch2 = getThingfromPos({x=32477, y=31900, z=6, stackpos=1})
Switch3 = getThingfromPos({x=32478, y=31900, z=6, stackpos=1})
Switch4 = getThingfromPos({x=32479, y=31900, z=6, stackpos=1})
Switch5 = getThingfromPos({x=32480, y=31900, z=6, stackpos=1})
Switch6 = getThingfromPos({x=32481, y=31900, z=6, stackpos=1})

LadderPos = {x=32479, y=31903, z=6, stackpos=1}
GetLadder = getThingfromPos(LadderPos)

if item.itemid == 1945 or item.itemid == 1946 then
	if Switch1.itemid == 1946 and Switch2.itemid == 1946 and Switch3.itemid == 1945 and Switch4.itemid == 1945 and Switch5.itemid == 1946 and Switch6.itemid == 1945 then
	if item.itemid == 1945 then
	doTransformItem(item.uid,1946)
	elseif item.itemid == 1946 then
	doTransformItem(item.uid,1945)
	end
		if GetLadder.itemid ~= 1386 then
		doCreateItem(1386,1,LadderPos)
		end
	else
	doPlayerSendCancel(cid,"The switch seems to be stuck.")
	end
end
return TRUE
end