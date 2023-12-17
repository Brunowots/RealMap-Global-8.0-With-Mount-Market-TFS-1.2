--[[

---------------------------------------------------------------------
				ultimate item stat system by zbizu
---------------------------------------------------------------------
Made for OtLand.net. Do not post on other forums unless you link to a
thread where you got it from. If you are looking for more 1.1 scripts,
visit a thread where we are working on a list with important stuff:
---------------------------------------------------------------------
http://otland.net/threads/list-of-useful-tfs-1-0-1-1-scripts.228391/
---------------------------------------------------------------------
                    Version: 1.6.1, 3 Apr 2015
---------------------------------------------------------------------

]]

STATS_SYSTEM_CONFIG = {
	-- BASIC CONFIG STARTS HERE
	-- enable/disable features so script will execute only what you want
	monsterLoot = true,
	addSlotAction = true,
	addLevelAction = true,
	PVEStat = true,
	xpStat = true,
	lootStat = true,
	combatStats = true,
	conditionStats = true,
	reqLvlBasedOnUpgrade = true, -- requires TFS compiled after 8 Mar 2015
	reqLvlFormula = function(thing) return math.max(thing:getType():getRequiredLevel(), thing:getType():getRequiredLevel() + (thing:getLevel() * 10) + (thing:getStatSlotCount() * 10)) end,
	
	-- don't forget to register them in actions or they will not work
	GEM_BASIC_LEVEL = 8301,
	GEM_ADD_SLOT = 8300,
	GEM_RANDOM = 8305,
	GEM_RARE = 12663,
	GEM_EPIC = 12664,
	GEM_LEGENDARY = 12665,
	gems_power = {
		[12663] = {min_wl = 0, max_wl = 4, min_el = 0.3, max_el = 0.6, sl = function() return 2 end}, -- rare
		[12664] = {min_wl = 3, max_wl = 6, min_el = 0.6, max_el = 0.7, sl = function() return 3 end}, -- epic
		[12665] = {min_wl = 5, max_wl = 9, min_el = 0.8, max_el = 1, sl = function() return 4 end}, -- legendary
		[8305] = {min_wl = 0, max_wl = 9, min_el = 0.3, max_el = 1, sl = function() return math.random(2, 4) end} -- random
	},
	
	maxSlotCount = 4,
	slotChances = {
		[1] = 1000,
		[2] = 5000,
		[3] = 15000,
		[4] = 25000
	},
	tiers = { -- item name based on slots looted (if more than 1)
		[2] = 'rare',
		[3] = 'epic',
		[4] = 'legendary'
	},
	weapon_levels = {
		-- weapon name if no slots were assigned, chance(1000 = 1%)
		[-9] = {'useless', 300},
		[-8] = {'broken', 500},
		[-7] = {'trash', 1000},
		[-6] = {'ruined', 1500},
		[-5] = {'damaged', 2000},
		[-4] = {'worthless', 2500},
		[-3] = {'blunt', 4000},
		[-2] = {'cheap', 7000},
		[-1] = {'common', 9000},
		[1] = {'uncommon', 25000},
		[2] = {'strengthened', 20000},
		[3] = {'fine', 15000},
		[4] = {'superior', 10000},
		[5] = {'rare', 7500},
		[6] = {'unique', 3500},
		[7] = {'flawless', 2500},
		[8] = {'epic', 1000},
		[9] = {'legendary', 500}
	},
	ignoredIds = {}, -- items with these ids will be banned from upgrading
	upgradeMagicItems = true, -- items with xml-sided bonuses, examples: magma coat, fire axe, boots of haste
	upgradeItemsWithNoArmor = true, -- allow upgrading clothes without arm value
	lootUpgradedItems = true,
	rare_popup = true,
	rare_text = "*rare*",
	rare_effect = true,
	rare_effect_id = CONST_ME_MAGIC_GREEN,
	rare_loot_level = true, -- set to false if you want to disable levels on looted weapons
	rare_negative_level = true, -- set to false if you want to disable it
	rare_min_level =  -9,
	
	useSkill = true, -- enchanting power based on player's skill, set to false if you want it random
	skillTriesStorage = 3866,
	
	simple = { -- upgrade by jewels
		enabled = true,
		usePerks = false, -- unused
		randomSpells = true, -- todo: modal with selecting attr if false
		downgradeOnFail = true, -- item level only
	},
	
	-- BASIC CONFIG ENDS HERE
	-- do not touch things below unless you are a advanced scripter
	skillFormula = function(lv) return math.ceil(((1 * lv^3) - (2 * lv^2) + (4 * lv)) / (90 + lv) + lv) end,
	maxLevel = 30,
	
	levelUpgradeFormula = function(lv, minl)
		if STATS_SYSTEM_CONFIG.rare_negative_level then
			return math.ceil((lv/minl) * 25) + math.min(math.ceil(lv/minl * 5) +70, 75)
		else
			return 65 - math.ceil((lv/minl) * 3)
		end
	end,
	
	-- spells and values for certain types of item
	UPGRADE_STATS_VALUES_PER_LVL = {
		-- value per level
			atk = 2,
			def = 2,
			extradef = 1,
			arm = 2,
			hitchance = 3,
			shootrange = 1
	},
	
	UPGRADE_SPELLS = {
		necklace = {
			{'hp', 100, 10}, -- normal, percent
			{'mp', 200, 10},
			{'ml', 3, 10},
			{'melee', 3, 10},
			{'shield', 3, 10},
			{'dist', 3, 10},
			{'physical', 10, 5},
			{'energy', 10, 10},
			{'earth', 10, 10},
			{'fire', 10, 10},
			-- {'undefined', 10, 10},
			{'lifedrain', 10, 10},
			{'manadrain', 10, 10},
			{'healing', -10, -10},
			{'water', 20, 100},
			{'ice', 10, 10},
			{'holy', 10, 10},
			{'death', 10, 10},
			{'regHP', 5, 1}, -- normalhp, normalmp, percenthp, percentmp
			{'regMP', 10, 2}, -- normalhp, normalmp, percenthp, percentmp
			{'PVE death', 1, 100}
		},
		helmet = {
			{'ml', 3, 10},
			{'melee', 3, 10},
			{'dist', 3, 10},
			{'physical', 10, 3},
			{'energy', 10, 10},
			{'earth', 10, 10},
			{'fire', 10, 10},
			-- {'undefined', 10, 10},
			{'lifedrain', 10, 10},
			{'manadrain', 10, 10},
			{'healing', -10, -10},
			{'water', 20, 100},
			{'ice', 10, 10},
			{'holy', 10, 10},
			{'death', 10, 10},
			{'arm', 12, 70},
		},
		weapon = {
			{'melee', 5, 15},
			{'physical', 50, 10},
			{'energy', 50, 10},
			{'earth', 50, 10},
			{'fire', 50, 10},
			-- {'undefined', 50, 10},
			{'ice', 50, 10},
			{'holy', 50, 10},
			{'death', 50, 10},
			{'drainHP', 50, 3},
			{'drainMP', 50, 3},
			{'water', 50, 10},
			{'animals', 50, 10},
			{'humans', 50, 3},
			{'undeads', 50, 10},
			{'insects', 50, 10},
			{'atk', 12, 70},
			{'def', 12, 70},
			{'extra def', 12, 70},
		},
		distance = {
			{'dist', 5, 15},
			{'physical', 50, 10},
			{'energy', 50, 10},
			{'earth', 50, 10},
			{'fire', 50, 10},
			-- {'undefined', 50, 10},
			{'ice', 50, 10},
			{'holy', 50, 10},
			{'death', 50, 10},
			{'drainHP', 50, 3},
			{'drainMP', 50, 3},
			{'water', 50, 10},
			{'animals', 50, 10},
			{'humans', 50, 3},
			{'undeads', 50, 10},
			{'insects', 50, 10},
			{'atk', 12, 70},
			{'accuracy', 12, 70},
			{'range', 3, 50},
		},
		wand = {
			{'ml', 5, 15},
			{'physical', 50, 10},
			{'energy', 50, 10},
			{'earth', 50, 10},
			{'fire', 50, 10},
			-- {'undefined', 50, 10},
			{'healing', 50, 10},
			{'ice', 50, 10},
			{'holy', 50, 10},
			{'death', 50, 10},
			{'drainHP', 50, 3},
			{'drainMP', 50, 3},
			{'water', 50, 10},
			{'animals', 50, 10},
			{'humans', 50, 3},
			{'undeads', 50, 10},
			{'insects', 50, 10},
			{'range', 3, 50},
		},
		armor = {
			{'hp', 300, 15},
			{'mp', 500, 20},
			{'ml', 5, 15},
			{'melee', 5, 15},
			{'shield', 5, 15},
			{'dist', 5, 15},
			{'physical', 50, 5},
			{'energy', 10, 15},
			{'earth', 10, 15},
			{'fire', 10, 15},
			-- {'undefined', 10, 15},
			{'lifedrain', 10, 15},
			{'manadrain', 10, 15},
			{'healing', -10, -15},
			{'water', 20, 100},
			{'ice', 10, 15},
			{'holy', 10, 15},
			{'death', 10, 15},
			{'regHP', 5, 1},
			{'regMP', 10, 2},
			{'arm', 12, 70},
		},
		shield = {
			{'ml', 3, 10},
			{'shield', 5, 15},
			{'physical', 30, 5},
			{'energy', 10, 15},
			{'earth', 10, 15},
			{'fire', 10, 15},
			-- {'undefined', 10, 15},
			{'lifedrain', 10, 15},
			{'manadrain', 10, 15},
			{'ice', 10, 15},
			{'holy', 10, 15},
			{'death', 10, 15},
			{'regHP', 5, 1},
			{'regMP', 10, 2},
			{'def', 12, 70},
		},
		ring = {
			{'hp', 100, 10},
			{'mp', 200, 10},
			{'ml', 3, 10},
			{'melee', 3, 10},
			{'shield', 3, 10},
			{'dist', 3, 10},
			{'physical', 10, 5},
			{'energy', 10, 10},
			{'earth', 10, 10},
			{'fire', 10, 10},
			-- {'undefined', 10, 10},
			{'lifedrain', 10, 10},
			{'manadrain', 10, 10},
			{'healing', -10, -10},
			{'water', 20, 100},
			{'ice', 10, 10},
			{'holy', 10, 10},
			{'death', 10, 10},
			{'regHP', 5, 1},
			{'regMP', 10, 2},
			{'exp', 50, 50},
			{'loot', 1, 30},
		},
		legs = {
			{'ml', 3, 10},
			{'melee', 3, 10},
			{'shield', 3, 10},
			{'dist', 3, 10},
			{'physical', 10, 4},
			{'energy', 10, 10},
			{'earth', 10, 10},
			{'fire', 10, 10},
			-- {'undefined', 10, 10},
			{'lifedrain', 10, 10},
			{'manadrain', 10, 10},
			{'healing', -10, -10},
			{'ice', 10, 10},
			{'holy', 10, 10},
			{'death', 10, 10},
			{'arm', 12, 70},
		},
		boots = {
			{'physical', 10, 3},
			{'energy', 10, 10},
			{'earth', 10, 10},
			{'fire', 10, 10},
			-- {'undefined', 10, 10},
			{'lifedrain', 10, 10},
			{'manadrain', 10, 10},
			{'healing', -10, -10},
			{'ice', 10, 10},
			{'holy', 10, 10},
			{'death', 10, 10},
			{'regHP', 5, 1},
			{'regMP', 10, 2},
			{'arm', 12, 70},
		},
		charges = {
			{'charges', 500, 45},
		},
		decay = {
			{'time', 1200000, 50},
		},
	},
	
	STATS = {
		{
			name = 'hp',
			
			weaponLootName = {'',''},
			armorLootName = {'','of improved health'},
			otherLootName = {'','of improved health'},
			
			spellName = 'Health',
			enabledValues = true,
			enabledPercent = true
			},
		
		{
			name = 'mp',

			spellName = 'Mana',
			enabledValues = true,
			
			weaponLootName = {'',''},
			armorLootName = {'','of improved mana'},
			otherLootName = {'','of improved mana'},
			enabledPercent = true
		},
		
		{
			name = 'ml',

			weaponLootName = {'magic',''},
			armorLootName = {'enchanted',''},
			otherLootName = {'magic',''},

			spellName = 'Magic Level',
			enabledValues = true,	
			enabledPercent = true	
		},
		
		{
			name = 'melee',

			weaponLootName = {'','of power'},
			armorLootName = {'warrior',''},
			otherLootName = {'','of power'},

			spellName = 'Melee Skill',
			enabledValues = true,
			enabledPercent = true		
		},
		
		{
			name = 'shield',

			weaponLootName = {'','of defense'},
			armorLootName = {'fortified',''},
			otherLootName = {'','of defense'},
			
			spellName = 'Shielding',
			enabledValues = true,
			enabledPercent = true			
		},
		
		{
			name = 'dist',

			weaponLootName = {'','of hunting'},
			armorLootName = {'hunter',''},
			otherLootName = {'','of hunting'},
						
			spellName = 'Distance Skill',
			enabledValues = true,
			enabledPercent = true
		},

		-- element types
		-- on weapon: value = more or less element damage
		-- on armor: value = when something hits you, hit value may increase or decrease depending on value
		{
			name = 'physical',
			combatType = COMBAT_PHYSICALDAMAGE,

			weaponLootName = {'','of bleeding'},
			armorLootName = {'strong',''},
			otherLootName = {'stone',''},
			
			spellName = 'Physical',
			enabledValues = true,
			enabledPercent = true,
			
			effect = CONST_ME_BLOCKHIT
		},
		
		
		{
			name = 'energy',
			combatType = COMBAT_ENERGYDAMAGE,
			
			weaponLootName = {'','of thunders'},
			armorLootName = {'','of sparks'},
			otherLootName = {'','of lightning'},
			
			oppositeSpell = 'earth', -- unused values
			spellName = 'Energy',
			enabledValues = true,
			enabledPercent = true,
			
			effect = CONST_ME_ENERGYHIT
		},
		
		{
			name = 'earth',
			combatType = COMBAT_EARTHDAMAGE,

			weaponLootName = {'poison',''},
			armorLootName = {'earthproof',''},
			otherLootName = {'','of antidote'},
			
			oppositeSpell = 'energy',
			spellName = 'Earth',
			enabledValues = true,
			enabledPercent = true,
			effect = CONST_ME_SMALLPLANTS
		},
		
		{
			name = 'fire',
			combatType = COMBAT_FIREDAMAGE,

			weaponLootName = {'burning',''},
			armorLootName = {'fireproof',''},
			otherLootName = {'','of fire protection'},
			
			oppositeSpell = 'ice',
			spellName = 'Fire',
			enabledValues = true,
			enabledPercent = true,
			effect = CONST_ME_FIREATTACK
		},
		
		{
			-- exist in tfs, not in use by default
			name = 'undefined',
			combatType = COMBAT_UNDEFINEDDAMAGE,

			weaponLootName = {'ghost',''},
			armorLootName = {'',''},
			otherLootName = {'',''},
			
			spellName = 'None',
			enabledValues = false,
			enabledPercent = false,
			effect = CONST_ME_GROUNDSHAKER
		},
		
		{
			name = 'lifedrain',
			combatType = COMBAT_LIFEDRAIN,
			
			weaponLootName = {'cursed',''},
			armorLootName = {'enchanted',''},
			otherLootName = {'blessed',''},
			
			oppositeSpell = 'healing',
			spellName = 'Lifedrain',
			enabledValues = true,
			enabledPercent = true,
			effect = CONST_ME_MAGIC_RED
		},
		
		{
			name = 'manadrain',
			combatType = COMBAT_MANADRAIN,
			
			weaponLootName = {'','of dark magic'},
			armorLootName = {'sealed',''},
			otherLootName = {'','of mana protection'},
			
			spellName = 'Manadrain',
			enabledValues = true,
			enabledPercent = true,
			effect = CONST_ME_LOSEENERGY
		},
		
		{
			-- should not be used by weapons
			name = 'healing',
			combatType = COMBAT_HEALING,
			
			weaponLootName = {'healer',''},
			armorLootName = {'','of healing'},
			otherLootName = {'','of healing'},
			
			oppositeSpell = 'lifedrain',
			spellName = 'Healing',
			enabledValues = true,
			enabledPercent = true,
			effect = CONST_ME_MAGIC_BLUE
		},
		
		{
			name = 'water',
			combatType = COMBAT_DROWNDAMAGE,
			
			weaponLootName = {'','of fear'},
			armorLootName = {'','of the deep'},
			otherLootName = {'','of the deep'},
			
			spellName = 'Water',
			enabledValues = true,
			enabledPercent = true,
			effect = CONST_ME_LOSEENERGY
		},
		
		{
			name = 'ice',
			combatType = COMBAT_ICEDAMAGE,
			
			weaponLootName = {'icy',''},
			armorLootName = {'frozen',''},
			otherLootName = {'','of cold'},
			
			oppositeSpell = 'fire',
			spellName = 'Ice',
			enabledValues = true,
			enabledPercent = true,
			effect = CONST_ME_ICEATTACK
		},
		
		{
			name = 'holy',
			combatType = COMBAT_HOLYDAMAGE,
			
			weaponLootName = {'divine',''},
			armorLootName = {'','of darkness'},
			otherLootName = {'dark',''},
			
			oppositeSpell = 'death',
			spellName = 'Holy',
			enabledValues = true,
			enabledPercent = true,
			effect = CONST_ME_HOLYDAMAGE
		},
		
		{
			name = 'death',
			combatType = COMBAT_DEATHDAMAGE,

			weaponLootName = {'','of darkness'},
			armorLootName = {'','of inquisition'},
			otherLootName = {'holy',''},
			
			oppositeSpell = 'holy',
			spellName = 'Death',
			enabledValues = true,
			enabledPercent = true,
			effect = CONST_ME_MORTAREA
		},
		
		-- weapon only
		{
			name = 'drainHP',
			drain = COMBAT_LIFEDRAIN,

			weaponLootName = {'vampire',''},
			armorLootName = {'',''},
			otherLootName = {'',''},
			
			spellName = 'Drain Health',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'drainMP',
			drain = COMBAT_MANADRAIN,

			weaponLootName = {'','of weakness'},
			armorLootName = {'',''},
			otherLootName = {'',''},
			
			spellName = 'Drain Mana',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'animals',
			weaponLootName = {'hunting',''},
			armorLootName = {'',''},
			otherLootName = {'',''},
			spellName = 'Animals',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'humans',

			weaponLootName = {'',''},
			armorLootName = {'',''},
			otherLootName = {'',''},
			
			spellName = 'Humans',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'undeads',

			weaponLootName = {'','of inquisition'},
			armorLootName = {'',''},
			otherLootName = {'',''},
			
			spellName = 'Undeads',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'insects',
			
			weaponLootName = {'','of insect hunting'},
			armorLootName = {'',''},
			otherLootName = {'',''},
			
			spellName = 'Insects',
			enabledValues = true,
			enabledPercent = true
		},

		-- buff
		{
			name = 'regHP',
			
			weaponLootName = {'',''},
			armorLootName = {'','of vitality'},
			otherLootName = {'','of vitality'},
			
			spellName = 'HP Regeneration',
			enabledValues = true,
			enabledPercent = true
		},

		{
			name = 'regMP',
			
			weaponLootName = {'',''},
			armorLootName = {'','of magic'},
			otherLootName = {'','of magic'},
			
			spellName = 'MP Regeneration',
			enabledValues = true,
			enabledPercent = true
		},
		
		-- attr based stats
		{
			name = 'charges',
			
			weaponLootName = {'',''},
			armorLootName = {'',''},
			otherLootName = {'charged',''},
			
			spellName = 'Charges',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'time',
			
			weaponLootName = {'',''},
			armorLootName = {'',''},
			otherLootName = {'fine',''},
			
			spellName = 'Duration',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'atk',
			
			weaponLootName = {'sharpened',''},
			armorLootName = {'',''},
			otherLootName = {'',''},
			
			spellName = 'Attack',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'def',
			
			weaponLootName = {'strong',''},
			armorLootName = {'fortified',''},
			otherLootName = {'',''},
			
			spellName = 'Defense',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'extra def',
			
			weaponLootName = {'','of balance'},
			armorLootName = {'',''},
			otherLootName = {'',''},
			
			spellName = 'Extra Defense',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'arm',
			
			weaponLootName = {'',''},
			armorLootName = {'masterpiece of',''},
			otherLootName = {'',''},
			
			spellName = 'Armor',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'accuracy',
			
			weaponLootName = {'accurate',''},
			armorLootName = {'',''},
			otherLootName = {'',''},
			
			spellName = 'Hit Chance',
			enabledValues = true, -- hit% + x%
			enabledPercent = true -- hit% + hit%*x%
		},
		
		{
			name = 'range',
			
			weaponLootName = {'sniper',''},
			armorLootName = {'',''},
			otherLootName = {'',''},
			
			spellName = 'Range',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'PVE death',
			
			weaponLootName = {'',''},
			armorLootName = {'',''},
			otherLootName = {'','of good fate'},
			
			spellName = 'PVE Death',
			enabledValues = true,
			enabledPercent = true
		},
		-- xp, loot
		{
			name = 'exp',
			
			weaponLootName = {'',''},
			armorLootName = {'',''},
			otherLootName = {'','of experience'},
			
			spellName = 'Extra Exp',
			enabledValues = true,
			enabledPercent = true
		},
		
		{
			name = 'loot',
			
			weaponLootName = {'',''},
			armorLootName = {'',''},
			otherLootName = {'','of luck'},
			
			spellName = 'Luck',
			enabledValues = true,
			enabledPercent = true
		},
	},
}

function getItemAttribute(uid, key, force)
	local i = ItemType(Item(uid):getId())
	local string_attributes = {
		[ITEM_ATTRIBUTE_NAME] = i:getName(),
		[ITEM_ATTRIBUTE_ARTICLE] = i:getArticle(),
		[ITEM_ATTRIBUTE_PLURALNAME] = i:getPluralName(),
		["name"] = i:getName(),
		["article"] = i:getArticle(),
		["pluralname"] = i:getPluralName()
	}

	local numeric_attributes = {
		[ITEM_ATTRIBUTE_WEIGHT] = i:getWeight(),
		[ITEM_ATTRIBUTE_ATTACK] = i:getAttack(),
		[ITEM_ATTRIBUTE_DEFENSE] = i:getDefense(),
		[ITEM_ATTRIBUTE_EXTRADEFENSE] = i:getExtraDefense(),
		[ITEM_ATTRIBUTE_ARMOR] = i:getArmor(),
		[ITEM_ATTRIBUTE_HITCHANCE] = i:getHitChance(),
		[ITEM_ATTRIBUTE_SHOOTRANGE] = i:getShootRange(),
		["weight"] = i:getWeight(),
		["attack"] = i:getAttack(),
		["defense"] = i:getDefense(),
		["extradefense"] = i:getExtraDefense(),
		["armor"] = i:getArmor(),
		["hitchance"] = i:getHitChance(),
		["shootrange"] = i:getShootRange()
	}

	local item = Item(uid)
	local attr = item:getAttribute(key)
	if tonumber(attr) then
		if numeric_attributes[key] then
			if force and item:getActionId() == 101 then
				return attr
			else
				return attr ~= 0 and attr or numeric_attributes[key]
			end
		end
	else
		if string_attributes[key] then
			if attr == "" then
				return string_attributes[key]
			end
		end
	end
	return attr
end

function doItemSetAttribute(uid, key, value)
	return Item(uid):setAttribute(key, value)
end

function doItemEraseAttribute(uid, key)
	return Item(uid):removeAttribute(key)
end

local element_stats = {}
local drain_stats = {}

for i = 1, #STATS_SYSTEM_CONFIG.STATS do
	local stat = STATS_SYSTEM_CONFIG.STATS[i]
	if stat.drain then
		drain_stats[stat.name] = stat.drain
	end
	
	if stat.combatType then
		element_stats[stat.name] = {combat = stat.combatType, effect = stat.effect}
	end
end

local stat_conditions = {
[1] = {['hp'] = {}, ['mp'] = {}, ['ml'] = {}, ['melee'] = {}, ['shield'] = {}, ['dist'] = {}}, -- normal
[2] = {['hp'] = {}, ['mp'] = {}, ['ml'] = {}, ['melee'] = {}, ['shield'] = {}, ['dist'] = {}} -- percent
}

for i = -95, 300 do
-- % stats and skills
	stat_conditions[2]['hp'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[2]['hp'][i], CONDITION_PARAM_SUBID, 50)
	setConditionParam(stat_conditions[2]['hp'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[2]['hp'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[2]['hp'][i], CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 100+i)

	stat_conditions[2]['mp'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[2]['mp'][i], CONDITION_PARAM_SUBID, 51)
	setConditionParam(stat_conditions[2]['mp'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[2]['mp'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[2]['mp'][i], CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 100+i)

	stat_conditions[2]['ml'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[2]['ml'][i], CONDITION_PARAM_SUBID, 52)
	setConditionParam(stat_conditions[2]['ml'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[2]['ml'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[2]['ml'][i], CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, 100+i)

	stat_conditions[2]['melee'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[2]['melee'][i], CONDITION_PARAM_SUBID, 53)
	setConditionParam(stat_conditions[2]['melee'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[2]['melee'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[2]['melee'][i], CONDITION_PARAM_SKILL_MELEEPERCENT, 100+i)

	stat_conditions[2]['shield'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[2]['shield'][i], CONDITION_PARAM_SUBID, 54)
	setConditionParam(stat_conditions[2]['shield'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[2]['shield'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[2]['shield'][i], CONDITION_PARAM_SKILL_SHIELDPERCENT, 100+i)

	stat_conditions[2]['dist'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[2]['dist'][i], CONDITION_PARAM_SUBID, 55)
	setConditionParam(stat_conditions[2]['dist'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[2]['dist'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[2]['dist'][i], CONDITION_PARAM_SKILL_DISTANCEPERCENT, 100+i)
end

for i = -1500, 1500 do
	-- hp mp normal
	stat_conditions[1]['hp'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[1]['hp'][i], CONDITION_PARAM_SUBID, 56)
	setConditionParam(stat_conditions[1]['hp'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[1]['hp'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[1]['hp'][i], CONDITION_PARAM_STAT_MAXHITPOINTS, i)

	stat_conditions[1]['mp'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[1]['mp'][i], CONDITION_PARAM_SUBID, 57)
	setConditionParam(stat_conditions[1]['mp'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[1]['mp'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[1]['mp'][i], CONDITION_PARAM_STAT_MAXMANAPOINTS, i)
end

for i = -100, 100 do
	-- skills
	stat_conditions[1]['ml'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[1]['ml'][i], CONDITION_PARAM_SUBID, 58)
	setConditionParam(stat_conditions[1]['ml'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[1]['ml'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[1]['ml'][i], CONDITION_PARAM_STAT_MAGICPOINTS, i)

	stat_conditions[1]['melee'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[1]['melee'][i], CONDITION_PARAM_SUBID, 59)
	setConditionParam(stat_conditions[1]['melee'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[1]['melee'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[1]['melee'][i], CONDITION_PARAM_SKILL_MELEE, i)

	stat_conditions[1]['shield'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[1]['shield'][i], CONDITION_PARAM_SUBID, 60)
	setConditionParam(stat_conditions[1]['shield'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[1]['shield'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[1]['shield'][i], CONDITION_PARAM_SKILL_SHIELD, i)

	stat_conditions[1]['dist'][i] = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(stat_conditions[1]['dist'][i], CONDITION_PARAM_SUBID, 61)
	setConditionParam(stat_conditions[1]['dist'][i], CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(stat_conditions[1]['dist'][i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(stat_conditions[1]['dist'][i], CONDITION_PARAM_SKILL_DISTANCE, i)
end

local magic_words = { -- see upgradeMagicItems in config
	'physical',
	'fire',
	'ice',
	'earth',
	'energy',
	'poison',
	'drown',
	'holy',
	'death',
	'lifedrain',
	'manadrain',
	'protection',
	'magic',
	'fighting',
	'shielding',
	'speed',
	'invisibility',
	'drinking',
	'regeneration',
}
	
local upgrade_types = {
	none = false,
	necklace = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.necklace,
	helmet = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.helmet,
	weapon = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.weapon,
	distance = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.distance,
	wand = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.wand,
	armor = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.armor,
	shield = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.shield,
	ring = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.ring,
	legs = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.legs,
	boots = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.boots,
	charges = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.charges,
	decay = STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.decay,
}

function Item:getUpgradeType()
	local it_id = self:getType()
	if it_id:isStackable() or it_id:isContainer() then
		return upgrade_types.none
	end

	local wp = it_id:getWeaponType()
	if self:getAttribute(ITEM_ATTRIBUTE_CHARGES) > 0 then
		if wp > 0 then
			return upgrade_types.none
		end
		return upgrade_types.charges
	end

	if self:getAttribute(ITEM_ATTRIBUTE_DURATION) > 0 then
		if wp > 0 then
			return upgrade_types.none
		end
		return upgrade_types.decay
	else
		if self:getBaseDuration() > 0 then
			if wp > 0 then
				return upgrade_types.none
			end
			return upgrade_types.decay
		end
	end
	
	if wp > 0 then
		if wp == WEAPON_SHIELD then
			return upgrade_types.shield
		elseif wp == WEAPON_DISTANCE then
			return upgrade_types.distance
		elseif wp == WEAPON_WAND then
			return upgrade_types.wand
		elseif isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, wp) then
			return upgrade_types.weapon
		end
	else
		local slot = it_id:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
		if it_id:getArmor() > 0 or STATS_SYSTEM_CONFIG.upgradeItemsWithNoArmor then
			if slot == SLOTP_HEAD then
				return upgrade_types.helmet
			elseif slot == SLOTP_ARMOR then
				return upgrade_types.armor
			elseif slot == SLOTP_LEGS then
				return upgrade_types.legs
			elseif slot == SLOTP_FEET then
				return upgrade_types.boots
			end
		end
		
		if slot == SLOTP_NECKLACE then
			return upgrade_types.necklace
		end
		
		if slot == SLOTP_RING then
			return upgrade_types.ring
		end
	end
	
	return upgrade_types.none
end

function Item:getStatSlotCount()
	local c = 0
	for _ in self:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION):gmatch('%[(.-)%]') do
		c = c+1
	end
	return c
end

function Item:getStatSlots()
	local t = {}
	for _ in self:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION):gmatch('(%[.-%])') do
		if _ then
			if _:match('%[(.+)%]') then
				local n = _:match('%[(.+)%]')
				if n ~= '?' then
					local n1 = n:split(".")
					local i = #t + 1
					t[i] = {n1[1], n1[2]}
				end
			end
		end
	end
	return t
end

function Item:addStatSlot(spell, val, suffix)
	if spell and val then
		if not suffix then suffix = "" end
		self:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, self:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION) .. "[" .. spell .. "." .. (val >= 0 and "+" .. val or val) .. suffix .. "]")
	else
		return false
	end
return true
end

function Item:addSlot(name, val, percent)
	val = tonumber(val)
	if name and val then
		if self:addStat(name, val, (percent and "%" or "")) then
			return true
		end
	end
	return false
end

function Item:getBaseDuration()
	local it_id = self:getId()
	local tid = ItemType(it_id):getTransformEquipId()
	local vx = self:getAttribute(ITEM_ATTRIBUTE_DURATION)
	
	if tid > 0 then
		self:transform(tid)
		vx = self:getAttribute(ITEM_ATTRIBUTE_DURATION)
		self:transform(it_id)
		self:removeAttribute(ITEM_ATTRIBUTE_DURATION)
	end
	return vx
end

function Item:getBaseStatsInfo()
	local it_id = self:getType()
	local t = {
		attack = it_id:getAttack(),
		defense = it_id:getDefense(),
		extraDefense = it_id:getExtraDefense(),
		armor = it_id:getArmor(),
		hitChance = it_id:getHitChance(),
		shootRange = it_id:getShootRange(),
		charges = it_id:getCharges(),
		duration = self:getBaseDuration()
	}
	return t
end

function getEnchantingSkill(tries)
local xp = 0
local level = 0
	for lv = 1, STATS_SYSTEM_CONFIG.maxLevel do
		xp = STATS_SYSTEM_CONFIG.skillFormula(lv) -- alternative: xp = xp + STATS_SYSTEM_CONFIG.skillFormula(lv)
		if tries < xp then
			level = lv
			break
		end
		level = lv
	end
	return level
end

local SPELL_TYPE_VALUE = 1
local SPELL_TYPE_PERCENT = 2
local attrkeys = {
	['charges'] = ITEM_ATTRIBUTE_CHARGES,
	['time'] = ITEM_ATTRIBUTE_DURATION,
	['atk'] = ITEM_ATTRIBUTE_ATTACK,
	['def'] = ITEM_ATTRIBUTE_DEFENSE,
	['extra def'] = ITEM_ATTRIBUTE_EXTRADEFENSE,
	['arm'] = ITEM_ATTRIBUTE_ARMOR,
	['accuracy'] = ITEM_ATTRIBUTE_HITCHANCE,
	['range'] = ITEM_ATTRIBUTE_SHOOTRANGE
}

function Item.addStat(item, spellname, spellvalue, suffix, cid)
	if isInArray({'charges', 'time', 'atk', 'def', 'extra def', 'arm', 'accuracy', 'range'}, spellname) then
		local basestats = item:getBaseStatsInfo()
		local basestats2 = {
			['charges'] = basestats.charges,
			['time'] = basestats.duration,
			['atk'] = basestats.attack,
			['def'] = basestats.defense,
			['extra def'] = basestats.extraDefense,
			['arm'] = basestats.armor,
			['accuracy'] = basestats.hitChance,
			['range'] = basestats.shootRange
		}
		
		local uid = item:getUniqueId()
		local fullstats = {
			['charges'] = getItemAttribute(uid, ITEM_ATTRIBUTE_CHARGES),
			['time'] = item:getBaseDuration(),
			['atk'] = getItemAttribute(uid, ITEM_ATTRIBUTE_ATTACK),
			['def'] = getItemAttribute(uid, ITEM_ATTRIBUTE_DEFENSE),
			['extra def'] = getItemAttribute(uid, ITEM_ATTRIBUTE_EXTRADEFENSE),
			['arm'] = getItemAttribute(uid, ITEM_ATTRIBUTE_ARMOR),
			['accuracy'] = getItemAttribute(uid, ITEM_ATTRIBUTE_HITCHANCE),
			['range'] = getItemAttribute(uid, ITEM_ATTRIBUTE_SHOOTRANGE)
		}
		
		
		if suffix == "%" then
			if basestats2[spellname] == 0 then
				if cid then
					Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "Spell " .. spellname .. "% is not available for this item.")
				end
				return false
			end
			item:setAttribute(attrkeys[spellname], fullstats[spellname] + math.abs(math.floor((basestats2[spellname] * spellvalue/100)))) -- basestat intended to prevent too high values when combined with upgrade system
		else
			item:setAttribute(attrkeys[spellname], fullstats[spellname] + math.abs(spellvalue))
		end
	end
	item:addStatSlot(spellname, spellvalue, suffix)
	return true
end

local upgradable_stats = {
	[1] = {ITEM_ATTRIBUTE_ATTACK, function(id) return id:getAttack() end, STATS_SYSTEM_CONFIG.UPGRADE_STATS_VALUES_PER_LVL.atk},
	[2] = {ITEM_ATTRIBUTE_DEFENSE, function(id) return id:getDefense() end, STATS_SYSTEM_CONFIG.UPGRADE_STATS_VALUES_PER_LVL.def},
	[3] = {ITEM_ATTRIBUTE_EXTRADEFENSE, function(id) return id:getExtraDefense() end, STATS_SYSTEM_CONFIG.UPGRADE_STATS_VALUES_PER_LVL.extradef},
	[4] = {ITEM_ATTRIBUTE_ARMOR, function(id) return id:getArmor() end, STATS_SYSTEM_CONFIG.UPGRADE_STATS_VALUES_PER_LVL.arm},
	[5] = {ITEM_ATTRIBUTE_HITCHANCE, function(id) return id:getHitChance() end, STATS_SYSTEM_CONFIG.UPGRADE_STATS_VALUES_PER_LVL.hitchance},
	[6] = {ITEM_ATTRIBUTE_SHOOTRANGE, function(id) return id:getShootRange() > 1 and id:getShootRange() or 0 end, STATS_SYSTEM_CONFIG.UPGRADE_STATS_VALUES_PER_LVL.shootrange}
}

function stat_onUse(player, item, fromPosition, target, toPosition, attempt)


--if not(Item(target) or Creature(target)) then return false end


local itemEx = {
	uid = target:isItem() and target:getUniqueId() or target:getId(),
	itemid = target:isItem() and target:getId() or 0
}


	if item.itemid == STATS_SYSTEM_CONFIG.GEM_BASIC_LEVEL then
		if STATS_SYSTEM_CONFIG.addLevelAction then
			local it_id = ItemType(itemEx.itemid)
			if it_id then
				if not it_id:isStackable() then				
					if it_id:getTransformEquipId() < 1 then
						if it_id:getCharges() < 1 then
							local item_sp_slot = it_id:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
							if item_sp_slot ~= SLOTP_NECKLACE and item_sp_slot ~= SLOTP_RING and (item_sp_slot > 0 or it_id:getWeaponType() > 0) then
								local stat_min = 1
								if STATS_SYSTEM_CONFIG.rare_negative_level then
									stat_min = STATS_SYSTEM_CONFIG.rare_min_level
								end
								
								local stat_max = #STATS_SYSTEM_CONFIG.weapon_levels
								local stat_lvl = tonumber(getItemAttribute(itemEx.uid, ITEM_ATTRIBUTE_NAME):match("%s%+%d+") or getItemAttribute(itemEx.uid, ITEM_ATTRIBUTE_NAME):match("%s%-%d+"))
								if stat_lvl == stat_max then
									player:sendTextMessage(MESSAGE_INFO_DESCR, "This item is on max level already.")
									return true
								end
								
								local n_lvl = stat_lvl
								if not stat_lvl then
									stat_lvl = 0
								end

								local chance = STATS_SYSTEM_CONFIG.levelUpgradeFormula(stat_lvl, stat_min)
								local it_u = Item(itemEx.uid)
								local it_name = it_u:getName()
								if stat_lvl > 0 then
									it_name = getItemAttribute(itemEx.uid, ITEM_ATTRIBUTE_NAME):split("+")[1]
								elseif stat_lvl < 0 then
									it_name = getItemAttribute(itemEx.uid, ITEM_ATTRIBUTE_NAME):split("-")[1]
								end
								
								it_name = it_name:gsub("^%s*(.-)%s*$", "%1")
								
								if math.random(1, 100) <= chance then
									n_lvl = stat_lvl + 1
								else
									if STATS_SYSTEM_CONFIG.simple.downgradeOnFail then
										n_lvl = stat_lvl - 1
									end
								end

								for i = 1, #upgradable_stats do
									local n_item_stat = upgradable_stats[i][2](it_id)
									if upgradable_stats[i][1] ~= ITEM_ATTRIBUTE_ATTACK or it_id:getWeaponType() ~= WEAPON_SHIELD then
										it_u:setAttribute(upgradable_stats[i][1], getItemAttribute(itemEx.uid, upgradable_stats[i][1], true) + (upgradable_stats[i][3] * (n_lvl - stat_lvl)))
									end
								end

								it_u:setActionId(101)
								Item(item.uid):remove(1)
								if (n_lvl - stat_lvl) > 0 then
									player:sendTextMessage(MESSAGE_INFO_DESCR, it_name:gsub("^%l", string.upper) .. " upgraded to " .. (n_lvl > 0 and "+" or "") .. n_lvl .. ".")
									toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
								else
									player:sendTextMessage(MESSAGE_INFO_DESCR, "Attempt to upgrade failed.")
									toPosition:sendMagicEffect(CONST_ME_HITAREA)
								end

								it_u:setAttribute(ITEM_ATTRIBUTE_NAME, it_name .. (n_lvl ~= 0 and (" " .. (n_lvl > 0 and "+" or "") .. n_lvl) or ""))
								return true
							end
						end
					end
				end
			end
		end
		return false
	end

	if item.itemid == STATS_SYSTEM_CONFIG.GEM_ADD_SLOT then
		if not STATS_SYSTEM_CONFIG.addSlotAction then
			return false
		end
		
		if not attempt then
			attempt = 1
		end
		
		if attempt == 10 then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Unable to add slot.")
			return true
		end
		
		local it_u = Item(itemEx.uid)
		if not it_u then
			return false
		end
		
		if not STATS_SYSTEM_CONFIG.simple.enabled then
			return false
		end
		
		if not STATS_SYSTEM_CONFIG.simple.randomSpells then
			-- popup modal
			-- popUpStatModal_index(player, item.uid)
			print("todo: modal window")
			return true
		end
		
		if isInArray(STATS_SYSTEM_CONFIG.ignoredIds, itemEx.itemid) then
			-- player:sendTextMessage(MESSAGE_INFO_DESCR, "You cannot upgrade this item.")
			return false
		end
		
		local it_id = ItemType(itemEx.itemid)
		local u = it_u:getUpgradeType()
		
		if not u then
			-- player:sendTextMessage(MESSAGE_INFO_DESCR, "You cannot upgrade this item.")
			return false
		end
	
		if not STATS_SYSTEM_CONFIG.upgradeMagicItems then
			local atr = it_u:getDescription():match('%((.+)%)')
			if atr and magic_words then
				if #magic_words > 0 then
					for i = 1, #magic_words do
						if atr:match(magic_words[i]) then
							player:sendTextMessage(MESSAGE_INFO_DESCR, "You cannot upgrade magic items.")
							return true
						end
					end
				end
			end
		end
	
		local stat = math.random(1, #u)
		
		local tries = player:getStorageValue(STATS_SYSTEM_CONFIG.skillTriesStorage)
		if tries < 0 then
			player:setStorageValue(STATS_SYSTEM_CONFIG.skillTriesStorage, 0)
		end
		
		local level = STATS_SYSTEM_CONFIG.useSkill and getEnchantingSkill(tries) or math.random(1, STATS_SYSTEM_CONFIG.maxLevel)
		
		local spellname = u[stat][1]	
		local spelltype = 0
		local available_spell_types = {}
		
		for i = 1, #STATS_SYSTEM_CONFIG.STATS do
			if STATS_SYSTEM_CONFIG.STATS[i].name == spellname then
				if STATS_SYSTEM_CONFIG.STATS[i].enabledValues then
					table.insert(available_spell_types, SPELL_TYPE_VALUE)
				end
				
				if STATS_SYSTEM_CONFIG.STATS[i].enabledPercent then
					table.insert(available_spell_types, SPELL_TYPE_PERCENT)
				end
				
				if #available_spell_types > 0 then
					spelltype = available_spell_types[math.random(1, #available_spell_types)]
				end
				break
			end
		end
	
		if spelltype == 0 then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Error: spell is unavailable.")
			return true
		end
		
		local spellattr = nil
		for i = 1, #STATS_SYSTEM_CONFIG.STATS do
			if STATS_SYSTEM_CONFIG.STATS[i].name == spellname then
				spellattr = STATS_SYSTEM_CONFIG.STATS[i]
				break
			end
		end
		
		if not spellattr then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Error: spell is unavailable.")
			return true
		end
			
		local prc = (level * 100/STATS_SYSTEM_CONFIG.maxLevel)/100
		local attrval = 0
		local attrstr = ""
		
		if spelltype == SPELL_TYPE_VALUE then
			attrval = math.floor(prc * u[stat][2])
		elseif spelltype == SPELL_TYPE_PERCENT then
			attrval = math.floor(prc * u[stat][3])
			attrstr = "%"
		end

		if attrval == 0 then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Error: spell is unavailable.")
			return true
		end
		
		local slotc = it_u:getStatSlotCount()
		if slotc == STATS_SYSTEM_CONFIG.maxSlotCount then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Slot limit reached.")
			return true
		end
		
		local cur_slots = it_u:getStatSlots()
		for i = 1, slotc do
			if spellname == cur_slots[i][1] then
				-- player:sendTextMessage(MESSAGE_INFO_DESCR, "Duplicate stat, try again.")
				stat_onUse(player, item, fromPosition, itemEx, toPosition, attempt + 1)
				return true
			end
		end

		if it_u:addStat(spellname, attrval, attrstr, player:getId()) then
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Upgrade successful.\n" .. spellattr.spellName .. " " .. (attrval >= 0 and "+" .. attrval or attrval) .. attrstr)
			doRemoveItem(item.uid, 1)
			if STATS_SYSTEM_CONFIG.useSkill then
				player:setStorageValue(STATS_SYSTEM_CONFIG.skillTriesStorage, player:getStorageValue(STATS_SYSTEM_CONFIG.skillTriesStorage) + 1)
				local nlevel = STATS_SYSTEM_CONFIG.useSkill and getEnchantingSkill(player:getStorageValue(STATS_SYSTEM_CONFIG.skillTriesStorage)) or math.random(1, STATS_SYSTEM_CONFIG.maxLevel)
				if nlevel > level then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You advanced to enchanting Level " .. (nlevel < STATS_SYSTEM_CONFIG.maxLevel and nlevel or nlevel .. " [max]") .. ".")
				end
			end
		end
		return true
	end

	if isInArray({STATS_SYSTEM_CONFIG.GEM_RARE, STATS_SYSTEM_CONFIG.GEM_EPIC, STATS_SYSTEM_CONFIG.GEM_LEGENDARY, STATS_SYSTEM_CONFIG.GEM_RANDOM}, item.itemid) then
	local item2 = Item(itemEx.uid)

		if item2 then
			local u = item2:getUpgradeType()
			if u then
				if item2:generateStats(u, STATS_SYSTEM_CONFIG.gems_power[item.itemid].sl(), math.random(STATS_SYSTEM_CONFIG.gems_power[item.itemid].min_wl, STATS_SYSTEM_CONFIG.gems_power[item.itemid].max_wl), math.floor(STATS_SYSTEM_CONFIG.maxLevel * STATS_SYSTEM_CONFIG.gems_power[item.itemid].min_el), math.ceil(STATS_SYSTEM_CONFIG.maxLevel * STATS_SYSTEM_CONFIG.gems_power[item.itemid].max_el)) then
					toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
					doRemoveItem(item.uid, 1)
					player:sendTextMessage(MESSAGE_INFO_DESCR, "Item modification successful.")
					return true
				end
			end
		end
		return false
	end
	
	return false
end
	
local slots = {
	CONST_SLOT_HEAD,
	CONST_SLOT_NECKLACE,
	CONST_SLOT_BACKPACK,
	CONST_SLOT_ARMOR,
	CONST_SLOT_RIGHT,
	CONST_SLOT_LEFT,
	CONST_SLOT_LEGS,
	CONST_SLOT_FEET,
	CONST_SLOT_RING,
	CONST_SLOT_AMMO
}

local human_looktypes = {
	57, 58, 62, 63, 64, 66, 69, 70, 71, 72, 73, 75, 93, 96, 97,
	98, 126, 127, 128, 129, 130, 131, 132, 133, 134, 136, 137,
	138, 139, 140, 141, 142, 143, 144, 145, 145, 147, 148, 149,
	150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 193,
	194, 203, 251, 252, 253, 254, 255, 264, 266, 268, 269, 270,
	273, 278, 279, 288, 289, 302, 324, 325, 328, 329, 331, 332,
	366, 367, 386, 416, 423, 430, 431, 432, 433, 463, 464, 465,
	466, 471, 472, 493, 507, 512, 513, 513, 516, 537, 538, 539,
	541, 542, 574, 575, 577, 578, 610, 618, 619, 620
}

function stat_onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if origin == 2 then return primaryDamage, primaryType, secondaryDamage, secondaryType end
	if not creature then return primaryDamage, primaryType, secondaryDamage, secondaryType end
	if not attacker then return primaryDamage, primaryType, secondaryDamage, secondaryType end
	local cid = creature:getId()
	local aid = attacker:getId()
	
	-- weapon extra damage
	if attacker:isPlayer() then
		for i = CONST_SLOT_RIGHT, CONST_SLOT_LEFT do
			local item = attacker:getSlotItem(slots[i])
			if item then
				if STATS_SYSTEM_CONFIG.reqLvlBasedOnUpgrade then
					if item then
						if isWeapon(item:getUniqueId()) then
							local lv = attacker:getLevel()
							local rlv = item:getStatReqLevel()
							if rlv > lv then
								local ndmg = lv/rlv
								primaryDamage = math.floor(primaryDamage * ndmg)
								secondaryDamage = math.floor(secondaryDamage * ndmg)
							end
						end
					end
				end
			
			
				local cur_slots = item:getStatSlots()
				local it_id = ItemType(item:getId())
				if it_id:getWeaponType() > 0 and it_id:getWeaponType() ~= WEAPON_SHIELD then
					local slotc = item:getStatSlotCount()
					if slotc > 0 then
						for i = 1, slotc do
							if element_stats[cur_slots[i][1]] then
								if cur_slots[i][2]:match("%%") then
									local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
									local dmg = math.floor((primaryDamage * (tonumber(a..b)/100)))
									if dmg > 0 then
										doTargetCombatHealth(aid, cid, element_stats[cur_slots[i][1]].combat, 1, dmg, element_stats[cur_slots[i][1]].effect)
									end
								else
									local dmg = math.floor(math.random(0, tonumber(cur_slots[i][2])))
									if dmg > 0 then
										doTargetCombatHealth(aid, cid, element_stats[cur_slots[i][1]].combat, 1, dmg, element_stats[cur_slots[i][1]].effect)
									end
								end
							else
								if creature and attacker then
									if creature:getId() ~= attacker:getId() then
										if cur_slots[i][1] == 'drainHP' then
											if cur_slots[i][2]:match("%%") then
												local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
												local hp_d = math.floor((primaryDamage * (tonumber(a..b)/100)))
												if hp_d > 0 then
													doTargetCombatHealth(aid, cid, COMBAT_LIFEDRAIN, -hp_d, -hp_d, CONST_ME_MAGIC_RED)
													attacker:addHealth(hp_d)
												end
											else
												local hp_d = math.random(1, math.floor(math.random(0, tonumber(cur_slots[i][2]))))
												if hp_d > 0 then
													doTargetCombatHealth(aid, cid, COMBAT_LIFEDRAIN, -hp_d, -hp_d, CONST_ME_MAGIC_RED)
													attacker:addHealth(hp_d)
												end
											end
										end
										
										if cur_slots[i][1] == 'drainMP' then
											if creature:getMana() > 0 then
												if cur_slots[i][2]:match("%%") then
													local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
													local mp_d = math.floor((primaryDamage * (tonumber(a..b)/100)))
													doTargetCombatMana(aid, cid, -mp_d, -mp_d)
													attacker:addMana(mp_d)
												else
													local mp_d = math.random(1, math.floor(math.random(0, tonumber(cur_slots[i][2]))))
													doTargetCombatMana(aid, cid, -mp_d, -mp_d)
													attacker:addMana(mp_d)
												end
											end
										end
									end
								end
							
								if (creature:isPlayer() or isInArray(human_looktypes, creature:getOutfit().lookType)) and cur_slots[i][1] == 'humans' then
									if cur_slots[i][2]:match("%%") then
										local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
										primaryDamage = primaryDamage + math.floor((primaryDamage * (tonumber(a..b)/100)))
									else
										primaryDamage = primaryDamage + math.random(1, math.floor(math.random(0, tonumber(cur_slots[i][2]))))
									end
								end
								
								if creature:isMonster() then
									local race = MonsterType(creature:getName()):getRace()
									local name = creature:getName():lower()
									if cur_slots[i][1] == 'insects' then
										if race == 1 then
											if cur_slots[i][2]:match("%%") then
												local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
												primaryDamage = primaryDamage + math.floor((primaryDamage * (tonumber(a..b)/100)))
											else
												primaryDamage = primaryDamage + math.random(1, math.floor(math.random(0, tonumber(cur_slots[i][2]))))
											end
										end
									elseif cur_slots[i][1] == 'animals' then
										if race == 2 and not isInArray(human_looktypes, creature:getOutfit().lookType) then
											if cur_slots[i][2]:match("%%") then
												local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
												primaryDamage = primaryDamage + math.floor((primaryDamage * (tonumber(a..b)/100)))
											else
												primaryDamage = primaryDamage + math.random(1, math.floor(math.random(0, tonumber(cur_slots[i][2]))))
											end
										end
									elseif cur_slots[i][1] == 'undeads' then
										if race == 3 then
											if cur_slots[i][2]:match("%%") then
												local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
												primaryDamage = primaryDamage + math.floor((primaryDamage * (tonumber(a..b)/100)))
											else
												primaryDamage = primaryDamage + math.random(1, math.floor(math.random(0, tonumber(cur_slots[i][2]))))
											end
										end
									elseif cur_slots[i][1] == 'elementals' then
										if race == 4 or race == 5 or name:match("elemental") then
											if cur_slots[i][2]:match("%%") then
												local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
												primaryDamage = primaryDamage + math.floor((primaryDamage * (tonumber(a..b)/100)))
											else
												primaryDamage = primaryDamage + math.random(1, math.floor(math.random(0, tonumber(cur_slots[i][2]))))
											end
										end
									elseif cur_slots[i][1] == 'dragons' then
										if name:match("dragon") then
											if cur_slots[i][2]:match("%%") then
												local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
												primaryDamage = primaryDamage + math.floor((primaryDamage * (tonumber(a..b)/100)))
											else
												primaryDamage = primaryDamage + math.random(1, math.floor(math.random(0, tonumber(cur_slots[i][2]))))
											end
										end
									elseif cur_slots[i][1] == 'lizards' then
										if name:match("lizard") or name:match("draken") then
											if cur_slots[i][2]:match("%%") then
												local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
												primaryDamage = primaryDamage + math.floor((primaryDamage * (tonumber(a..b)/100)))
											else
												primaryDamage = primaryDamage + math.random(1, math.floor(math.random(0, tonumber(cur_slots[i][2]))))
											end
										end
									end
								end
							end
						end
					end		
				end
			end
		end
	end

	-- armor elemental protection
	if creature:isPlayer() then
		for i = 1, #slots do
			local item = creature:getSlotItem(slots[i])
			if item then
				local it_id = ItemType(item:getId())
				
				if it_id:getWeaponType() == WEAPON_SHIELD or it_id:getWeaponType() == 0 then
				local slotc = item:getStatSlotCount()
					if slotc > 0 then
						local cur_slots = item:getStatSlots()
						for i = 1, slotc do
							if element_stats[cur_slots[i][1]] then
								if cur_slots[i][2]:match("%%") then
									local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
									if primaryType == element_stats[cur_slots[i][1]] then
										primaryDamage = math.floor(primaryDamage - (primaryDamage * (tonumber(a..b)/100)))
									end

									if secondaryType == element_stats[cur_slots[i][1]] then
										secondaryDamage = math.floor(secondaryDamage - (secondaryDamage * (tonumber(a..b)/100)))
									end
								else
									if primaryType == element_stats[cur_slots[i][1]] then
										primaryDamage = math.floor(primaryDamage - math.random(0, tonumber(cur_slots[i][2])))
									end

									if secondaryType == element_stats[cur_slots[i][1]] then
										secondaryDamage = math.floor(secondaryDamage - math.random(0, tonumber(cur_slots[i][2])))
									end
								end
							end
						end		
					end
				end
			end
		end
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

function stat_onManaChange(creature, attacker, manaChange, origin)
	if not creature:isPlayer() then
		return manaChange
	end
	for i = 1, #slots do
		local item = creature:getSlotItem(slots[i])
		if item then
			local it_id = ItemType(item:getId())
			
			if it_id:getWeaponType() == WEAPON_SHIELD or it_id:getWeaponType() == 0 then
			local slotc = item:getStatSlotCount()
				if slotc > 0 then
					local cur_slots = item:getStatSlots()
					for i = 1, slotc do
						if cur_slots[i][1] == 'manadrain' then
							if cur_slots[i][2]:match("%%") then
								local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
								manaChange = manaChange + (manaChange * (tonumber(a..b)/100))
							else
								manaChange = manaChange + math.random(0, tonumber(cur_slots[i][2]))
							end
						end
					end		
				end
			end
		end
	end
	return manaChange
end

function getItemWeaponType(uid)
	local item = Item(uid)
	return item and item:getType():getWeaponType() or 0
end

function isWeapon(uid) return (getItemWeaponType(uid) > 0 and getItemWeaponType(uid) ~= 4) end
function isShield(uid) return getItemWeaponType(uid) == 4 end
function isBow(uid) return (getItemWeaponType(uid) == 5 and (not ItemType(getThing(uid).itemid):isStackable())) end
	
function check_slot(aab, i)
	if i == 5 or i == 6 then
		if isWeapon(aab) or isShield(aab) or isBow(aab) then
			return true
		end
	else
		return true
	end
return false
end

local player_regen = {

}

function stat_regen(cid, itemid, slot, checkid, sid)

	if not checkid then checkid = 1 end
	if not player_regen[cid] then return true end
	if not player_regen[cid][slot] then return true end
	local player = Player(cid)
	if not player then return true end
	local item = player:getSlotItem(slot)
	if not item then
		player_regen[cid][slot] = nil
		return true
	end
	if item:getId() ~= itemid then return true end
	
	local slotc = item:getStatSlotCount()
	if slotc == 0 then
		player_regen[cid][slot] = nil
		return true
	end
	
	player_regen[cid][slot] = player_regen[cid][slot] + 1
	if checkid == 60 then
		local cur_slots = item:getStatSlots()
		for i = 1, slotc do
			if cur_slots[i][1] == 'regHP' or cur_slots[i][1] == 'regMP' then
				if cur_slots[i][2]:match("%%") then
					local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
					if cur_slots[i][1] == 'regHP' then
						player:addHealth(math.ceil(player:getVocation():getHealthGainAmount() * (tonumber(a..b))/100))
					end
					
					if cur_slots[i][1] == 'regMP' then
						player:addMana(math.ceil(player:getVocation():getManaGainAmount() * (tonumber(a..b))/100))
					end
				else
					if cur_slots[i][1] == 'regHP' then
						player:addHealth(tonumber(cur_slots[i][2]))
					end
					
					if cur_slots[i][1] == 'regMP' then
						player:addMana(tonumber(cur_slots[i][2]))
					end
				end
			end
		end
		checkid = 1
	end
	addEvent(stat_regen, 100, cid, itemid, slot, checkid + 1, sid + 1)
	return true
end

local eq_stat_conditions = {'hp', 'mp', 'ml', 'melee', 'shield', 'dist'}
function stat_load(cid)
local player = Player(cid)
local v_stat_percent = {}
local v_stat_normal = {}
	for j = 1, 9 do
		local item = player:getSlotItem(j)
		if item then
			local slotc = item:getStatSlotCount()
			if slotc > 0 then
				local cur_slots = item:getStatSlots()
				for i = 1, slotc do
					if isInArray(eq_stat_conditions, cur_slots[i][1]) then
						if cur_slots[i][2]:match("%%") then
							local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
							if not v_stat_percent[cur_slots[i][1]] then
								v_stat_percent[cur_slots[i][1]] = 0
							end
							v_stat_percent[cur_slots[i][1]] = v_stat_percent[cur_slots[i][1]] + (tonumber(a..b)/100)
						else
							if not v_stat_normal[cur_slots[i][1]] then
								v_stat_normal[cur_slots[i][1]] = 0
							end
							v_stat_normal[cur_slots[i][1]] = v_stat_normal[cur_slots[i][1]] + tonumber(cur_slots[i][2])
						end
					else
						if cur_slots[i][1] == 'regHP' or cur_slots[i][1] == 'regMP' then
							if not player_regen[cid] then player_regen[cid] = {} end
							if not player_regen[cid][j] then player_regen[cid][j] = 1 end
							local value = tonumber(cur_slots[i][2])
							if not value then
								local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
								value = tonumber(a..b)/100
							end
							player_regen[cid][j] = 1
							stat_regen(cid, item:getId(), j, 1, 1)
						end
					end
				end
			end
		end
	end
	
	local fu = 0 -- functions used
	local ca = {} -- conditions assigned
	for i = 1, #eq_stat_conditions do
		if eq_stat_conditions[i] == 'hp' then
			if v_stat_normal[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[1][eq_stat_conditions[i]][math.floor(math.max(math.min(1500, v_stat_normal[eq_stat_conditions[i]]), -1500))])
				ca[56] = 1
			end
			
			if v_stat_percent[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[2][eq_stat_conditions[i]][math.floor(math.max(math.min(300, v_stat_percent[eq_stat_conditions[i]] * 100), -95))])
				ca[50] = 1
			end
		elseif eq_stat_conditions[i] == 'mp' then
			if v_stat_normal[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[1][eq_stat_conditions[i]][math.floor(math.max(math.min(1500, v_stat_normal[eq_stat_conditions[i]]), -1500))])
				ca[57] = 1
			end
			
			if v_stat_percent[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[2][eq_stat_conditions[i]][math.floor(math.max(math.min(300, v_stat_percent[eq_stat_conditions[i]] * 100), -95))])
				ca[51] = 1
			end
		elseif eq_stat_conditions[i] == 'ml' then
			if v_stat_normal[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[1][eq_stat_conditions[i]][math.floor(math.max(math.min(100, v_stat_normal[eq_stat_conditions[i]]), -100))])
				ca[58] = 1
			end
			
			if v_stat_percent[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[2][eq_stat_conditions[i]][math.floor(math.max(math.min(300, v_stat_percent[eq_stat_conditions[i]] * 100), -95))])
				ca[52] = 1
			end
		elseif eq_stat_conditions[i] == 'melee' then
			if v_stat_normal[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[1][eq_stat_conditions[i]][math.floor(math.max(math.min(100, v_stat_normal[eq_stat_conditions[i]]), -100))])
				ca[59] = 1
			end
			
			if v_stat_percent[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid, stat_conditions[2][eq_stat_conditions[i]][math.floor(math.max(math.min(300, v_stat_percent[eq_stat_conditions[i]] * 100), -95))])
				ca[53] = 1
			end
		elseif eq_stat_conditions[i] == 'shield' then
			if v_stat_normal[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[1][eq_stat_conditions[i]][math.floor(math.max(math.min(100, v_stat_normal[eq_stat_conditions[i]]), -100))])
				ca[60] = 1
			end
			
			if v_stat_percent[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[2][eq_stat_conditions[i]][math.floor(math.max(math.min(300, v_stat_percent[eq_stat_conditions[i]] * 100), -95))])
				ca[54] = 1
			end
		elseif eq_stat_conditions[i] == 'dist' then
			if v_stat_normal[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[1][eq_stat_conditions[i]][math.floor(math.max(math.min(100, v_stat_normal[eq_stat_conditions[i]]), -100))])
				ca[61] = 1
			end
			
			if v_stat_percent[eq_stat_conditions[i]] then
				fu = fu+1
				doAddCondition(cid,stat_conditions[2][eq_stat_conditions[i]][math.floor(math.max(math.min(300, v_stat_percent[eq_stat_conditions[i]] * 100), -95))])
				ca[55] = 1
			end
		end
	end
	if fu > 0 then
		for i=50,61 do
			if not ca[i] then
				doRemoveCondition(cid,CONDITION_ATTRIBUTES,i)
			end
		end
	else
		for i=50,61 do
			doRemoveCondition(cid,CONDITION_ATTRIBUTES,i)
		end
	end
	
	return true
end

function loadSet(cid)
local player = Player(cid)
local t = {}
	if player then
		for slot=1,9 do
			t[slot] = ''
			local s = player:getSlotItem(slot)
			if s then
				t[slot] = s:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
			end
		end
	end
	return t
end

function chk(cid,f)
	if not isPlayer(cid) then return false end
	local t = loadSet(cid)
	for i=1,#f do
		if f[i] ~= t[i] then
			stat_load(cid)
			break
		end
	end
	addEvent(chk,2000,cid,t)
end

function stat_onLogin(player)
	if STATS_SYSTEM_CONFIG.combatStats then
		player:registerEvent("statHP")
		player:registerEvent("statMP")
	end
	
	if STATS_SYSTEM_CONFIG.PVEStat then
		player:registerEvent("statPVE")
	end
	
	if STATS_SYSTEM_CONFIG.monsterLoot or STATS_SYSTEM_CONFIG.xpStat or STATS_SYSTEM_CONFIG.lootStat then
		player:registerEvent("statLoot")
	end
	
	if STATS_SYSTEM_CONFIG.conditionStats then
		local cid = player:getId()
		stat_load(cid)
		addEvent(chk,2000,cid,loadSet(cid))
	end
return true
end

function stat_onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
	local necklace = creature:getSlotItem(CONST_SLOT_NECKLACE)
	
	if not Player(lastHitKiller) then
		if necklace then
			local slotc = necklace:getStatSlotCount()
			if slotc > 0 then
				local cur_slots = necklace:getStatSlots()
				for i = 1, slotc do
					if cur_slots[i][1] == 'PVE death' then
						if cur_slots[i][2]:match("%%") then
						local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
							if math.random(1, 100) > tonumber(a..b) then
								necklace:remove()
								return true
							end
						end
						local maxhp = creature:getMaxHealth()
						creature:addHealth(maxhp)
						addEvent(doCreatureAddHealth, 100, creature:getId(), maxhp)
						creature:teleportTo(creature:getTown():getTemplePosition())
						necklace:remove()
						return true
					end
				end
			end
		end
	end
return true
end

function stat_onTargetCombat(self, target)
	if Player(self) then
		if STATS_SYSTEM_CONFIG.combatStats then
			target:registerEvent("statHP")
			target:registerEvent("statDeath")
		end
	end
	return true
end
					
function assign_loot_Stat(c)
	local wp_string = {"", ""}
	local arm_string = {"", ""}
	local other_string = {"", ""}
	local rares = 0
	local h = c:getItemHoldingCount()
	if h > 0 then
		for i = 1, h do
			wp_string = {"", ""}
			arm_string = {"", ""}
			other_string = {"", ""}
			local it_u = c:getItem(i - 1)
			local u = it_u:getUpgradeType()
			local upgrade = true
			local it_id = ItemType(it_u:getId())
			local slotc = 0
			
			if not isInArray(STATS_SYSTEM_CONFIG.ignoredIds, it_u:getId()) then
				if it_u:isContainer() then
					local crares = assign_loot_Stat(it_u)
					rares = rares + crares
					upgrade = false
				else
					if it_id:isStackable() then
						upgrade = false
					end
					
					if u then
						local atr = it_u:getDescription():match('%((.+)%)')
						if atr and magic_words then
							if #magic_words > 0 then
								for j = 1, #magic_words do
									if atr:match(magic_words[j]) then
										if not STATS_SYSTEM_CONFIG.upgradeMagicItems then
											upgrade = false
										end
									end
								end
							end
						end
					end
				end

				if u and upgrade then
					for n = 1, #STATS_SYSTEM_CONFIG.slotChances do
						if math.random(1, 100000) <= STATS_SYSTEM_CONFIG.slotChances[n] then
							if slotc + 1 == n then
								local stat = math.random(1, #u)
								local level = math.random(1, STATS_SYSTEM_CONFIG.maxLevel)
								local spellname = u[stat][1]
								local spelltype = 0
								local available_spell_types = {}	
								local statdone = false
								for k = 1, #STATS_SYSTEM_CONFIG.STATS do
									if not statdone then
										if STATS_SYSTEM_CONFIG.STATS[k].name == spellname then
											if STATS_SYSTEM_CONFIG.STATS[k].enabledValues then
												table.insert(available_spell_types, SPELL_TYPE_VALUE)
											end
											
											if STATS_SYSTEM_CONFIG.STATS[k].enabledPercent then
												table.insert(available_spell_types, SPELL_TYPE_PERCENT)
											end
											
											if #available_spell_types > 0 then
												spelltype = available_spell_types[math.random(1, #available_spell_types)]
											end
											
											wp_string = (STATS_SYSTEM_CONFIG.STATS[k].weaponLootName or wp_string)
											arm_string = (STATS_SYSTEM_CONFIG.STATS[k].armorLootName or arm_string)
											other_string = (STATS_SYSTEM_CONFIG.STATS[k].otherLootName or other_string)
											
											statdone = true
										end
									end
								end
								
								if spelltype == 0 then
									upgrade = false
								end
								
								local spellattr = nil
								for l = 1, #STATS_SYSTEM_CONFIG.STATS do
									if not spellattr then
										if STATS_SYSTEM_CONFIG.STATS[l].name == spellname then
											spellattr = STATS_SYSTEM_CONFIG.STATS[l]
										end
									end
								end
								
								if not spellattr then
									upgrade = false
								end
								
								if upgrade then
									local prc = (level * 100/STATS_SYSTEM_CONFIG.maxLevel)/100
									local attrval = 0
									local attrstr = ""
									
									if spelltype == SPELL_TYPE_VALUE then
										attrval = math.floor(prc * u[stat][2])
									elseif spelltype == SPELL_TYPE_PERCENT then
										attrval = math.floor(prc * u[stat][3])
										attrstr = "%"
									end
									
									if attrval == 0 then
										upgrade = false
									end
									
									local slotcx = it_u:getStatSlotCount()
									if slotcx == STATS_SYSTEM_CONFIG.maxSlotCount and upgrade then
										upgrade = false
									end
									
									if upgrade then
										local cur_slots = it_u:getStatSlots()
										for m = 1, slotcx do
											if spellname == cur_slots[m][1] then
												upgrade = false
											end
										end
									end
									
									if upgrade then
										if it_u:addStat(spellname, attrval, attrstr) then
											it_u:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
											rares = rares + 1
											slotc = slotc + 1
										end
									end
								end
							end
						end
					end
					local uid = it_u:getUniqueId()
					if slotc > 1 then
						it_u:setAttribute(ITEM_ATTRIBUTE_NAME, (STATS_SYSTEM_CONFIG.tiers[slotc] .. " " or "") .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME))
					elseif slotc == 1 then
						local wp = it_id:getWeaponType()
						if wp > 0 then
							if wp == WEAPON_SHIELD then
								it_u:setAttribute(ITEM_ATTRIBUTE_NAME, (arm_string[1] ~= "" and arm_string[1] .. " " or "") .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME) .. (arm_string[2] ~= "" and " " .. arm_string[2] or ""))
							elseif isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE, WEAPON_DISTANCE, WEAPON_WAND}, wp) then -- weapon
								it_u:setAttribute(ITEM_ATTRIBUTE_NAME, ((wp_string[1] ~= "" and wp_string[1] .. " " or "") .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME) .. (wp_string[2] ~= "" and " " .. wp_string[2] or "")))
							end
						else
							if it_id:getArmor() > 0 then -- armor
								it_u:setAttribute(ITEM_ATTRIBUTE_NAME, ((arm_string[1] ~= "" and arm_string[1] .. " " or "") .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME) .. (arm_string[2] ~= "" and " " .. arm_string[2] or "")))
							else
								it_u:setAttribute(ITEM_ATTRIBUTE_NAME, ((other_string[1] ~= "" and other_string[1] .. " " or "") .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME) .. (other_string[2] ~= "" and " " .. other_string[2] or "")))
							end
						end
					end
				end
			end
			
			if STATS_SYSTEM_CONFIG.rare_loot_level then
				if not it_id:isStackable() then
					if it_id:getTransformEquipId() < 1 then
						if it_id:getCharges() < 1 then
							local item_sp_slot = it_id:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
							if item_sp_slot ~= SLOTP_NECKLACE and item_sp_slot ~= SLOTP_RING then
								local stat_min = 1
								if STATS_SYSTEM_CONFIG.rare_negative_level then
									stat_min = STATS_SYSTEM_CONFIG.rare_min_level
								end
								
								local stat_max = #STATS_SYSTEM_CONFIG.weapon_levels
								local it_lvl = math.random(stat_min, stat_max)
								
								if STATS_SYSTEM_CONFIG.weapon_levels[it_lvl] then
									if math.random(1, 100000) <= STATS_SYSTEM_CONFIG.weapon_levels[it_lvl][2] then
										for o = 1, #upgradable_stats do
											local n_item_stat = upgradable_stats[o][2](it_id)
											if n_item_stat ~= 0 then
												it_u:setAttribute(upgradable_stats[o][1], n_item_stat + (upgradable_stats[o][3] * it_lvl))
											end
										end
										
										local uid = it_u:getUniqueId()
										if slotc == 0 then
											it_u:setAttribute(ITEM_ATTRIBUTE_NAME, STATS_SYSTEM_CONFIG.weapon_levels[it_lvl][1] .. " " .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME))
										end
										it_u:setAttribute(ITEM_ATTRIBUTE_NAME, getItemAttribute(uid, ITEM_ATTRIBUTE_NAME) .. " " .. (it_lvl > 0 and "+" or "") .. it_lvl)
										
										if it_lvl > 0 then
											rares = rares + 1
										end
									end
								end
							end
						end
					end
				end
			end		
		end
	end
	return rares
end

function improveChance(c, monsterName, extraPercent, killer)
	local m = MonsterType(monsterName):getLoot()
	if math.random(1, 100) <= extraPercent then
		local t = {}
		for i = 1, #m do
			t[i] = {itemId = m[i].itemId, chance = m[i].chance}
		end
		
		local min = 1
		local t_s = {}
		local low5 = #t-5
		while #t > low5 do
			min = 1
			for i = 1, #t do
				if math.min(t[i].chance, t[min].chance) == t[i].chance then
					min = i
				end
			end
			t_s[#t_s + 1] = {itemId = t[min].itemId, chance = t[min].chance}
			table.remove(t, min)
		end
		
		local chosenId = math.random(1, #t_s)
		
		local h = c:getItemHoldingCount()
		if h > 0 then
			local extra = true
			for i = 1, h do
				if ItemType(c:getItem(i - 1):getId()) == t_s[chosenId].itemId then
					extra = false
					break
				end
			end
			
			if extra then
				if math.random(1, 100000) <= (t_s[chosenId].chance + (t_s[chosenId].chance * extraPercent / 100)) * configManager.getNumber(configKeys.RATE_LOOT) then
					c:addItem(m[chosenId].itemId, 1)
					if killer then
						local iid = ItemType(m[chosenId].itemId)
						Player(killer):sendTextMessage(MESSAGE_EVENT_ADVANCE, "Extra loot: " .. (iid:getArticle() ~= "" and iid:getArticle() .. " " or "") .. iid:getName())
					end
				end
			end
		end
	end					
	return true
end

function improveStackables(c, v)
	local h = c:getItemHoldingCount()
	if h > 0 then
		for i = 1, h do
			local it_u = c:getItem(i - 1)
			local it_id = ItemType(it_u)
			if it_id:isStackable() then
				local amount = math.random(0, v)
				if amount > 0 then
					c:addItem(it_u:getId(), amount)
				end
			elseif it_u:isContainer() then
				improveStackables(it_u, v)
			end
		end
	end
return true
end

function find_loot_Container(pos, extraPercent, monsterName, extraStackable, killer)
	local rares = 0
	local c = Tile(pos):getTopDownItem()
	if c ~= nil then
		if c:isContainer() then
			if STATS_SYSTEM_CONFIG.monsterLoot then
				rares = rares + assign_loot_Stat(c)
			end
			
			if rares > 0 then
				if STATS_SYSTEM_CONFIG.rare_popup then
					local spectators = Game.getSpectators(pos, false, true, 7, 7, 5, 5)
					for i = 1, #spectators do
						spectators[i]:say(STATS_SYSTEM_CONFIG.rare_text, TALKTYPE_MONSTER_SAY, false, spectators[i], pos)
					end
				end

				if STATS_SYSTEM_CONFIG.rare_effect then
					pos:sendMagicEffect(STATS_SYSTEM_CONFIG.rare_effect_id)
				end
			end
			
			if extraPercent then
				if extraPercent > 0 then
					if monsterName then
						improveChance(c, monsterName, extraPercent, killer)
					end
				end
			end
			
			if extraStackable then
				if extraStackable > 0 then
					improveStackables(c, extraStackable)
				end
			end
		end
	end
end

function Creature:isSummon()
	return self:getMaster()
end

function stat_onKill(player, target, lastHit)
	local extraPercent = 0
	local extraStackable = 0

	if target:isMonster() then
		local ring = player:getSlotItem(CONST_SLOT_RING)
		local monster = MonsterType(target:getName())
		if ring then
			local slotc = ring:getStatSlotCount()
			local cur_slots = ring:getStatSlots()
			if slotc > 0 then
				for i = 1, slotc do
					if cur_slots[i][1] == 'exp' and STATS_SYSTEM_CONFIG.xpStat then
						local nexp = monster:getExperience()
						local k = Game.getExperienceStage(player:getLevel())
						local st = player:getStamina()
						if st > 2400 then
							nexp = nexp * k*1.5
						elseif st < 1 then
							nexp =  0
						elseif st < 841 then
							nexp = math.floor(nexp/2)
						else
							nexp = nexp
						end
						
						if cur_slots[i][2]:match("%%") then
							local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
							player:addExperience(math.ceil((nexp * tonumber(a..b)) / 100), true)
						else
							player:addExperience(math.random(1, tonumber(cur_slots[i][2])), true)
						end
					elseif cur_slots[i][1] == 'loot' and STATS_SYSTEM_CONFIG.lootStat then
						if cur_slots[i][2]:match("%%") then
							local a, b = cur_slots[i][2]:match('([+-])(%d+)%%')
							extraPercent = extraPercent + tonumber(a..b)
						else
							extraStackable = extraStackable + tonumber(cur_slots[i][2])
						end
					end
				end
			end
		end
	end

	if not STATS_SYSTEM_CONFIG.lootUpgradedItems then
		return true
	end
	
	if target:isPlayer() or target:isSummon() then
		return true
	end
	
	addEvent(find_loot_Container, 2, target:getPosition(), extraPercent, target:getName(), extraStackable, player:getId())
	return true
end

function Item:removeSlot(slotid)
	if not tonumber(slotid) then slotid = 0 end
	local slots = self:getStatSlotCount()
	if slotid == 0 then
		slotid = slots
	end
	local first_desc = self:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	local slot_t = self:getStatSlots()
	self:removeAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	for i = 1, slots do
		if i == slotid then
			local spellname = slot_t[i][1]
			if isInArray({'charges', 'time', 'atk', 'def', 'extra def', 'arm', 'accuracy', 'range'}, spellname) then
				local basestats = self:getBaseStatsInfo()
				local basestats2 = {
					['charges'] = basestats.charges,
					['time'] = basestats.duration,
					['atk'] = basestats.attack,
					['def'] = basestats.defense,
					['extra def'] = basestats.extraDefense,
					['arm'] = basestats.armor,
					['accuracy'] = basestats.hitChance,
					['range'] = basestats.shootRange
				}
				
				local uid = self:getUniqueId()
				local fullstats = {
					['charges'] = getItemAttribute(uid, ITEM_ATTRIBUTE_CHARGES),
					['time'] = self:getBaseDuration(),
					['atk'] = getItemAttribute(uid, ITEM_ATTRIBUTE_ATTACK),
					['def'] = getItemAttribute(uid, ITEM_ATTRIBUTE_DEFENSE),
					['extra def'] = getItemAttribute(uid, ITEM_ATTRIBUTE_EXTRADEFENSE),
					['arm'] = getItemAttribute(uid, ITEM_ATTRIBUTE_ARMOR),
					['accuracy'] = getItemAttribute(uid, ITEM_ATTRIBUTE_HITCHANCE),
					['range'] = getItemAttribute(uid, ITEM_ATTRIBUTE_SHOOTRANGE)
				}
				
				if slot_t[i][2]:match("%%") then
					local a, b = slot_t[i][2]:match('([+-])(%d+)%%')
					self:setAttribute(attrkeys[spellname], fullstats[spellname] - math.abs(math.floor((basestats2[spellname] * tonumber(a..b)/100))))
				else
					self:setAttribute(attrkeys[spellname], fullstats[spellname] - tonumber(slot_t[i][2]))
				end
			end
		else
			if slot_t[i][2]:match("%%") then
				local a, b = slot_t[i][2]:match('([+-])(%d+)%%')
				self:addSlot(slot_t[i][1], tonumber(a..b), true)
			else
				self:addSlot(slot_t[i][1], tonumber(slot_t[i][2]), false)
			end
		end
	end	
	return true
end

function Item:clearUpgrades()
	local slots = self:getStatSlotCount()
	if slots > 0 then
		for i = 1, slots do
			self:removeSlot(i)
		end
	end
	
	self:removeAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	self:removeAttribute(ITEM_ATTRIBUTE_NAME)
	self:removeAttribute(ITEM_ATTRIBUTE_ARTICLE)
	self:removeAttribute(ITEM_ATTRIBUTE_PLURALNAME)
	self:removeAttribute(ITEM_ATTRIBUTE_ATTACK)
	self:removeAttribute(ITEM_ATTRIBUTE_DEFENSE)
	self:removeAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE)
	self:removeAttribute(ITEM_ATTRIBUTE_ARMOR)
	self:removeAttribute(ITEM_ATTRIBUTE_HITCHANCE)
	self:removeAttribute(ITEM_ATTRIBUTE_SHOOTRANGE)
	self:removeAttribute(ITEM_ATTRIBUTE_DURATION)
	self:removeAttribute(ITEM_ATTRIBUTE_CHARGES)
return true
end

function Item:addLevel(change)
	if not self then return false end
	if not change then return false end
	
	local it_id = self:getType()
	
	if not it_id then return false end
	if it_id:isStackable()then return false end

	if it_id:getTransformEquipId() < 1 then
		if it_id:getCharges() < 1 then
			local item_sp_slot = it_id:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
			if item_sp_slot ~= SLOTP_NECKLACE and item_sp_slot ~= SLOTP_RING then
				local exu = self:getUniqueId()
				local stat_lvl = self:getLevel()
				if not stat_lvl then stat_lvl = 0 end
				
				local it_name = self:getName()
				if stat_lvl > 0 then
					it_name = getItemAttribute(exu, ITEM_ATTRIBUTE_NAME):split("+")[1]
				elseif stat_lvl < 0 then
					it_name = getItemAttribute(exu, ITEM_ATTRIBUTE_NAME):split("-")[1]
				end

				it_name = it_name:gsub("^%s*(.-)%s*$", "%1")
				for i = 1, #upgradable_stats do
					local n_item_stat = upgradable_stats[i][2](it_id)
					self:setAttribute(upgradable_stats[i][1], getItemAttribute(exu, upgradable_stats[i][1], true) + (upgradable_stats[i][3] * change))
				end
				
				self:setActionId(101)
				self:setAttribute(ITEM_ATTRIBUTE_NAME, it_name .. (change + stat_lvl ~= 0 and (" " .. (change + stat_lvl > 0 and "+" or "") .. change + stat_lvl) or ""))
				return true
			end
		end
	end
return false
end

function Item:getLevel()
	if not self then return nil end
	local uid = self:getUniqueId()
	return tonumber(getItemAttribute(uid, ITEM_ATTRIBUTE_NAME):match("%s%+%d+") or getItemAttribute(uid, ITEM_ATTRIBUTE_NAME):match("%s%-%d+")) or 0
end

function Item:setLevel(level)
	self:addLevel(level - self:getLevel())
	return true
end

STATSLOT_TYPE_NORMAL = 1
STATSLOT_TYPE_PERCENT = 2

function Item:generateTier(slots)
--[[
	example slots: {
		{'fire', '5', STATSLOT_TYPE_PERCENT},
		{'ice', '20', STATSLOT_TYPE_NORMAL}
	}
]]
	if not self then return false end
	if not slots then return false end
	local fslotc = 0

	self:clearUpgrades()
	local slotc = #slots
	if slotc > 0 then
		local upgrade = true
		for i = 1, slotc do
			local spellname = slots[i][1]
			local spelltype = 0
			local available_spell_types = {}
			upgrade = true
			
			for k = 1, #STATS_SYSTEM_CONFIG.STATS do
				if STATS_SYSTEM_CONFIG.STATS[k].name == spellname then
					if STATS_SYSTEM_CONFIG.STATS[k].enabledValues and slots[i][3] == STATSLOT_TYPE_NORMAL then
						spelltype = SPELL_TYPE_VALUE
					elseif STATS_SYSTEM_CONFIG.STATS[k].enabledPercent and slots[i][3] == STATSLOT_TYPE_PERCENT then
						spelltype = SPELL_TYPE_PERCENT
					end
					wp_string = (STATS_SYSTEM_CONFIG.STATS[k].weaponLootName or "")
					arm_string = (STATS_SYSTEM_CONFIG.STATS[k].armorLootName or "")
					other_string = (STATS_SYSTEM_CONFIG.STATS[k].otherLootName or "")
				end
			end
			
			if spelltype == 0 then
				upgrade = false
			end
			
			local spellattr = nil
			for l = 1, #STATS_SYSTEM_CONFIG.STATS do
				if not spellattr then
					if STATS_SYSTEM_CONFIG.STATS[l].name == spellname then
						spellattr = STATS_SYSTEM_CONFIG.STATS[l]
					end
				end
			end
			
			if not spellattr then
				upgrade = false
			end
			
			if upgrade then
				local attrval = 0
				local attrstr = ""
				
				attrval = math.floor(slots[i][2])
				if spelltype == SPELL_TYPE_PERCENT then
					attrstr = "%"
				end

				if attrval == 0 then
					upgrade = false
				end

				local slotcx = self:getStatSlotCount()
				if slotcx == STATS_SYSTEM_CONFIG.maxSlotCount and upgrade then
					upgrade = false
				end

				if upgrade then
					local cur_slots = self:getStatSlots()
					for m = 1, slotcx do
						if spellname == cur_slots[m][1] then
							upgrade = false
						end
					end
				end

				if upgrade then
					if self:addStat(spellname, attrval, attrstr) then
						fslotc = fslotc + 1
					end
				end
			end
		end
	end

	if fslotc == 0 then
		return false
	end
	
	local uid = self:getUniqueId()
	if fslotc > 1 then
		self:setAttribute(ITEM_ATTRIBUTE_NAME, (STATS_SYSTEM_CONFIG.tiers[fslotc] .. " " or "") .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME))
	elseif fslotc == 1 then
		local it_id = self:getType()
		local wp = it_id:getWeaponType()
		if wp > 0 then
			if wp == WEAPON_SHIELD then
				self:setAttribute(ITEM_ATTRIBUTE_NAME, (arm_string[1] ~= "" and arm_string[1] .. " " or "") .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME) .. (arm_string[2] ~= "" and " " .. arm_string[2] or ""))
			elseif isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE, WEAPON_DISTANCE, WEAPON_WAND}, wp) then -- weapon
				self:setAttribute(ITEM_ATTRIBUTE_NAME, ((wp_string[1] ~= "" and wp_string[1] .. " " or "") .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME) .. (wp_string[2] ~= "" and " " .. wp_string[2] or "")))
			end
		else
			if it_id:getArmor() > 0 then -- armor
				self:setAttribute(ITEM_ATTRIBUTE_NAME, ((arm_string[1] ~= "" and arm_string[1] .. " " or "") .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME) .. (arm_string[2] ~= "" and " " .. arm_string[2] or "")))
			else
				self:setAttribute(ITEM_ATTRIBUTE_NAME, ((other_string[1] ~= "" and other_string[1] .. " " or "") .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME) .. (other_string[2] ~= "" and " " .. other_string[2] or "")))
			end
		end
	end
	
	return true
end

function Item:generateLooted(it_lvl, slots)
	if not self then return false end
	if not tonumber(it_lvl) then it_lvl = 0 end

	local it_id = self:getType()	
	if it_id:isStackable() then return false end
	
	self:clearUpgrades()
	local ntier = false
	if slots then
		ntier = self:generateTier(slots)
	end
	
	if it_id:getTransformEquipId() < 1 then
		if it_id:getCharges() < 1 then
			local item_sp_slot = it_id:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
			if item_sp_slot ~= SLOTP_NECKLACE and item_sp_slot ~= SLOTP_RING then	
				if STATS_SYSTEM_CONFIG.weapon_levels[it_lvl] then
					local uid = self:getUniqueId()
					for o = 1, #upgradable_stats do
						local n_item_stat = upgradable_stats[o][2](it_id)
						if n_item_stat ~= 0 then
							self:setAttribute(upgradable_stats[o][1], getItemAttribute(uid, upgradable_stats[o][1], true) + (upgradable_stats[o][3] * it_lvl))
						end
					end
					
					if not ntier then
						self:setAttribute(ITEM_ATTRIBUTE_NAME, STATS_SYSTEM_CONFIG.weapon_levels[it_lvl][1] .. " " .. getItemAttribute(uid, ITEM_ATTRIBUTE_NAME))
					end
					self:setAttribute(ITEM_ATTRIBUTE_NAME, getItemAttribute(uid, ITEM_ATTRIBUTE_NAME) .. " " .. (it_lvl > 0 and "+" or "") .. it_lvl)
				end
			end
		end
	end	
	return true
end

function Item:generateStats(slots, slotc, wp_lvl, min_sl, max_sl)
	local t_s = {}
	local level = 0

	if slots and slotc then
	local t = {}
		for i = 1, #slots do
			t[i] = slots[i]
		end
		
		if slotc > 0 then			
			local low5 = #t-5
			while #t_s < slotc do
				local sel = math.random(1, #t)
				t_s[#t_s + 1] = t[sel]
				table.remove(t, sel)
			end
		end
		
		for i = 1, #t_s do
			if min_sl then
				if max_sl then
					level = math.random(min_sl, max_sl)
				else
					level = min_sl
				end
			end
			local tmp = 1
			if math.random(1, 2) == 2 then tmp = 2 end
			t_s[i] = {t_s[i][1], t_s[i][tmp + 1] * (level /STATS_SYSTEM_CONFIG.maxLevel), tmp}
		end
	end
	
	self:generateLooted(wp_lvl, t_s)
	return true
end

function stat_onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
--[[

-- generateStats example of looting specific item
	if creature:isMonster() then
		if corpse and corpse:isContainer() then
			local item = corpse:addItem("sword")
			item:generateStats(item:getUpgradeType(), math.random(0, STATS_SYSTEM_CONFIG.maxSlotCount), math.random(0, 4), 1, STATS_SYSTEM_CONFIG.maxLevel)
			local item2 = corpse:addItem("plate shield")
			item2:generateStats({
				{'lifedrain', 10, 15},
				{'manadrain', 10, 15},
				{'ice', 10, 15},
				{'holy', 10, 15},
				{'death', 10, 15},
			}, 3, 6, 24)
		end
	end
	
]]
return true
end

function Item:getStatReqLevel()
	if STATS_SYSTEM_CONFIG.reqLvlBasedOnUpgrade then
		return STATS_SYSTEM_CONFIG.reqLvlFormula(self)
	else
		return self:getType():getRequiredLevel()
	end
end

function stat_onLook(thing, description)
	if not STATS_SYSTEM_CONFIG.reqLvlBasedOnUpgrade then
		return description
	end
	
	local v, d = description:match('%It can only be wielded properly by (.-)% of level (.-)% or higher')
	if v then
		local lv = d:match('%d+')
		local nlv = thing:getStatReqLevel()
		return description:gsub(description:match(v .. " of level " .. d), v .. " of level " .. nlv)
	end
	return description
end

--[[ workaround for older tfs
function ItemType:getRequiredLevel()
	local i = Item(doCreateItemEx(self:getId()))
	local d, v = i:getDescription():match('%It can only be wielded properly by (.-)% of level (.-)% or higher')
	return v:match('%d+') or 0
end
-- ]]

--[[ list of functions:
	doItemSetAttribute(uid, key, value) -- 0.4 version of item:setAttribute(key, value)
	doItemEraseAttribute(uid, key) -- 0.4 version of item:removeAttribute(key)
	getItemAttribute(uid, key, force) -- known function from 0.4, force parameter works for items upgraded before
	
	isWeapon(uid) -- is item a weapon
	isShield(uid) -- is item a shield
	isBow(uid) -- is item a bow
	
	STATS_SYSTEM_CONFIG.skillFormula(level) -- shows exp for enchanting level
	STATS_SYSTEM_CONFIG.levelUpgradeFormula(level, maxlevel) -- chance to upgrade item level on certain level
	
	assign_loot_Stat(container) -- applies random stats on items inside this container
	find_loot_Container(pos, extraPercent, monsterName, extraStackable, killer) -- applies random stats event functions on monster corpse
	getEnchantingSkill(tries) -- returns enchanting skill based on amount of tries
	improveChance(container, monsterName, extraPercent, killer) -- increases a chance to loot rare item from monster
	improveStackables(container, value) -- stackables in container will be increased by random amount between 0 and value
	
	creature:isSummon() -- is creature a summon
	
	item:getBaseDuration() -- returns current duration or duration of brand-new item
	item:getBaseStatsInfo() -- reads non-modified item stats
	item:getStatSlotCount() -- returns amount of slots assigned to an item
	item:getStatSlots() -- returns slots from item this way:
	{
		[1] = {'fire', '+25%'},
		[2] = {'atk', '-2'},
	}
	item:getUpgradeType() -- returns spells available for item(STATS_SYSTEM_CONFIG.UPGRADE_SPELLS.type)
	item:getStatReqLevel() -- works as itemType:getRequiredLevel(), but for itemid and considers changes made by stat system
	
	item:addLevel(levelchange) -- adds levels to item, works with negative values also
	item:getLevel() -- get item level(+x or -x)
	item:setLevel(level) -- set item level
	item:addSlot(name, value, percent) -- adds slot and applying item attributes where name = spellname, value = spell value, percent = if true it will add % to number value
	item:removeSlot(slotid) -- removes certain slot from item
	item:clearUpgrades() -- removes all upgrades from item
	item:generateTier(slots) -- generates item like it was looted from a monster, example slots:
	{
		{'fire', '5', STATSLOT_TYPE_PERCENT},
		{'ice', '20', STATSLOT_TYPE_NORMAL}
	}
	item:generateLooted(it_lvl, slots) -- calls function above, plus allows you to set a level on item
	item:generateStats(slots, slotc, wp_lvl, min_sl, max_sl) -- more random version of function above, go to stat_onDeath for example of use
		
-- functions used by the lib(not intended to be used by other scripts)
item:addStat(item, spellname, spellvalue, suffix, cid) -- upgrades attributes, doesn't add stat
item:addStatSlot(spell, value, suffix) -- adds slot one to description, doesn't upgrade attributes
check_slot(weapon, slot) -- returns value for skill conditions system
loadSet(cid) -- used by skill conditions system
chk(cid,slots) -- used by skill conditions system
stat_regen(cid, itemid, slot, checkid, sid) -- does regeneration, auto-used
stat_load(cid) -- executed to load player's stats and run other functions

SPELL_TYPE_VALUE
SPELL_TYPE_PERCENT

-- default events (advanced scripters may find calling it in unusual cases useful)
stat_onUse(player, item, fromPosition, itemEx, toPosition, attempt)
stat_onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
stat_onManaChange(creature, attacker, manaChange, origin)
stat_onLogin(player)
stat_onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
stat_onTargetCombat(self, target)
stat_onKill(player, target, lastHit)
stat_onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
stat_onLook(thing, description)
]]