function onUse(cid, item, frompos, item2, topos)
if item.uid == 5253 then

getPlayerStorageValue(cid,3517)
doPlayerSendTextMessage(cid,22,"Isso ai voce eh foda!.")
doPlayerAddItem(cid,7483,1)
doPlayerAddItem(cid,7484,1)
doPlayerAddItem(cid,7485,1)
setPlayerStorageValue(cid,3517,1)
else

doPlayerSendTextMessage(cid,22,"Isso ai voce eh foda!")


end

return 1

end 
