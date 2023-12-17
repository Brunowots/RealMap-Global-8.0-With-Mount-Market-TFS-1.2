function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32780, y=32231, z=8, stackpos=1}
getgate = getThingfromPos(gatepos)

if item.uid == 15093 and item.itemid == 1945 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 15093 and item.itemid == 1946 then
BridgeRelocate({x=32780, y=32231, z=8}, {x=32780, y=32232, z=8})
doCreateItem(387,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end