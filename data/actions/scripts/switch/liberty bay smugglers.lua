function onUse(cid, item, frompos, item2, topos)
gatepos = {x=33314, y=31592, z=15, stackpos=1}
getgate = getThingfromPos(gatepos)

wallpos1 = {x=32350, y=32709, z=4, stackpos=1}
wallpos2 = {x=32351, y=32709, z=4, stackpos=1}
wallpos3 = {x=32352, y=32709, z=4, stackpos=1}
wallpos4 = {x=32349, y=32710, z=4, stackpos=1}
wallpos5 = {x=32349, y=32711, z=4, stackpos=1}
wallpos6 = {x=32352, y=32710, z=4, stackpos=1}

getwall1 = getThingfromPos(wallpos1)
getwall2 = getThingfromPos(wallpos2)
getwall3 = getThingfromPos(wallpos3)
getwall4 = getThingfromPos(wallpos4)
getwall5 = getThingfromPos(wallpos5)
getwall6 = getThingfromPos(wallpos6)

if item.uid == 25110 and item.itemid == 1945 then
doRemoveItem(getwall1.uid,1)
doRemoveItem(getwall2.uid,1)
doRemoveItem(getwall3.uid,1)
doCreateItem(3519,1,wallpos4)
doCreateItem(3519,1,wallpos5)
doCreateItem(3519,1,wallpos6)

doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 25110 and item.itemid == 1946 then
doRemoveItem(getwall4.uid,1)
doRemoveItem(getwall5.uid,1)
doRemoveItem(getwall6.uid,1)
doCreateItem(3514,1,wallpos1)
doCreateItem(3514,1,wallpos2)
doCreateItem(3514,1,wallpos3)

doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end