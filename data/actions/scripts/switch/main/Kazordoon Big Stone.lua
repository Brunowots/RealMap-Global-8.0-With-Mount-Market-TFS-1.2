function onUse(cid, item, frompos, item2, topos)
stonepos1 = {x=32604, y=31904, z=3, stackpos=1}
getstone1 = getThingfromPos(stonepos1)
stonepos2 = {x=32605, y=31904, z=3, stackpos=1}
getstone2 = getThingfromPos(stonepos2)
stonepos3 = {x=32604, y=31905, z=3, stackpos=1}
getstone3 = getThingfromPos(stonepos3)
stonepos4 = {x=32605, y=31905, z=3, stackpos=1}
getstone4 = getThingfromPos(stonepos4)
--
dumppos1 = {x=32604, y=31906, z=3, stackpos=1}
dumppos2 = {x=32605, y=31906, z=3, stackpos=1}
--

switch1 = {x=32604, y=31908, z=3}
switch2 = {x=32603, y=31901, z=4}

if item.itemid == 1945 then
doRemoveItem(getstone1.uid, 1)
doRemoveItem(getstone2.uid, 1)
doRemoveItem(getstone3.uid, 1)
doRemoveItem(getstone4.uid, 1)
doTransformItem(getTileItemById(switch1, 1945).uid,1946)
doTransformItem(getTileItemById(switch2, 1945).uid,1946)

elseif item.itemid == 1946 then
BridgeRelocate(stonepos1, dumppos1)
BridgeRelocate(stonepos2, dumppos2)
BridgeRelocate(stonepos3, dumppos1)
BridgeRelocate(stonepos4, dumppos2)
doCreateItem(1300, 1, stonepos1)
doCreateItem(1301, 1, stonepos2)
doCreateItem(1302, 1, stonepos3)
doCreateItem(1303, 1, stonepos4)
doTransformItem(getTileItemById(switch1, 1946).uid,1945)
doTransformItem(getTileItemById(switch2, 1946).uid,1945)
end
return 1
end
  