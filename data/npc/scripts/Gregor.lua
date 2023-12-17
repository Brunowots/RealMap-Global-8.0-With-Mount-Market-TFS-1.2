local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


-- OTServ event handling functions start
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
-- OTServ event handling functions end

local node1 = keywordHandler:addKeyword({'great light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn great light for 500 gp?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'great light',vocation = 4, price = 500, level = 1})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'light healing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn light healing for 170 gp?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'light healing',vocation = 4, price = 170, level = 1})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn light for free?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'light',vocation = 4, price = 0, level = 1})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'find person'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn find person for 80 gold coins?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'find person',vocation = 4, price = 80, level = 1})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'antidote'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn antidote for 150 gold coins?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'antidote',vocation = 4, price = 150, level = 1})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())

-- Storage IDs --

fknight     = 60055 
sknight     = 60056 

newaddon    = 'Ah, right! The knight addon! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function KnightSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,sKnight)
    if addon == -1 then
        if getPlayerItemCount(cid,5893) >= 100 and getPlayerItemCount(cid,5885) >= 1 and 
getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5924) >= 1 then
        if doPlayerRemoveItem(cid,5893,100) and doPlayerRemoveItem(cid,5885,1) and 
getPlayerItemCount(cid,5892,1) and 
doPlayerRemoveItem(cid,5924,1) then
            npcHandler:say('Ah, right! The knight addon! Here you go.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,sKnight,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 131, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 139, 2)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end



node1 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get knight addon you need give me 100 perfect behemoth fang, 1 huge chunk of crude iron, 1 damaged steel helmet and a 1 flask of warriors sweat. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, KnightSecond, {})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node1 = keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell knight spells (great light), (light healing), (light, find person), and (antidote)!'})
    node1:addChildKeyword({'yes'}, KnightSecond, {})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all money.', reset = true})
	
	npcHandler:addModule(FocusModule:new())