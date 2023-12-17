function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32415, y=32228, z=10, stackpos=1}
getgate = getThingfromPos(gatepos)

gatepos1 = {x=32408, y=32253, z=10, stackpos=1}
getgate1 = getThingfromPos(gatepos1)

gatepos2 = {x=32409, y=32253, z=10, stackpos=1}
getgate2 = getThingfromPos(gatepos2)


if item.uid == 16212 and item.itemid == 1945 and getgate.itemid == 0 then
doCreateItem(493,1,gatepos1)
doCreateItem(493,1,gatepos2)

doTransformItem(item.uid,item.itemid+1)


elseif item.uid == 16212 and item.itemid == 1946 and getgate.itemid == 0 then
doCreateItem(1284,1,gatepos1)
doCreateItem(1284,1,gatepos2)

doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end