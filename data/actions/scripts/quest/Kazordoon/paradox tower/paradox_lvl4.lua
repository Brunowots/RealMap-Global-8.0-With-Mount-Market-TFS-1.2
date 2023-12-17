function onUse(cid, item, frompos, item2, topos)
	 
	
	local food1 = Tile(32476, 31900, 4):getItemById(2682)
	local food2 = Tile(32477, 31900, 4):getItemById(2676)
	local food3 = Tile(32478, 31900, 4):getItemById(2679)
	local food4 = Tile(32479, 31900, 4):getItemById(2674)
	local food5 = Tile(32480, 31900, 4):getItemById(2681)
	local food6 = Tile(32481, 31900, 4):getItemById(2678)

	if (food1 and 
		food2 and 
		food3 and 
		food4 and 
		food5 and 
		food6) then
		ladderpos = {x=32478, y=31904, z=4, stackpos=255}
		doCreateItem(1386,1,ladderpos)
		doTransformItem(item.uid,item.itemid+1) 
	else 
		cid:sendTextMessage(MESSAGE_STATUS_DEFAULT,'try with  melon, banana, cherry, apple, grapes, coconut') 
		
	end

	
	return true
end

