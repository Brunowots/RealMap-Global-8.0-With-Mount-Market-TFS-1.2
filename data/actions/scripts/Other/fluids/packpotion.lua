
function onUse(cid, item, fromPosition, itemEx, toPosition)
	player = Player(cid) 
	if not isPlayer(player) then
	return false
   end
	
	Player(cid):addItem(7620, 5)
	Player(cid):addItem(7618, 5)
	
	
	Item(item.uid):remove(1)
	fromPosition:sendMagicEffect(CONST_ME_GIFT_WRAPS)
	return true
end
