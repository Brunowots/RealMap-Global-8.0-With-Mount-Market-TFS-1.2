function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32801, y=32336, z=11, stackpos=1}
getgate = getThingfromPos(gatepos)

if item.uid == 25250 and item.itemid == 1945 then
doCreateItem(1284,1,gatepos)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 25250 and item.itemid == 1946 then
doCreateItem(493,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end