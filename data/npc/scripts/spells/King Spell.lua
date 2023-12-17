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
	[10107]={ buy =4000, spell = "Train Party", name = "Train Party", vocations = {4,8}, level = 32, premium = 0, QuestPoints = 0},
	[2517]={ buy =4000, spell = "Protect Party", name = "Protect Party", vocations = {3,7}, level = 32, premium = 0, QuestPoints = 0},
	[7488]={ buy =4000, spell = "Heal Party", name = "Heal Party", vocations = {2,6}, level = 32, premium = 0, QuestPoints = 0},
	[11754]={ buy =4000, spell = "Enchant Party", name = "Enchant Party", vocations = {1,5}, level = 32, premium = 0, QuestPoints = 0},
	
	[8619]={ buy =50000, spell = "Summon Creature EK", name = "Summon Creature EK", vocations = {4,8}, level = 200, premium = 0, QuestPoints = 0},	
	[8617]={ buy =50000, spell = "Summon Creature RP", name = "Summon Creature RP", vocations = {3,7}, level = 200, premium = 0, QuestPoints = 0},
	[8620]={ buy =50000, spell = "Summon Creature MS", name = "Summon Creature MS", vocations = {1,5}, level = 200, premium = 0, QuestPoints = 0},
	[8621]={ buy =50000, spell = "Summon Creature ED", name = "Summon Creature ED", vocations = {2,6}, level = 200, premium = 0, QuestPoints = 0},	
	
	[9562]={ buy =20000, spell = "Summon Bel Fegor", name = "Summon Bel Fegor", vocations = {1,2,3,4,5,6,7,8}, level = 80, premium = 0, QuestPoints = 80},
	[9563]={ buy =20000, spell = "Summon Leo Nidas", name = "Summon Leo Nidas", vocations = {1,2,3,4,5,6,7,8}, level = 80, premium = 0, QuestPoints = 80},
	[9564]={ buy =20000, spell = "Summon Amon Thot", name = "Summon Amon Thot", vocations = {1,2,3,4,5,6,7,8}, level = 80, premium = 0, QuestPoints = 80},
	[9565]={ buy =20000, spell = "Summon Elm Inster", name = "Summon Elm Inster", vocations = {1,2,3,4,5,6,7,8}, level = 80, premium = 0, QuestPoints = 80},
	[9566]={ buy =20000, spell = "Summon Healer", name = "Summon Healer", vocations = {1,2,3,4,5,6,7,8}, level = 50, premium = 0, QuestPoints = 80},
	[7588]={ buy =5000, spell = "Summon Fairy", name = "Summon Fairy", vocations = {1,2,3,4,5,6,7,8}, level = 20, premium = 0, QuestPoints = 50},
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
                    if (player:getLevel() >= item.level and QPoints >= item.QuestPoints) then
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
