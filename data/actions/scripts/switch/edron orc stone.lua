function onUse(cid, item, frompos, item2, topos)
gatepos = {x=33171, y=31897, z=8, stackpos=1}
getgate = getThingfromPos(gatepos)

if item.uid == 25277 and item.itemid == 1945 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 25277 and item.itemid == 1946 then
BridgeRelocate({x=33171, y=31897, z=8}, {x=33171, y=31898, z=8})
doCreateItem(1285,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end