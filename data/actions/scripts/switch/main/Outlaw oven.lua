function onUse(cid, item, frompos, item2, topos)
ovenpos = {x=32623, y=32188, z=9}
getover = getTileItemById(ovenpos, 1787)

if item.itemid == 1945 then
doTransformItem(item.uid,item.itemid+1)
doRemoveItem(getover.uid, 1)

elseif item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doCreateItem(1787, 1, ovenpos)

end
  return 1
  end
  