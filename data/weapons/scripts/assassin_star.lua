local function autoRefillAssassinStars(cid)
    local assassin_stars_itemID = 7368
 
    -- find which hand has assassin stars equipped
    local hand_to_check = 0
    local left_hand = getPlayerSlotItem(cid, CONST_SLOT_LEFT)
    local right_hand = getPlayerSlotItem(cid, CONST_SLOT_RIGHT)
    if left_hand.uid ~= 0 and left_hand.itemid == assassin_stars_itemID then
        hand_to_check = CONST_SLOT_LEFT
    elseif right_hand.uid ~= 0 and right_hand.itemid == assassin_stars_itemID then
        hand_to_check = CONST_SLOT_RIGHT
    else
        return false
    end
 
    -- check if only 1 ammo left
    local ammo_count = getPlayerSlotItem(cid, hand_to_check).type
    if ammo_in_slot ~= 1 then
        return false
    end
 
    -- refill assassin stars
    local ammo_count = getPlayerItemCount(cid, assassin_stars_itemID) - 1
    ammo_count = ammo_count >= 100 and 100 or ammo_count
    addEvent (
        function ()
            doPlayerRemoveItem(cid, assassin_stars_itemID, ammo_count)
            doPlayerAddItem(cid, assassin_stars_itemID, ammo_count)
        end, 1
    )
    return true
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_REDSTAR)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setFormula(COMBAT_FORMULA_SKILL, 0, 0, 1, 0)

function onUseWeapon(player, variant)
	local boolean = combat:execute(player, variant)
	if not boolean then
		return false
	end
	local target = variant:getNumber()
	if target ~= 0 then
	end
	return boolean
end
