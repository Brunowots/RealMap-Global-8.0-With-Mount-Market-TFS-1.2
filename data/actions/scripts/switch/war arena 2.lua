function onUse(cid, item, frompos, item2, topos)
gatepos1 = {x=33284, y=32615, z=7, stackpos=1}
gatepos2 = {x=33284, y=32616, z=7, stackpos=1}
gatepos3 = {x=33284, y=32617, z=7, stackpos=1}

getgate1 = getThingfromPos(gatepos1)
getgate2 = getThingfromPos(gatepos2)
getgate3 = getThingfromPos(gatepos3)

if item.uid == 25036 and item.itemid == 1945 then
doRemoveItem(getgate1.uid,1)
doRemoveItem(getgate2.uid,1)
doRemoveItem(getgate3.uid,1)
doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 25036 and item.itemid == 1946 then

doCreateItem(1100,1,gatepos1)
doCreateItem(1100,1,gatepos2)
doCreateItem(1100,1,gatepos3)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end