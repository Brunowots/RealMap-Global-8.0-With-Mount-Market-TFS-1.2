
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
	if(msgcontains(msg, "mission")) then
		if(player:getStorageValue(Storage.TheNewFrontier.Questline) == 17) then
			npcHandler:say("You come here to ask us to spare your people? This land has no tolerance for the weak, we have it neither. If you want us to consider you as useful for us, you'll have to prove it in a {test} of strength and courage. ", cid)
			npcHandler.topic[cid] = 1
		elseif(player:getStorageValue(Storage.TheNewFrontier.Questline) == 19) then
			npcHandler:say({
				"We have seen that you can fight and survive. Yet, it will also need cleverness and courage to survive in these lands. We might see later if you've got what it takes. ...",
				"However, I stand to my word - our hordes will spare your insignificant piece of rock for now. Time will tell if you are worthy living next to us. ...",
				"Still, it will take years until we might consider you as an ally, but this is a start at least."
			}, cid)
			player:setStorageValue(Storage.TheNewFrontier.Questline, 20)
			player:setStorageValue(Storage.TheNewFrontier.Mission06, 3) --Questlog, The New Frontier Quest "Mission 06: Days Of Doom"
			
		elseif(player:getStorageValue(45220) == -1) then
			--An Uneasy Alliance
			player:setStorageValue(45220, 1) 
			npcHandler:say({
					'So you still think you can be of any use for us? Words are cheap and easy. Admittedly, you\'ve passed our first test but even some resilient beast might have accomplished that. ...',
					'Your actions will tell if you are only yelping for attention like a puppy or if you have the teeth of a wolf. ...',
					'A first tiny step was taken. You survived the test and ensured the survival of your allies for a while. Now it is time to make the next step. ...',
					'So listen human: Our rule over the orcs is not unchallenged. Of course now and then someone shows up who thinks he can defeat us. Usually these fights end fast and bloody in the ring. ...',
					'Right now, some coward from our midst, who is too afraid to face us in single combat, has gathered a group of followers, hoping more will follow and change sides. ...',
					'With your help, his defeat will not only be deadly but also humiliating and so discourage others to follow his example. ...',
					'You will seek out this rebel commander in his hideout and kill him. We will show them that not even a Mooh\'Tah master is needed to get rid of such wannabe leaders but that a mere human can handle them. ...',
					'Find him in the mountain north-west of here and kill him. If you find any loot, you can keep it.'
				}, cid)
		elseif(player:getStorageValue(45220) == 2) then
			player:setStorageValue(45220, 3) 
			doPlayerAddItem(player,11134,1)			
			npcHandler:say({
					'Finally, our enemy\'s vision is obscured. Now we can move in for some more daring raids until they replace their scrying device. You have proven yourself brave and useful so far. With that, you bought your allies some more days to live. ...',
					'Here is a reward. It\'s a strange tome that we\'ve found in the lizard ruins. Maybe it is of some value for you or your allies.'
			}, cid)	
		end			
	elseif(msgcontains(msg, "test")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say({
				"First we will test your strength and endurance. You'll have to face one of the most experienced Mooh'Tah masters. As you don't stand a chance to beat such an opponent, your test will be simply to survive. ...",
				"Face him in a battle and survive for two minutes. If you do, we will be willing to assume that your are prepared for the life in these lands. Enter the ring of battle, close to my quarter. Return to me after you have passed this test."
			}, cid)
			npcHandler.topic[cid] = 0
			player:setStorageValue(Storage.TheNewFrontier.Questline, 18)
			player:setStorageValue(Storage.TheNewFrontier.Mission06, 2) --Questlog, The New Frontier Quest "Mission 06: Days Of Doom"
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
