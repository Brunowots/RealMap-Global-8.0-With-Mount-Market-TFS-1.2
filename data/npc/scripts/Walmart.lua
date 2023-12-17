local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, 'egg') then
		npcHandler:say('Do you like ten eggs for 50 gold?', cid)
			npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			if not player:removeMoneyNpc(50) then
				npcHandler:say('No gold, no sale, that\'s it.', cid)
				return true
			end
			npcHandler:say('Here you are.', cid)			
			player:addItem(2695, 10)
		elseif msgcontains(msg, 'no') then
			npcHandler:say('I have but a few eggs, anyway.', cid)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Welcome to the Supermarket, |PLAYERNAME|. Have a good time and eat some food!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
local focusModule = FocusModule:new()
focusModule:addGreetMessage('hi')
npcHandler:addModule(focusModule)
