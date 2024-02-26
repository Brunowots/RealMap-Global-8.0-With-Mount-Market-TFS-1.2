local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the high knight of Carlin. I trained the the greatest heroines and even some males."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Trisha Ironfist."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is time for a fight!"})
keywordHandler:addKeyword({'hero'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Heroes are knights and knights are heroes, of course."})
keywordHandler:addKeyword({'knight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Knights are the true heroes of Tibia. Fame can only be earned by hand to hand combat. Brave women can join us, and we even accept suitable males now and then."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your vocation is your profession. There are four vocations in Tibia: Knights, paladins, sorcerers, and druids."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In a spellbook, all your spells are listed. There you will find the pronunciation of each spell. If you want to buy one, visit the magicians shop in the south of Carlin."})

-- Storage IDs --

fwarrior        = 22038
swarrior        = 22039

newaddon    = 'Ah, right! The warrior shoulder spike! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function WarriorFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fwarrior)
    if addon == -1 then
        if getPlayerItemCount(cid,5925) >= 100 and getPlayerItemCount(cid,5899) >= 100 and getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5919) >= 1 then
        if doPlayerRemoveItem(cid,5925,100) and doPlayerRemoveItem(cid,5899,100) and doPlayerRemoveItem(cid,5884,1) and doPlayerRemoveItem(cid,5919,1) then
            npcHandler:say('Ah, right! The warrior shoulder spike! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fwarrior,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 134, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 142, 1)
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





node1 = keywordHandler:addKeyword({'shoulder spike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get warrior shoulder spike you need give me 100 hardened bones, 100 turtle shells, a fighting spirit and a dragon claw. Do you have it with you?'})
node1:addChildKeyword({'yes'}, WarriorFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get warrior shoulder spike you need give me 100 hardened bones, 100 turtle shells, a fighting spirit and a dragon claw. Do you have it with you?'})
node2:addChildKeyword({'yes'}, WarriorFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



npcHandler:addModule(FocusModule:new())