local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -60, -1, -60, 5, 5, 20, 20)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end 