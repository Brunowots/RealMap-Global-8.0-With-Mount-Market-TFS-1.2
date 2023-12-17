local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'mace'}, 					Cfmace, 23)
shopModule:addSellableItem({'dagger'}, 					Cfdagger, 1)
shopModule:addSellableItem({'carlin sword'}, 					Cfcarlinsword, 118)
shopModule:addSellableItem({'club'}, 					Cfclub, 1)
shopModule:addSellableItem({'spear'}, 					Cfspear, 1)
shopModule:addSellableItem({'rapier'}, 					Cfrapier, 3)
shopModule:addSellableItem({'sabre'}, 					Cfsabre, 5)
shopModule:addSellableItem({'two handed sword'}, 					Cftwohandedsword, 190)
shopModule:addSellableItem({'sword'}, 					Cfsword, 15)
shopModule:addSellableItem({'battle axe'}, 					Cfbattleaxe, 75)
shopModule:addSellableItem({'battle hammer'}, 					Cfbattlehammer, 70)
shopModule:addSellableItem({'morning star'}, 					Cfmorningstar, 100)
shopModule:addSellableItem({'halberd'}, 					Cfhalberd, 310)
shopModule:addSellableItem({'double axe'}, 					Cfdoubleaxe, 260)
shopModule:addSellableItem({'war hammer'}, 					Cfwarhammer, 470)

shopModule:addBuyableItem({'spear'}, 					Cfspear, 10)
shopModule:addBuyableItem({'rapier'}, 					Cfrapier, 15)
shopModule:addBuyableItem({'sabre'}, 					Cfsabre, 25)
shopModule:addBuyableItem({'two handed sword'}, 					Cftwohandedsword, 950)
shopModule:addBuyableItem({'sword'}, 					Cfsword, 85)
shopModule:addBuyableItem({'battle axe'}, 					Cfbattleaxe, 235)
shopModule:addBuyableItem({'battle hammer'}, 					Cfbattlehammer, 350)
shopModule:addBuyableItem({'morning star'}, 					Cfmorningstar, 430)
shopModule:addBuyableItem({'club'}, 					Cfclub, 5)
shopModule:addBuyableItem({'dagger'}, 					Cfdagger, 5)
shopModule:addBuyableItem({'mace'}, 					Cfmace, 90)
shopModule:addBuyableItem({'throwing star'}, 					Cfthrowingstar, 50)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell weapons that are as lethal as the bite of the desertlion and as quick as the sandwasp."})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell weapons that are as lethal as the bite of the desertlion and as quick as the sandwasp."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Habdel Ibn Haqui."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't worry, there is enough time left to finish our deal."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons. Just ask what you need or tell me what you offer."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "With my weapons you have to fear the monsters no longer and you will brave any danger or dungeon!"})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "With my weapons you have to fear the monsters no longer and you will brave any danger or dungeon!"})
keywordHandler:addKeyword({'drefia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even the undead will fall a second time for the weapons you buy from me."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are welcome."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Which of my powerful weapons do you need?"})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Which of my powerful weapons do you need?"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My offers are light and heavy weapons."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My offers are light and heavy weapons."})
keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have clubs, daggers, spears, swords, maces, rapiers, morning stars, and sabres. What's your choice?"})
keywordHandler:addKeyword({'heavy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have the best two handed swords in Tibia. I also sell battle hammers and battle axes. What's your choice?"})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell only weapons. For armor, ask Azil in the other shop."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell only weapons. For armor, ask Azil in the other shop."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell only weapons. For armor, ask Azil in the other shop."})
keywordHandler:addKeyword({'trouser'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell only weapons. For armor, ask Azil in the other shop."})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell only weapons. For armor, ask Azil in the other shop."})

-- Storage IDs --

foriental    = 22017
soriental    = 22018 

newaddon    = 'Ah, right! The oriental scimitar or oriental jewelled belt! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function OrientalFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,foriental)
    if addon == -1 then
        if getPlayerItemCount(cid,5945) >= 1 then
        if doPlayerRemoveItem(cid,5945,1) then
            npcHandler:say('Ah, right! The oriental scimitar or oriental jewelled belt! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,foriental,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 146, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 150, 1)
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



node1 = keywordHandler:addKeyword({'scimitar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get oriental scimitar you need give me a mermaid comb. Do you have it with you?'})
node1:addChildKeyword({'yes'}, OrientalFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get oriental scimitar you need give me a mermaid comb. Do you have it with you?'})
node2:addChildKeyword({'yes'}, OrientalFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


npcHandler:addModule(FocusModule:new())