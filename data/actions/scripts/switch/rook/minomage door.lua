function onUse(cid, item, frompos, item2, topos)
wallpos = {x=32118, y=32059, z=12, stackpos=1}
getwall = getThingfromPos(wallpos)

if item.itemid == 1945 then
doRemoveItem(getwall.uid,1)
ACTIONDOOR = doCreateItem(1223,1,wallpos)
doSetItemActionId(ACTIONDOOR, 7037)

doTransformItem(item.uid,item.itemid+1)
elseif item.itemid == 1946 then
doPlayerSendCancel(cid,"The switch seems to be stuck.")
end
  return 1
  end
  