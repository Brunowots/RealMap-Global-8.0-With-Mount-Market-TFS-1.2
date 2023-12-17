function onUse(cid, item, itemEx, toPosition)
 
local pos = getCreaturePosition(cid)
if (getTilePzInfo(getPlayerPosition(cid)) == TRUE) then
if(getPlayerStorageValue(cid, 12461) == 1) then
doPlayerSendTextMessage(cid, 22, "You already have Postman Mission Quest!")
else
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 12461, 1)
doPlayerSendTextMessage(cid, 22, "You just completed Postman Mission Quest!")
end
else
doPlayerSendTextMessage(cid, 22, "You can only use this item inside protection zone!")
end
return true
end