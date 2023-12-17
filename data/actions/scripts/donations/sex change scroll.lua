function onUse(cid, item, itemEx, toPosition)
 
local pos = getCreaturePosition(cid)
if (getTilePzInfo(getPlayerPosition(cid)) == TRUE) then
if (getPlayerSex(cid) == 1) then
doRemoveItem(item.uid, 1)
doPlayerSendTextMessage(cid,22, "Changesex successfully!")
doPlayerSetSex(cid, 0)
doRemoveCreature(cid) 
else
doRemoveItem(item.uid, 1)
doPlayerSendTextMessage(cid,22 , "Changesex successfully!")
doPlayerSetSex(cid, 1)
doRemoveCreature(cid) 
end
else
doPlayerSendTextMessage(cid, 22, "You can only use this item inside protection zone!")
end
return true
end