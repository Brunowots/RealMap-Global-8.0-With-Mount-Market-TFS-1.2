function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32792, y=31581, z=7, stackpos=1}
getgate = getThingfromPos(gatepos)
dump1pos = {x=32792, y=31582, z=7}

firepos = {x=32792, y=31581, z=7, stackpos=254}
get1fire = getThingfromPos(firepos)

if item.itemid == 1945 then
doTransformItem(item.uid,item.itemid+1)
doTransformItem(getgate.uid,1213)

elseif item.itemid == 1946 then
BridgeRelocate(gatepos, dump1pos)
doTransformItem(item.uid,item.itemid-1)
doTransformItem(getgate.uid,1037)
	if get1fire.itemid >= 1 then
	doRemoveItem(get1fire.uid,1)
	end
end
  return 1
  end
  