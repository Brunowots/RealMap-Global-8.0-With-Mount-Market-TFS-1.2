local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Hello there, adventurer! Need a deal in spells? I\'m your man!'} }
npcHandler:addModule(VoiceModule:new(voices))

local PremiumSpells = false
local AllSpells = false
-- 1,5 Sorcerer
-- 2,6 Druid
-- 3,7 Paladin
-- 4,8 Knight

local spells = {
	[12469]={ buy =1, spell = "Arrow Call", name = "Arrow Call", vocations = {3,7}, level = 1, premium = 0},
	[2544]={ buy =450, spell = "Conjure Arrow", name = "Conjure Arrow", vocations = {3,7}, level = 13, premium = 0},
	[2545]={ buy =700, spell = "Conjure Poisoned Arrow", name = "Conjure Poisoned Arrow", vocations = {3,7}, level = 16, premium = 0},
	[2543]={ buy =750, spell = "Conjure Bolt", name = "Conjure Bolt", vocations = {3,7}, level = 17, premium = 0},
	[7364]={ buy =800, spell = "Conjure Sniper Arrow", name = "Conjure Sniper Arrow", vocations = {3,7}, level = 24, premium = 0},
	[2546]={ buy =1000, spell = "Conjure Explosive Arrow", name = "Conjure Explosive Arrow", vocations = {3,7}, level = 25, premium = 0},
	[7363]={ buy =850, spell = "Conjure Piercing Bolt", name = "Conjure Piercing Bolt", vocations = {3,7}, level = 33, premium = 0},
	[7367]={ buy =2000, spell = "Enchant Spear", name = "Enchant Spear", vocations = {3,7}, level = 45, premium = 0},
	[2547]={ buy =2000, spell = "Conjure Power Bolt", name = "Conjure Power Bolt", vocations = {7}, level = 59, premium = 0},	
	[2295]={ buy =1800, spell = "Divine Missile", name = "Divine Missile", vocations = {3,7}, level = 40, premium = 0},
	[2298]={ buy =3000, spell = "Divine Caldera", name = "Divine Caldera", vocations = {3,7}, level = 50, premium = 0},	
	[2389]={ buy =1100, spell = "Ethereal Spear", name = "Ethereal Spear", vocations = {3,7}, level = 23, premium = 0}	
}


local mensaje
function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local shopWindow = {}
    local player = Player(cid)

    local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)		
		
        local player = Player(cid)		
        if player:hasLearnedSpell(spells[item].spell) then
			return false
        end       
        if player:getLevel() < spells[item].level then		
            return false
        end
        if not isInArray(spells[item].vocations, player:getVocation():getId()) then			
            return false
        end
        if PremiumSpells and (spells[item].premium == 1) and not player:isPremium() then
            return false
        end   
		
        if player:removeMoneyNpc(spells[item].buy) == false then
            return false
        end
		
        player:learnSpell(spells[item].spell)
        player:getPosition():sendMagicEffect(12)
        return true
    end

    if msgcontains(msg, "spells") then
        npcHandler:say("Here are the spells that you can learn from me.", cid)
        for var, item in pairs(spells) do
            if not AllSpells then
                if not player:hasLearnedSpell(item.spell) then
                    if player:getLevel() >= item.level then
                        if isInArray(item.vocations, player:getVocation():getId()) then
                            if PremiumSpells then
                                if (item.premium == 1) and player:isPremium() then
                                    table.insert(shopWindow, {id = var, subType = 0, buy = item.buy, sell = 0, name = item.name})
                                end
                            else
                                table.insert(shopWindow, {id = var, subType = 0, buy = item.buy, sell = 0, name = item.name})
                            end
                        end
                    end
                end
            else
                table.insert(shopWindow, {id = var, subType = 0, buy = item.buy, sell = 0, name = item.name})
            end
        end
        openShopWindow(cid, shopWindow, onBuy, onSell)
    end
    return true
end



npcHandler:setMessage(MESSAGE_GREET, "Welcome to my shop, adventurer |PLAYERNAME|! I sell {Spells}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
