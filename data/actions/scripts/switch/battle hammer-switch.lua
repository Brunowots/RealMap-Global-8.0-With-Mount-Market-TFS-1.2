function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32233, y=32276, z=9, stackpos=1}
getgate = getThingfromPos(gatepos)
fire1 = {x=32233, y=32276, z=9, stackpos=254}
get1fire = getThingfromPos(fire1)
dump1pos = {x=32233, y=32277, z=9, stackpos=1}
switch = {x=32225, y=32285, z=10}

if item.uid == 15153 and item.itemid == 1945 then
BridgeRelocate(gatepos, dump1pos)
TPFIELD = doCreateItem(1387,1,gatepos)
doSetItemActionId(TPFIELD, 4011)
doTransformItem(item.uid,item.itemid+1)
if get1fire.itemid >= 1 then
doRemoveItem(get1fire.uid,1)
end
addEvent(resetswitch, 30*1000, pos)
doDecayItemTo(gatepos, 0, 30) 

elseif item.uid == 15153 and item.itemid == 1946 then
doPlayerSendCancel(cid,"Sorry, But this switch reset itself in a while.")
end
  return 1
  end
  
function resetswitch(pos)
switch = {x=32225, y=32285, z=10}
doTransformItem(getTileItemById(switch, 1946).uid,1945)
end