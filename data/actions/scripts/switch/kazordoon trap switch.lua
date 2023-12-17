function onUse(cid, item, frompos, item2, topos)
gatepos1 = {x=32604, y=31904, z=3, stackpos=1}
gatepos2 = {x=32605, y=31904, z=3, stackpos=1}
gatepos3 = {x=32604, y=31905, z=3, stackpos=1}
gatepos4 = {x=32605, y=31905, z=3, stackpos=1}
getgate1 = getThingfromPos(gatepos1)
getgate2 = getThingfromPos(gatepos2)
getgate3 = getThingfromPos(gatepos3)
getgate4 = getThingfromPos(gatepos4)

if item.uid == 25087 and item.itemid == 1945 then
doRemoveItem(getgate1.uid,1)
doRemoveItem(getgate2.uid,1)
doRemoveItem(getgate3.uid,1)
doRemoveItem(getgate4.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 25087 and item.itemid == 1946 then
doCreateItem(1296,1,gatepos1)
doCreateItem(1297,1,gatepos2)
doCreateItem(1298,1,gatepos3)
doCreateItem(1299,1,gatepos4)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end