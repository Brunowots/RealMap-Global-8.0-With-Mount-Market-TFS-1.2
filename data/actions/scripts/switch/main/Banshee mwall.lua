function onUse(cid, item, frompos, item2, topos)

posoftp = {x=32262, y=31889, z=10}
tpto = {x=32259, y=31892, z=10}

magwallpos1 = {x=32259, y=31890, z=10, stackpos=1}
magwallpos2 = {x=32259, y=31891, z=10, stackpos=1}

dumppos1 = {x=32259, y=31889, z=10}
dumppos2 = {x=32259, y=31892, z=10}

if item.itemid == 1945 then
doRemoveItem(getTileItemById(posoftp, 1387).uid,1)
doRemoveItem(getTileItemById(magwallpos1, 5751).uid,1)
doRemoveItem(getTileItemById(magwallpos2, 5751).uid,1)
doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 1946 then
doCreateTeleport(1387, tpto, posoftp)
doCreateItem(5751,1,magwallpos1)
doCreateItem(5751,1,magwallpos2)
BridgeRelocate(magwallpos1, dumppos1)
BridgeRelocate(magwallpos2, dumppos2)

doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end
  