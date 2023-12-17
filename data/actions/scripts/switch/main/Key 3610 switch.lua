function onUse(cid, item, frompos, item2, topos)
fire3 = {x=32592, y=32104, z=14, stackpos=254}
get3fire = getThingfromPos(fire3)
fire4 = {x=32592, y=32105, z=14, stackpos=254}
get4fire = getThingfromPos(fire4)
wallpos1 = {x=32593, y=32103, z=14, stackpos=1}
getwall1 = getThingfromPos(wallpos1)
wallpos2 = {x=32594, y=32103, z=14, stackpos=1}
getwall2 = getThingfromPos(wallpos2)
--
wallposdump1 = {x=32593, y=32102, z=14}
wallposdump2 = {x=32594, y=32102, z=14}
--
newpos1 = {x=32592, y=32104, z=14, stackpos=1}
getnew1 = getThingfromPos(newpos1)
newpos2 = {x=32592, y=32105, z=14, stackpos=1}
getnew2 = getThingfromPos(newpos2)
--
newposdump1 = {x=32593, y=32104, z=14}
newposdump2 = {x=32593, y=32105, z=14}
--
switch = {x=32602, y=32104, z=14}
--
if item.itemid == 1946 then
if get3fire.itemid >= 1 or get4fire.itemid >= 1 then
doRemoveItem(get3fire.uid,1)
doRemoveItem(get4fire.uid,1)
end
BridgeRelocate(newpos1, newposdump1)
BridgeRelocate(newpos2, newposdump2)
doRemoveItem(getwall1.uid,1)
doRemoveItem(getwall2.uid,1)
doCreateItem(1025,1,newpos1)
doCreateItem(1025,1,newpos2)
doTransformItem(item.uid,item.itemid-1)

elseif item.itemid == 1945 then
doTransformItem(item.uid,item.itemid+1)
fire1 = {x=32593, y=32103, z=14, stackpos=254}
get1fire = getThingfromPos(fire1)
fire2 = {x=32594, y=32103, z=14, stackpos=254}
get2fire = getThingfromPos(fire2)

wallpos1 = {x=32593, y=32103, z=14, stackpos=1}
getwall1 = getThingfromPos(wallpos1)
wallpos2 = {x=32594, y=32103, z=14, stackpos=1}
getwall2 = getThingfromPos(wallpos2)
--
wallposdump1 = {x=32593, y=32102, z=14}
wallposdump2 = {x=32594, y=32102, z=14}
--
newpos1 = {x=32592, y=32104, z=14, stackpos=1}
getnew1 = getThingfromPos(newpos1)
newpos2 = {x=32592, y=32105, z=14, stackpos=1}
getnew2 = getThingfromPos(newpos2)
--
newposdump1 = {x=32593, y=32104, z=14}
newposdump2 = {x=32593, y=32105, z=14}
--
if get1fire.itemid >= 1 or get2fire.itemid >= 1 then
doRemoveItem(get1fire.uid,1)
doRemoveItem(get2fire.uid,1)
end
BridgeRelocate(wallpos1, wallposdump1)
BridgeRelocate(wallpos2, wallposdump2)
doRemoveItem(getnew1.uid,1)
doRemoveItem(getnew2.uid,1)
doCreateItem(1026,1,wallpos1)
doCreateItem(1026,1,wallpos2)
end
  return 1
  end
