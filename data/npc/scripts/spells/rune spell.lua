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
	[2285]={ buy =300, spell = "Poison Field", name = "Poison Field", vocations = {1,2,5,6}, level = 14, premium = 0, QuestPoints = 0},
	[2287]={ buy =500, spell = "Light Magic Missile", name = "Light Magic Missile", vocations = {1,2,5,6}, level = 15, premium = 0, QuestPoints = 0},
	[2265]={ buy =600, spell = "Intense Healing Rune", name = "Intense Healing Rune", vocations = {1,2,3,4,5,6,7,8}, level = 15, premium = 0, QuestPoints = 0},
	[2266]={ buy =600, spell = "Cure Poison Rune", name = "Cure Poison Rune", vocations = {2,6}, level = 15, premium = 0, QuestPoints = 0},
	[2301]={ buy =500, spell = "Fire Field", name = "Fire Field", vocations = {1,2,5,6}, level = 15, premium = 0, QuestPoints = 0},
	[2290]={ buy =800, spell = "Convince Creature", name = "Convince Creature", vocations = {2,6}, level = 16, premium = 0, QuestPoints = 0},
	[2261]={ buy =700, spell = "Destroy Field", name = "Destroy Field", vocations = {1,2,3,5,6,7}, level = 17, premium = 0, QuestPoints = 0},
	[2277]={ buy =700, spell = "Energy Field", name = "Energy Field", vocations = {1,2,5,6}, level = 18, premium = 0, QuestPoints = 0},
	[2260]={ buy =100, spell = "Blank Rune", name = "Blank Rune", vocations = {1,2,3,4,5,6,7,8}, level = 8, premium = 0, QuestPoints = 25},
	[2310]={ buy =900, spell = "Disintegrate", name = "Disintegrate", vocations = {1,2,3,5,6,7}, level = 21, premium = 0, QuestPoints = 0},
	[2292]={ buy =1400, spell = "Stalagmite", name = "Stalagmite", vocations = {1,2,5,6}, level = 24, premium = 0, QuestPoints = 0},
	[2273]={ buy =1500, spell = "Ultimate Healing Rune", name = "Ultimate Healing Rune", vocations = {2,6}, level = 24, premium = 0, QuestPoints = 0},
	[2311]={ buy =1500, spell = "Heavy Magic Missile", name = "Heavy Magic Missile", vocations = {1,2,5,6}, level = 25, premium = 0, QuestPoints = 0},
	[2286]={ buy =1000, spell = "Poison Bomb", name = "Poison Bomb", vocations = {2,6}, level = 25, premium = 0, QuestPoints = 0},
	[2295]={ buy =1600, spell = "Holy Missile", name = "Holy Missile", vocations = {3,7}, level = 27, premium = 0, QuestPoints = 0},
	[2308]={ buy =1800, spell = "Soulfire", name = "Soulfire", vocations = {1,2,5,6}, level = 27, premium = 0, QuestPoints = 0},
	[2302]={ buy =1600, spell = "Fireball", name = "Fireball", vocations = {1,5}, level = 27, premium = 0, QuestPoints = 0},
	[2305]={ buy =1000, spell = "Fire bomb", name = "Fire bomb", vocations = {1,2,5,6}, level = 27, premium = 0, QuestPoints = 0},
	[2316]={ buy =1200, spell = "Animate Dead", name = "Animate Dead", vocations = {1,2,5,6}, level = 27, premium = 0, QuestPoints = 0},
	[2291]={ buy =1300, spell = "Chameleon", name = "Chameleon", vocations = {2,6}, level = 27, premium = 0, QuestPoints = 0},
	[2269]={ buy =2000, spell = "Wild Growth", name = "Wild Growth", vocations = {2,6}, level = 27, premium = 0, QuestPoints = 0},
	[2288]={ buy =1100, spell = "Stone Shower", name = "Stone Shower", vocations = {2,6}, level = 28, premium = 0, QuestPoints = 0},
	[2315]={ buy =1100, spell = "Thunderstorm", name = "Thunderstorm", vocations = {1,5}, level = 28, premium = 0, QuestPoints = 0},
	[2271]={ buy =1700, spell = "Icicle", name = "Icicle", vocations = {2,6}, level = 28, premium = 0, QuestPoints = 0},
	[2289]={ buy =1600, spell = "Poison Wall", name = "Poison Wall", vocations = {1,2,5,6}, level = 29, premium = 0, QuestPoints = 0},
	[2304]={ buy =1200, spell = "Great Fireball", name = "Great Fireball", vocations = {1,5}, level = 30, premium = 0, QuestPoints = 0},
	[2274]={ buy =1200, spell = "Avalanche", name = "Avalanche", vocations = {2,6}, level = 30, premium = 0, QuestPoints = 0},
	[2313]={ buy =1800, spell = "Explosion", name = "Explosion", vocations = {1,2,5,6}, level = 31, premium = 0, QuestPoints = 0},
	[2293]={ buy =2100, spell = "Magic Wall", name = "Magic Wall", vocations = {1,5}, level = 32, premium = 0, QuestPoints = 0},
	[2303]={ buy =2000, spell = "Fire Wall", name = "Fire Wall", vocations = {1,2,5,6}, level = 33, premium = 0, QuestPoints = 0},
	[2262]={ buy =1000, spell = "Energy bomb", name = "Energy bomb", vocations = {1,5}, level = 37, premium = 0, QuestPoints = 0},
	[2279]={ buy =2500, spell = "Energy Wall", name = "Energy Wall", vocations = {1,2,5,6}, level = 41, premium = 0, QuestPoints = 0},
	[2268]={ buy =3000, spell = "Sudden Death", name = "Sudden Death", vocations = {1,5}, level = 45, premium = 0, QuestPoints = 0},
	[2278]={ buy =1900, spell = "Paralyse", name = "Paralyse", vocations = {2,6}, level = 54, premium = 0, QuestPoints = 0}
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
	
	local QPoints = 0	
	local points = db.storeQuery("SELECT `QuestPoints` FROM `players` WHERE `id` = " .. getPlayerGUID(player))	
    if points then
        QPoints = result.getDataInt(points, "QuestPoints")
    end
	
        npcHandler:say("Here are the spells that you can learn from me.", cid)
        for var, item in pairs(spells) do
            if not AllSpells then
                if not player:hasLearnedSpell(item.spell) then
                    if (player:getLevel() >= item.level and QPoints >= item.QuestPoints)then
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
