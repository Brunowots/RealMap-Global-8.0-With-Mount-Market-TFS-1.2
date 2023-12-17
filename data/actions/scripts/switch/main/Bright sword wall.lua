function onUse(cid, item, frompos, item2, topos)
paymentpos = {x=32594, y=32214, z=9}
getpayment = getThingfromPos(paymentpos)

NewWall1 = {x=32593, y=32216, z=9, stackpos=1} --1026
NewWall2 = {x=32592, y=32216, z=9, stackpos=1} --1026

Removewall1 = {x=32607, y=32216, z=9, stackpos=1}
Removewall2 = {x=32606, y=32216, z=9, stackpos=1}
Removewall3 = {x=32605, y=32216, z=9, stackpos=1}
Removewall4 = {x=32604, y=32216, z=9, stackpos=1}
Removewall5 = {x=32603, y=32216, z=9, stackpos=1}
getwall1 = getThingfromPos(Removewall1)
getwall2 = getThingfromPos(Removewall2)
getwall3 = getThingfromPos(Removewall3)
getwall4 = getThingfromPos(Removewall4)
getwall5 = getThingfromPos(Removewall5)

AddWall = {x=32605, y=32216, z=9, stackpos=1} --1026
AddPassage1 = {x=32604, y=32216, z=9, stackpos=1} --1207
AddPassage2 = {x=32603, y=32216, z=9, stackpos=1} --1208

if item.itemid == 1945 then
	if getTileItemById(paymentpos, 2166).itemid == 2166 then
	doRemoveItem(getTileItemById(paymentpos, 2166).uid, 1)
	doTransformItem(item.uid,item.itemid+1)
	doRemoveItem(getwall1.uid, 1)
	doRemoveItem(getwall2.uid, 1)
	doRemoveItem(getwall3.uid, 1)
	doRemoveItem(getwall4.uid, 1)
	doRemoveItem(getwall5.uid, 1)
	doCreateItem(1026, 1, NewWall1)
	doCreateItem(1026, 1, NewWall2)
	doCreateItem(1026, 1, AddWall)
	doCreateItem(1208, 1, AddPassage1)
	doCreateItem(1207, 1, AddPassage2)
	else
	doPlayerSendCancel(cid, "Where's the payment?")
	end

elseif item.itemid == 1946 then
doPlayerSendCancel(cid, "This switch seems to be stuck.")

end
  return 1
  end