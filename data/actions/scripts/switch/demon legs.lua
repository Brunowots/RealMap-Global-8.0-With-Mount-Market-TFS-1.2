function onUse(cid, item, frompos, item2, topos)
gatepos = {x=33154, y=31667, z=12, stackpos=1}
getgate = getThingfromPos(gatepos)

if item.uid == 25102 and item.itemid == 1945 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 25102 and item.itemid == 1946 then
doCreateItem(1498,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end