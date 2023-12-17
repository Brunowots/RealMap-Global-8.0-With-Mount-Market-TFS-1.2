function onUse(cid, item, frompos, item2, topos)
enterpos = {x=33161, y=31667, z=12}

if item.uid == 25105 and item.itemid == 1945 then
		doTeleportThing(cid,enterpos)
		doSendMagicEffect(enterpos,12)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 25105 and item.itemid == 1946 then

doPlayerSendCancel(cid,"Someone have already tried this quest today!")
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end