function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    return stat_onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
end

function onManaChange(creature, attacker, manaChange, origin)
    return stat_onManaChange(creature, attacker, manaChange, origin)
end

function onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
    return stat_onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
end

function onKill(player, target, lastHit)
    return stat_onKill(player, target, lastHit)
end

function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    return stat_onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
end

function onLogin(player)
    return stat_onLogin(player)
end