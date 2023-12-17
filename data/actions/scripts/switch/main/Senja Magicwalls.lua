function onUse(cid, item, frompos, item2, topos)

MagWall1 = {x=32186, y=31626, z=8, stackpos=1}
MagWall2 = {x=32187, y=31626, z=8, stackpos=1}
MagWall3 = {x=32188, y=31626, z=8, stackpos=1}
MagWall4 = {x=32189, y=31626, z=8, stackpos=1}

GetMWall1 = getThingfromPos(MagWall1)
GetMWall2 = getThingfromPos(MagWall2)
GetMWall3 = getThingfromPos(MagWall3)
GetMWall4 = getThingfromPos(MagWall4)

if item.itemid == 1945 then
doTransformItem(item.uid,item.itemid+1)
doRemoveItem(GetMWall1.uid, 1)
doRemoveItem(GetMWall2.uid, 1)
doRemoveItem(GetMWall3.uid, 1)
doRemoveItem(GetMWall4.uid, 1)

elseif item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doCreateItem(5750, 1, MagWall1)
doCreateItem(5750, 1, MagWall2)
doCreateItem(5750, 1, MagWall3)
doCreateItem(5750, 1, MagWall4)

end
  return 1
  end
  
  