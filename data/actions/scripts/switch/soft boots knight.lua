function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32839, y=32333, z=11, stackpos=1}
getgate = getThingfromPos(gatepos)

if item.uid == 25300 and item.itemid == 1945 then
doCreateItem(103,1,gatepos)
doTransformItem(item.uid,item.itemid+1)
		doPlayerSendTextMessage(cid,22,"You have now opened one of the gates to Soft Boots Quest!")
elseif item.uid == 25300 and item.itemid == 1946 then
doCreateItem(598,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
		doPlayerSendTextMessage(cid,22,"You have now closed the gate!")
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end