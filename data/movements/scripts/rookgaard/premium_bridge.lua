function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
        kickPos = Position (32060,32192, 7),
        kickEffect = CONST_ME_MAGIC_BLUE,
        kickMsg = "Only noble citizens can pass, get your premium account on our website!",
        enterMsg = "Welcome to a premium area!",
        enterEffect = CONST_ME_MAGIC_BLUE,
}
	if isPremium(cid) == TRUE and item.actionid == 50241 then
        doPlayerSendTextMessage(cid, 22, tileConfig.enterMsg)
        doSendMagicEffect(position, tileConfig.enterEffect)

        return
    end

        doTeleportThing(cid, tileConfig.kickPos)
        doSendMagicEffect(tileConfig.kickPos, tileConfig.kickEffect)
        doPlayerSendCancel(cid, tileConfig.kickMsg)
        return true
end
