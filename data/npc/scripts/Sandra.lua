local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = 'Life Fluid as well and mana fluid in different sizes!' },
	{ text = 'If you need alchemical fluids like slime and blood, get them here.' }
}

npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if isInArray({"vial", "ticket", "bonus", "deposit"}, msg) then
		if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonBelt) < 1 then
			npcHandler:say("You have "..player:getStorageValue(38412).." credits. We have a special offer right now for depositing vials. Are you interested in hearing it?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonBelt) >= 1 then
			npcHandler:say("Would you like to get a lottery ticket instead of the deposit for your vials?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "prize") then
		npcHandler:say("Are you here to claim a prize?", cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				"The Edron academy has introduced a bonus system. Each time you deposit 100 vials without claiming the money for it, you will receive a lottery ticket. ...",
				"Some of these lottery tickets will grant you a special potion belt accessory, if you bring the ticket to me. ...",
				"If you join the bonus system now, I will ask you each time you are bringing back 100 or more vials to me whether you claim your deposit or rather want a lottery ticket. ...",
				"Of course, you can leave or join the bonus system at any time by just asking me for the 'bonus'. ...",
				"Would you like to join the bonus system now?"
			}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say("Great! I've signed you up for our bonus system. From now on, you will have the chance to win the potion belt addon!", cid)
			player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonBelt, 1)
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1) --this for default start of Outfit and Addon Quests
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:getStorageValue(38412) >= 100 or player:removeItem(7490, 100, 0) or player:removeItem(7490, 100, 0) or player:removeItem(7490, 100, 0) then
				npcHandler:say("Alright, thank you very much! Here is your lottery ticket, good luck. Would you like to deposit more vials that way?", cid)
				player:setStorageValue(38412, player:getStorageValue(38412)-100);
				player:addItem(5957, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Sorry, but you don't have 100 empty flasks or vials of the SAME kind and thus don't qualify for the lottery. Would you like to deposit the vials you have as usual and receive 5 gold per vial?", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonBelt) == 1 and player:removeItem(5958, 1) then
				npcHandler:say("Congratulations! Here, from now on you can wear our lovely potion belt as accessory.", cid)
				player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonBelt, 2)
				player:addOutfitAddon(138, 1)
				player:addOutfitAddon(133, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			else
				npcHandler:say("Sorry, but you don't have your lottery ticket with you.... or not signed in bonus system", cid)
			end
			npcHandler.topic[cid] = 0
		end
		return true
	end
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell: animate dead, blank rune, desintegrate, energy bomb, fireball, magic wall, paralyze, poison bomb, soulfire, stone shower, wild growth, antidote, chamaleon, convince creature, destroy field, energy field, energy wall, explosion, fire bomb, fire field, greate fireball, light magic missile, heavy magic missile, intense healing, poison field, poison wall, stalagmite, ultimate healing and sudden death.'})
keywordHandler:addKeyword({'potions'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell: mana fluid and life fluid.'})
keywordHandler:addKeyword({'wands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell: wand of vortex, wand of dragonbreath, wand of plague, wand of cosmic energy and wand of inferno..'})
keywordHandler:addKeyword({'rods'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell: snakebite rod, moonlight rod, volcanic rod, quagmire rod and tempest rod'})


shopModule:addBuyableItem({'spellbook'}, 2175, 150, 'spellbook')
shopModule:addBuyableItem({'magic lightwand'}, 2163, 400, 'magic lightwand')

shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 2006, 50, 7, 'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 2006, 50, 2, 'life fluid')

shopModule:addBuyableItemContainer({'bp mf'}, 2001, 2006, 1000, 7, 'backpack of life fluids')
shopModule:addBuyableItemContainer({'bp lf'}, 2000, 2006, 1000, 2, 'backpack of mana fluids')

shopModule:addBuyableItem({'animate dead'}, 2316, 375, 1, 'animate dead rune')
shopModule:addBuyableItem({'blank rune'}, 2260, 10, 1, 'blank rune')
shopModule:addBuyableItem({'desintegrate'}, 2310, 26, 1, 'desintegrate rune')
shopModule:addBuyableItem({'energy bomb'}, 2262, 203, 1, 'energy bomb rune')
shopModule:addBuyableItem({'great fireball rune'}, 2304, 180, 1, 'great fireball rune')
shopModule:addBuyableItem({'fireball rune'}, 2302, 95, 1, 'fireball rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 116, 1, 'magic wall rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 700, 1, 'paralyze rune')
shopModule:addBuyableItem({'poison bomb'}, 2286, 85, 1, 'poison bomb rune')
shopModule:addBuyableItem({'soulfire'}, 2308, 46, 1, 'soulfire rune')
shopModule:addBuyableItem({'wild growth'}, 2269, 160, 1, 'wild growth rune')

shopModule:addSellableItem({'vial', 'flask'}, 7490, 5, 'empty vial', 0)

shopModule:addBuyableItem({'antidote'}, 2266, 65, 1, 'antidote rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 1, 'chameleon rune')
shopModule:addBuyableItem({'convince creature'}, 2290, 80, 1, 'convince creature rune')
shopModule:addBuyableItem({'destroy field'}, 2261, 45, 1, 'destroy field rune')
shopModule:addBuyableItem({'energy field'}, 2277, 115, 1, 'energy field rune')
shopModule:addBuyableItem({'energy wall'}, 2279, 340, 4, 'energy wall rune')
shopModule:addBuyableItem({'explosion'}, 2313, 250, 1, 'explosion rune')
shopModule:addBuyableItem({'fire bomb'}, 2305, 235, 1, 'fire bomb rune')
shopModule:addBuyableItem({'fire field'}, 2301, 85, 1, 'fire field rune')
shopModule:addBuyableItem({'fire wall'}, 2303, 245, 1, 'fire wall rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 125, 1, 'heavy magic missile rune')
shopModule:addBuyableItem({'intense healing'}, 2265, 95, 1, 'intense healing rune')
shopModule:addBuyableItem({'light magic missile'}, 2287, 40, 1, 'light magic missile rune')
shopModule:addBuyableItem({'poison field'}, 2285, 65, 1, 'poison field rune')
shopModule:addBuyableItem({'poison wall'}, 2289, 210, 1, 'poison wall rune')
shopModule:addBuyableItem({'stalagmite'}, 2292, 125, 1, 'stalagmite rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 325, 1, 'sudden death rune')
shopModule:addBuyableItemContainer({'bp sd'}, 2003, 2268, 6500, 1, 'backpack of sudden death rune')
shopModule:addBuyableItem({'ultimate healing'}, 2273, 175, 1, 'ultimate healing rune')
shopModule:addBuyableItemContainer({'bp uh'}, 2002, 2273, 3500, 1, 'backpack of healing rune')
shopModule:addBuyableItemContainer({'bp gfb'}, 2000, 2304, 3600, 1, 'backpack of great fireball rune')

shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 500, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of plague', 'plague'}, 2188, 5000, 'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000, 'wand of inferno')

shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic'}, 2185, 1000, 'volcanic rod')
shopModule:addBuyableItem({'quagmire rod', 'quagmire'}, 2181, 2000, 'quagmire rod')
shopModule:addBuyableItem({'tempest rod', 'tempest'}, 2183, 3000, 'tempest rod')


shopModule:addSellableItem({'wand of vortex', 'vortex'}, 2190, 100, 'wand of vortex')
shopModule:addSellableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 200, 'wand of dragonbreath')
shopModule:addSellableItem({'wand of plague', 'plague'}, 2188, 1000, 'wand of plague')
shopModule:addSellableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 2000, 'wand of cosmic energy')
shopModule:addSellableItem({'wand of inferno', 'inferno'}, 2187, 3000, 'wand of inferno')

shopModule:addSellableItem({'snakebite rod', 'snakebite'}, 2182, 100, 'snakebite rod')
shopModule:addSellableItem({'moonlight rod', 'moonlight'}, 2186, 200, 'moonlight rod')
shopModule:addSellableItem({'volcanic rod', 'volcanic'}, 2185, 1000, 'volcanic rod')
shopModule:addSellableItem({'quagmire rod', 'quagmire'}, 2181, 2000, 'quagmire rod')
shopModule:addSellableItem({'tempest rod', 'tempest'}, 2183, 3000, 'tempest rod')

keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, text = 'I sell potions and fluids. If you\'d like to see my offers, ask me for a {trade}.'})

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|, welcome to the fluid and potion {shop} of Edron.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|, please come back soon.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye, |PLAYERNAME|, please come back soon.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. By the way, if you'd like to join our bonus system for depositing flasks and vial, you have to tell me about that {deposit}.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
