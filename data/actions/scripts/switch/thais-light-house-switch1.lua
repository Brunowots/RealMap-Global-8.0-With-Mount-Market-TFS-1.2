function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32225, y=32276, z=8, stackpos=0}
getgate = getThingfromPos(gatepos)

if item.uid == 5012 and item.itemid == 1945 and getgate.itemid == 351 then
doCreateItem(408,1,gatepos)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 5012 and item.itemid == 1946 and getgate.itemid == 408 then
doRemoveItem(getgate.uid,1)
doCreateItem(351,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end