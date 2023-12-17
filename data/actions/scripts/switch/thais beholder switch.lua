function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32415, y=32228, z=10, stackpos=1}
getgate = getThingfromPos(gatepos)

gatepos1 = {x=32410, y=32231, z=10, stackpos=1}
getgate1 = getThingfromPos(gatepos1)

gatepos2 = {x=32411, y=32231, z=10, stackpos=1}
getgate2 = getThingfromPos(gatepos2)

gatepos3 = {x=32410, y=32232, z=10, stackpos=1}
getgate3 = getThingfromPos(gatepos3)

gatepos4 = {x=32411, y=32232, z=10, stackpos=1}
getgate4 = getThingfromPos(gatepos4)


if item.uid == 16211 and item.itemid == 1945 and getgate.itemid == 0 then
BridgeRelocate({x=32410, y=32231, z=10}, {x=32412, y=32231, z=10})
BridgeRelocate({x=32411, y=32231, z=10}, {x=32412, y=32231, z=10})
BridgeRelocate({x=32410, y=32232, z=10}, {x=32412, y=32232, z=10})
BridgeRelocate({x=32411, y=32232, z=10}, {x=32412, y=32232, z=10})

doCreateItem(493,1,gatepos1)
doCreateItem(493,1,gatepos2)
doCreateItem(493,1,gatepos3)
doCreateItem(493,1,gatepos4)

doTransformItem(item.uid,item.itemid+1)


elseif item.uid == 16211 and item.itemid == 1946 and getgate.itemid == 0 then
doCreateItem(1284,1,gatepos1)
doCreateItem(1284,1,gatepos2)
doCreateItem(1284,1,gatepos3)
doCreateItem(1284,1,gatepos4)

doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end