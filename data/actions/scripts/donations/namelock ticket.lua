function onUse(cid, item, frompos, item2, topos)
if (getTilePzInfo(getPlayerPosition(cid)) == TRUE) then
playername = getPlayerName(cid)
 

local oldName, guid = getCreatureName(cid), getPlayerGUID(cid)

db.executeQuery("INSERT INTO `player_namelocks` (`player_id`, `name`, `new_name`, `date`) VALUES (" .. guid .. ", " .. db.escapeString(oldName) .. ", " .. os.time() .. ");")	
	doRemoveItem(item.uid, 1)
	doRemoveCreature(cid)
else
doPlayerSendTextMessage(cid, 22, "You can only use this item inside protection zone!")
end
end