function onUse(cid, item, itemEx, toPosition)
 
local pos = getCreaturePosition(cid)
if (getTilePzInfo(getPlayerPosition(cid)) == TRUE) then
if(getPlayerStorageValue(cid, 51114) == 3) then
doPlayerSendTextMessage(cid, 22, "You already have Blue Djin Quest!")
else
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 51114, 3)
doPlayerSendTextMessage(cid, 22, "You just completed Blue Djin Quest!")
end
else
doPlayerSendTextMessage(cid, 22, "You can only use this item inside protection zone!")
end
return true
end