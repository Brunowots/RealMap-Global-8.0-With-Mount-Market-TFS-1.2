function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32177, y=32148, z=11, stackpos=1}
getgate = getThingfromPos(gatepos)

if item.uid == 25100 and item.itemid == 1945 then
doRemoveItem(getgate.uid,1)
doCreateItem(1210,1,gatepos)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 25100 and item.itemid == 1946 then
doRemoveItem(getgate.uid,1)
doCreateItem(1025,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end