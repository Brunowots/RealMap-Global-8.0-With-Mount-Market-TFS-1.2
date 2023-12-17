function onUse(cid, item, frompos, item2, topos)
piece1 = {x=32347, y=32236, z=7, stackpos=1}
piece2 = {x=32348, y=32236, z=7, stackpos=1}
piece3 = {x=32349, y=32236, z=7, stackpos=1}
piece4 = {x=32350, y=32236, z=7, stackpos=1}
piece5 = {x=32351, y=32236, z=7, stackpos=1}
piece6 = {x=32352, y=32236, z=7, stackpos=1}
reward = {x=32349, y=32237, z=7, stackpos=1}
getpiece1 = getThingfromPos(piece1)
getpiece2 = getThingfromPos(piece2)
getpiece3 = getThingfromPos(piece3)
getpiece4 = getThingfromPos(piece4)
getpiece5 = getThingfromPos(piece5)


payment = {x=32347, y=32237, z=7, stackpos=1}
getpayment = getThingfromPos(payment)

if item.uid == 25054 and item.itemid == 1945 and piece1.itemid == 2335 and piece2.itemid == 2336 and piece3.itemid == 2337 and piece4.itemid == 2338 and piece5.itemid == 2339 and piece6.itemid == 2340 and payment.itemid == 2466 then
doRemoveItem(piece1.uid,1)
doRemoveItem(piece2.uid,1)
doRemoveItem(piece3.uid,1)
doRemoveItem(piece4.uid,1)
doRemoveItem(piece5.uid,1)
doRemoveItem(piece6.uid,1)
doRemoveItem(payment.uid,1)
doCreateItem(2343,1,gatepos)
doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 25054 and item.itemid == 1946 then

doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"You have to put all items on valid tile and golden armor as payment!")
end
  return 1
  end