local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = 'People of Thais, bring honour to your king by fighting in the orc war!' },
	{ text = 'The orcs are preparing for war!!!' }
}


local function creatureSayCallback(cid, type, msg)

	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	
	
	--Cuadno responde Mission
	if msgcontains(msg, 'mission') then	
		if player:getStorageValue(45210) == -1 then
			npcHandler:say({
				'We\'ve got a rat problem in the sewers. In the name of our glorious king, I\'m paying 1 blinking piece of gold for every freshly killed rat you bring me. ...',
				'You seem strong! Do you want to help fighting the orcs? They prepare themselves for war! We need everyone who\'s capable of killing greenskins! Ask me about the {orc war} if you are interested.'
			}, cid)
			npcHandler.topic[cid] = 1  
		end
	end
	
	
	if player:getStorageValue(45210) == 3 then
			npcHandler:say({
				'Burning war equipment in the orc fortrest'				
			}, cid)			
	end	
		
	
	if msgcontains(msg, 'war plans') then	
	
		if player:getStorageValue(45210) == 4 then
			npcHandler:say({
				'The orcs are moving their troops. We need to know what they are up to! Go to the orc fortress. There should be some kind of blackboard somewhere. Study it and tell me their plans!'				
			}, cid)
			player:setStorageValue(45210, 5)
		end
		if player:getStorageValue(45210) == 5 then
			npcHandler:say({
				'Find the Orc Plans!'				
			}, cid)			
		end
		if player:getStorageValue(45210) == 6 then
			npcHandler:say({
				'Great job!! I have to discuss their plans with the king immediately. Keep it up!'				
			}, cid)
			player:setStorageValue(45210, 7)
			player:addExperience(5000)
		end
	end
	
	
	--Cuadno responde Mission
	if msgcontains(msg, 'orc war') and npcHandler.topic[cid] == 1 then			
		player:setStorageValue(45210, 1)
		npcHandler:say({
				'I hope you know where to find orc land!! There are various things that you can do for your country! First of all, we need to establish some outposts that need to be maintained. ...',
				'For that, you can buy bricklayer kits from me. Just tell me if you need some. Secondly, the orcs are building ballistae, catapults and siege towers for their attack! Set them on fire! ...',
				'Thirdly, we need to find out what they are planning. Go find the current war plans! Actually they are not THAT smart, so they don\'t change them very often. Ask me first before you are heading there for nothing! ...',
				'That would be all for the moment. Oh I forgot, you collect achievement points while you\'re on duty. Ask me regularly about them, you might get a promotion if you\'re doing well!'
			}, cid)
	
		npcHandler.topic[cid] = 2  
	
	elseif msgcontains(msg, 'where') and npcHandler.topic[cid] == 2 then
	npcHandler:say({
				'It\'s north east of here. Pass the mountains of Kazordoon and go east. Past the wyvern nest, you\'ll find our outpost and then you\'ll enter Ulderek\'s Rock. Take care!'
			}, cid)
	
	
	end



	return true
end


npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setMessage(MESSAGE_GREET, "LONG LIVE KING TIBIANUS!")
npcHandler:setMessage(MESSAGE_FAREWELL, "LONG LIVE THE KING!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "LONG LIVE THE KING!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Do you bring freshly killed rats for a bounty of 1 gold each? By the way, I also buy orc teeth and other stuff you ripped from their bloody corp... I mean... well, you know what I mean.")


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
