function onUse(cid, item, frompos, item2, topos)
wallpos1 = {x=32601, y=32216, z=9, stackpos=1}
wallpos2 = {x=32602, y=32216, z=9, stackpos=1}
wallpos3 = {x=32603, y=32216, z=9, stackpos=1}
wallpos4 = {x=32604, y=32216, z=9, stackpos=1}
gatepos5 = {x=32593, y=32216, z=9, stackpos=1}
gatepos6 = {x=32594, y=32216, z=9, stackpos=1}
gatepos7 = {x=32606, y=32216, z=9, stackpos=1}
gatepos8 = {x=32607, y=32216, z=9, stackpos=1}

paymentpos = {x=32594, y=32214, z=9, stackpos=1}
getpayment = getThingfromPos(paymentpos)

getwall1 = getThingfromPos(wallpos1)
getwall2 = getThingfromPos(wallpos2)
getwall3 = getThingfromPos(wallpos3)
getwall4 = getThingfromPos(wallpos4)
getgate5 = getThingfromPos(gatepos5)
getgate6 = getThingfromPos(gatepos6)
getgate7 = getThingfromPos(gatepos7)
getgate8 = getThingfromPos(gatepos8)

if item.uid == 15046 and item.itemid == 1945 and getpayment.itemid == 2167 then
doRemoveItem(getpayment.uid,1)
doRemoveItem(getwall1.uid,1)
doRemoveItem(getwall2.uid,1)
doRemoveItem(getwall3.uid,1)
doRemoveItem(getwall4.uid,1)
doCreateItem(1026,1,wallpos1)
doCreateItem(1026,1,wallpos2)
doCreateItem(1207,1,wallpos3)
doCreateItem(1208,1,wallpos4)
doRemoveItem(getgate5.uid,1)
doRemoveItem(getgate6.uid,1)
doCreateItem(1026,1,gatepos7)
doCreateItem(1026,1,gatepos8)

doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 15046 and item.itemid == 1946 then
doRemoveItem(getwall1.uid,1)
doRemoveItem(getwall2.uid,1)
doRemoveItem(getwall3.uid,1)
doRemoveItem(getwall4.uid,1)
doCreateItem(1026,1,wallpos4)
doCreateItem(1026,1,wallpos3)
doCreateItem(1207,1,wallpos1)
doCreateItem(1208,1,wallpos2)
doCreateItem(1026,1,gatepos5)
doCreateItem(1026,1,gatepos6)
doRemoveItem(getgate7.uid,1)
doRemoveItem(getgate8.uid,1)

doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Pay Energy ring!")
end
  return 1
  end