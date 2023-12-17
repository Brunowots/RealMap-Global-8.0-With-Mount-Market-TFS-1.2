function onUse(cid, item, frompos, item2, topos)
dump1pos = {x=33315, y=31592, z=15, stackpos=1}
dump2pos = {x=33316, y=31592, z=15, stackpos=1}
switch = {x=33330, y=31591, z=15, stackpos=3}
gatepos = {x=33314, y=31592, z=15, stackpos=1}
getgate = getThingfromPos(gatepos)
getremove1 = {x=33314, y=31592, z=15}
getremove2 = {x=33316, y=31591, z=15}
teleport = {x=33316, y=31591, z=15, stackpos=1}
gettp = getThingfromPos(teleport)
TPPOS = {x=33328, y=31592, z=14}

fire1 = {x=33314, y=31592, z=15, stackpos=254}
get1fire = getThingfromPos(fire1)
fire2 = {x=33316, y=31591, z=15, stackpos=254}
get2fire = getThingfromPos(fire2)

if item.uid == 4560 and item.itemid == 1945 then
doRemoveItem(getgate.uid,1)
doCreateItem(3621,1,gatepos)
doCreateTeleport(1387, TPPOS, teleport)
BridgeRelocate(getremove2, dump2pos)
if get2fire.itemid >= 1 then
doRemoveItem(get2fire.uid,1)
end
addEvent(resetquest, 120 * 1000, pos)
doDecayItemTo(switch, 1945, 120) 
doTransformItem(item.uid,item.itemid+1)




elseif item.uid == 4560 and item.itemid == 1946 then
doPlayerSendCancel(cid,"Sorry, But this switch reset itself in a while.")
end
  return 1
  end

function resetquest(cid, item, frompos, item2, topos)
dump1pos = {x=33315, y=31592, z=15, stackpos=1}
dump2pos = {x=33316, y=31592, z=15, stackpos=1}
switch = {x=33330, y=31591, z=15, stackpos=2}
gatepos = {x=33314, y=31592, z=15, stackpos=1}
getgate = getThingfromPos(gatepos)
getremove1 = {x=33314, y=31592, z=15}
getremove2 = {x=33316, y=31591, z=15}
teleport = {x=33316, y=31591, z=15, stackpos=1}
gettp = getThingfromPos(teleport)


doRemoveItem(getgate.uid,1)
doCreateItem(1355,1,gatepos)
BridgeRelocate(getremove1, dump1pos)
doRemoveItem(gettp.uid,1)
end
