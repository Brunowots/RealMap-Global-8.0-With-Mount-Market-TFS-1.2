function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32097, y=32201, z=8, stackpos=1}
getgate = getThingfromPos(gatepos)

gatepos1 = {x=32100, y=32205, z=8, stackpos=1}
getgate1 = getThingfromPos(gatepos1)

gatepos2 = {x=32101, y=32205, z=8, stackpos=1}
getgate2 = getThingfromPos(gatepos2)

switchpos1 = {x=32098, y=32204, z=8, stackpos=1}
switchpos2 = {x=32104, y=32204, z=8, stackpos=1}
getswitch1 = getThingfromPos(switchpos1)
getswitch2 = getThingfromPos(switchpos2)

if item.actionid == 15074 and getswitch1.itemid == 1945  and getswitch2.itemid == 1945 then
doCreateItem(1284,1,gatepos1)
doCreateItem(1284,1,gatepos2)
doRemoveItem(getswitch1.uid,1)
doRemoveItem(getswitch2.uid,1)
	  switch1 = doCreateItem(1946,1,switchpos1)
      doSetItemActionId(switch1,15074)
	  switch2 = doCreateItem(1946,1,switchpos2)
      doSetItemActionId(switch2,15074)	  

elseif item.actionid == 15074 and getswitch1.itemid == 1946  and getswitch2.itemid == 1946 then
doCreateItem(493,1,gatepos1)
doCreateItem(493,1,gatepos2)
doRemoveItem(getswitch1.uid,1)
doRemoveItem(getswitch2.uid,1)
	  switch1 = doCreateItem(1945,1,switchpos1)
      doSetItemActionId(switch1,15074)
	  switch2 = doCreateItem(1945,1,switchpos2)
      doSetItemActionId(switch2,15074)	
	  
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end