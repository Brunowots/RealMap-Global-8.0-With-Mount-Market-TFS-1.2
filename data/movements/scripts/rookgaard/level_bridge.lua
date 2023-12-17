function onStepIn(cid, item, pos, topos)
if isPlayer(cid) == TRUE and item.itemid == 446 then
if getPlayerLevel(cid) >= 2 then
doTransformItem(item.uid, item.itemid+1)
else
position = getPlayerPosition(cid)
newposition = {x = position.x, y = position.y+1, z = position.z+1}
doPlayerSendTextMessage(cid,22,"Only players with level 2 and above may leave the town!")
doTeleportThing(cid, newposition)
doSendMagicEffect(newposition, 13)
end
end
end

function onStepOut(cid, item, pos, topos)
if isPlayer(cid) == TRUE and item.itemid == 447 then
doTransformItem(item.uid, item.itemid-1)
end
end
