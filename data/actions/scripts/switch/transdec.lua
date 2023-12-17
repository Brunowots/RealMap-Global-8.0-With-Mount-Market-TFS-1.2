function onUse(cid, item, frompos, item2, topos)
if item.uid == 5252 then

getPlayerStorageValue(cid,3517)
doPlayerSendTextMessage(cid,22,"Isso ai voce eh foda!.")
doPlayerAddItem(cid,2160,100)
setPlayerStorageValue(cid,3517,1)
else

doPlayerSendTextMessage(cid,22,"Isso ai voce eh foda!")


end

return 1

end 