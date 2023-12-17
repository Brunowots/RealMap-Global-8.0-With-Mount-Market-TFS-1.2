function onUse(cid, item, frompos, item2, topos)
	 
	
	local Wknight = Tile(32478, 31903, 3):getItemById(2628)
	local Bknight = Tile(32479, 31903, 3):getItemById(2634)
	
	if (Wknight and 
		Bknight) then
		ladderpos = {x=32479, y=31904, z=3, stackpos=255}
		doCreateItem(1386,1,ladderpos)
		doTransformItem(item.uid,item.itemid+1) 
	else 
		cid:sendTextMessage(MESSAGE_STATUS_DEFAULT,'try with  knight chess piece') 
		
	end

	
	return true
end

