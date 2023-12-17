-- based on addon npc, unknown source   NPC NAME -> Brokkr
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()                             npcHandler:onThink()                         end
 
npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME| , do you need some {help}?.")
 
function craftItem(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    if (parameters.confirm ~= true) and (parameters.decline ~= true) then
        local itemsTable = parameters.items
        local items_list = ''
        if table.maxn(itemsTable) > 0 then
            for i = 1, table.maxn(itemsTable) do
                local item = itemsTable[i]
                items_list = items_list .. item[2] .. ' ' .. getItemNameById(item[1])
                if i ~= table.maxn(itemsTable) then
                    items_list = items_list .. ', '
                end
            end
        end
        local text = ''
        if (parameters.cost > 0) and table.maxn(parameters.items) then
            text = items_list .. ' and ' .. parameters.cost .. ' gold pieces'
        elseif (parameters.cost > 0) then
            text = parameters.cost .. ' gold pieces'
        elseif table.maxn(parameters.items) then
            text = items_list
        end
        npcHandler:say('Did you bring me ' .. text .. ' for ' .. keywords[1] .. '?', cid)
        return true
    elseif (parameters.confirm == true) then
        local craftNode = node:getParent()
        local crafttable = craftNode:getParameters()
        local items_number = 0
        if table.maxn(crafttable.items) > 0 then
            for i = 1, table.maxn(crafttable.items) do
                local item = crafttable.items[i]
                if (getPlayerItemCount(cid,item[1]) >= item[2]) then
                    items_number = items_number + 1
                end
            end
        end
        if(getPlayerMoney(cid) >= crafttable.cost) and (items_number == table.maxn(crafttable.items)) then
            doPlayerRemoveMoney(cid, crafttable.cost)
            if table.maxn(crafttable.items) > 0 then
                for i = 1, table.maxn(crafttable.items) do
                    local item = crafttable.items[i]
                    doPlayerRemoveItem(cid,item[1],item[2])
                end
            end
                for i = 1, table.maxn(crafttable.rewards) do
                    local item = crafttable.rewards[i]
                    doPlayerAddItem(cid,item[1],item[2])
                end
            npcHandler:say('Here you are.', cid)
        else
            npcHandler:say('You do not have needed items!', cid)
        end
        npcHandler:resetNpc()
        return true
    elseif (parameters.decline == true) then
        npcHandler:say('Come back when you change your mind.', cid)
        npcHandler:resetNpc()
        return true
    end
    return false
end
 
local noNode = KeywordNode:new({'no'}, craftItem, {decline = true})
local yesNode = KeywordNode:new({'yes'}, craftItem, {confirm = true})
 
-- assembling
local craft_node = keywordHandler:addKeyword({"jester doll"}, craftItem, {cost = 5000, items = {{9694,1}, {9695,1}, {9696,1}, {9697,1}, {9698,1}, {9699,1}}, rewards = {{9693,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"helmet of the ancients"}, craftItem, {cost = 10000, items = {{2335,1}, {2336,1}, {2337,1}, {2338,1}, {2339,1}, {2340,1}, {2341,1}}, rewards = {{2342,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"koshei's ancient amulet"}, craftItem, {cost = 5000, items = {{8262,1}, {8263,1}, {8264,1}, {8265,1}}, rewards = {{8266,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
  
  
-- djinn, cyclops, mermaid (melting, crafting)
local craft_node = keywordHandler:addKeyword({"fighting spirit"}, craftItem, {cost = 0, items = {{2498,2}}, rewards = {{5884,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"warrior's sweat"}, craftItem, {cost = 0, items = {{2475,4}}, rewards = {{5885,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"spool of yarn"}, craftItem, {cost = 0, items = {{5879,10}}, rewards = {{5886,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"enchanted chicken wing"}, craftItem, {cost = 0, items = {{2195,1}}, rewards = {{5891,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"royal steel"}, craftItem, {cost = 0, items = {{2487,1}}, rewards = {{5887,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"hell steel"}, craftItem, {cost = 0, items = {{2462,1}}, rewards = {{5888,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"draconian steel"}, craftItem, {cost = 0, items = {{2516,1}}, rewards = {{5889,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"huge chunk of crude iron"}, craftItem, {cost = 0, items = {{2393,1}}, rewards = {{5892,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"magic sulphur"}, craftItem, {cost = 0, items = {{2392,3}}, rewards = {{5904,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
   
--MODs
local craft_node = keywordHandler:addKeyword({"epic elethriel's bow"}, craftItem, {cost = 150000, items = {{6579,1}, {5886,5}, {2177,1}, {5809,1}}, rewards = {{8858,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
 
local craft_node = keywordHandler:addKeyword({"epic demonwing axe"}, craftItem, {cost = 150000, items = {{6579,1}, {5887,5}, {2177,1}, {5809,1}}, rewards = {{8926,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
	
local craft_node = keywordHandler:addKeyword({"epic calamity"}, craftItem, {cost = 150000, items = {{6579,1}, {5887,5}, {2177,1}, {5809,1}}, rewards = {{8932,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
	
local craft_node = keywordHandler:addKeyword({"epic hammer of prophecy"}, craftItem, {cost = 150000, items = {{6579,1}, {5887,5}, {2177,1}, {5809,1}}, rewards = {{7450,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)	

local craft_node = keywordHandler:addKeyword({"epic soul wand"}, craftItem, {cost = 150000, items = {{6579,1}, {2348,1}, {2177,1}, {5809,1}, {2401,1}}, rewards = {{7424,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)		
   
   
-- smithing, enchanting
function creatureSayCallback(cid, type, msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
    if(not npcHandler:isFocused(cid)) then
        return false
    end
   
    if talkState[talkUser] == 1 then
        if (not msgcontains(msg, "yes"))then
        npcHandler:say('Come back when you change your mind.', cid)
        talkState[talkUser] = 0
        npcHandler:resetNpc()
        else
        bolts = (getPlayerItemCount(cid,5944) * 2)
        if getPlayerItemCount(cid,5944) > 0 then
        if doPlayerRemoveItem(cid,5944,getPlayerItemCount(cid,5944)) then
            doPlayerAddItem(cid,6529,bolts)
            npcHandler:say('Here you are.', cid)
        else
            npcHandler:say("You don't have needed items!", cid) -- if orbs couldn't be removed
        end
        else
            npcHandler:say("You don't have needed items!", cid) -- if backpack is empty
        end
        talkState[talkUser] = 0
        npcHandler:resetNpc()
        end
    else
    if msgcontains(msg, "orb") or (msgcontains(msg, "infernal") and msgcontains(msg, "bolt")) then
        if (getPlayerItemCount(cid,5944) > 1) then orbs = getPlayerItemCount(cid,5944) .. " orbs" else orbs = "your soul orb" end
        bolts = (getPlayerItemCount(cid,5944) * 2)
        if (getPlayerItemCount(cid,5944) > 0) then
        npcHandler:say('Do you want to exchange ' .. orbs .. ' for ' .. bolts .. ' infernal bolts?', cid)
        talkState[talkUser] = 1
        else
        npcHandler:say('If you bring me some soul orbs, you may exchange them for infernal bolts.', cid)
        end
    end
    if msgcontains(msg, "list") then
    craftable = {
    [1] = {"jester doll", "helmet of the ancients", "Koshei's ancient amulet"},
    [2] = {"fighting spirit", "warrior's sweat", "spool of yarn", "enchanted chicken wing", "royal steel", "hell steel", "draconian steel", "huge chunk of crude iron", "infernal bolts"},
    [3] = {"epic elethriel's bow" , "epic demonwing axe", "epic calamity", "epic hammer of prophecy", "epic soul wand"}
    }
    craftable_name = {
    [1] = "Assembling",
    [2] = "Melting, Crafting",
    [3] = "Epic Items"
    }
    local text = ""
   
    for i=1, #craftable do
    table.sort(craftable[i])
    local line = ""
    text = text .. line .. "    " .. craftable_name[i] .. ":\n        " .. table.concat(craftable[i], "\n        ") .. "\n\n"
    end
    npcHandler:say("Here.", cid)
    doPlayerPopupFYI(cid,"Available items:\n".. text)
    end
    end
    return true
end
keywordHandler:addKeyword({'craft'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Okay, just ask me for a {list} and I will show you recipes."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'If you want to {trade} or {craft} something just ask.'})
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you bring me some {soul orbs}, you may exchange them for {infernal bolts}."})

 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())