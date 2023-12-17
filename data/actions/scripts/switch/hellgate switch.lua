function onUse(cid, item, frompos, item2, topos)
gatepos3 = {x=32627, y=31701, z=10, stackpos=1}
getgate3 = getThingfromPos(gatepos3)

gatepos1 = {x=32628, y=31701, z=10, stackpos=1}
getgate1 = getThingfromPos(gatepos1)

gatepos2 = {x=32629, y=31701, z=10, stackpos=1}
getgate2 = getThingfromPos(gatepos2)



if item.uid == 25084 and item.itemid == 1945 then
doCreateItem(1284,1,gatepos1)
doCreateItem(1284,1,gatepos2)
doCreateItem(1284,1,gatepos3)
doTransformItem(item.uid,item.itemid+1)


elseif item.uid == 25084 and item.itemid == 1946 then
doCreateItem(493,1,gatepos1)
doCreateItem(493,1,gatepos2)
doCreateItem(493,1,gatepos3)
doTransformItem(item.uid,item.itemid-1)

else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end