function onUse(cid, item, frompos, item2, topos)
Switch1Pos = {x=31987, y=32229, z=11, stackpos=1}
Switch2Pos = {x=31998, y=32231, z=11, stackpos=1}
getSwitch1 = getThingfromPos(Switch1Pos)
getSwitch2 = getThingfromPos(Switch2Pos)

DoorPos = {x=31992, y=32231, z=12, stackpos=1}
getDoor = getThingfromPos(DoorPos)

if item.itemid == 1945 then
	if getSwitch1.itemid == 1946 or getSwitch2.itemid == 1946 then
	doRemoveItem(getDoor.uid,1)
	ACTIONDOOR = doCreateItem(1225,1,DoorPos)
	doSetItemActionId(ACTIONDOOR, 7037)
	end
doTransformItem(item.uid,item.itemid+1)
elseif item.itemid == 1946 then
doPlayerSendCancel(cid,"The switch seems to be stuck.")
end
  return 1
  end
  