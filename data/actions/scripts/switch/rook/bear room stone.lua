function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32145, y=32101, z=11, stackpos=1}
getgate = getThingfromPos(gatepos)
dumppos = {x=32145, y=32102, z=11}

if item.itemid == 1945 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 1946 then
doCreateItem(1304,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end