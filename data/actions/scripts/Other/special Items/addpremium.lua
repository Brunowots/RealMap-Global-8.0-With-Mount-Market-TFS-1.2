
function onUse(player, item, fromPosition, itemEx, toPosition)	
	player:addPremiumDays(30)
	Item(item.uid):remove(1)
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT,'+ 30 Premium Days')   
	fromPosition:sendMagicEffect(CONST_ME_GIFT_WRAPS)
	return true
end

