local distFromMaster = 10

function onThink(interval)
    for _, player in ipairs(Game.getPlayers()) do
        local playerPos = player:getPosition()
        if not Tile(playerPos):hasFlag(TILESTATE_PROTECTIONZONE) then
            local summons = player:getSummons()
            if #summons ~= 0 then
                for i = 1, #summons do
                    local summon = summons[i]
                    local summonPos = summon:getPosition()
                    if summonPos.z ~= playerPos.z or summonPos:getDistance(playerPos) > distFromMaster then
                        summon:teleportTo(playerPos)
                        summon:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                    end
                end
            end
        end
    end
    return true
end