--[[

Achievements Lib Created By Eduardo Montilva (Darkhaos) for TFS 1.X

LAST UPDATE: 23 July 2019 (PRE-Tibia Update 12.20)

Functions:
	getAchievementInfoById(achievement_id)
	getAchievementInfoByName(achievement_name)
	getSecretAchievements()
	getPublicAchievements()
	getAchievements()
	Player:addAchievement(achievement_id/name[, showMsg])
	Player:removeAchievement(achievement_id/name)
	Player:hasAchievement(achievement_id/name)
	Player:addAllAchievements([showMsg])
	Player:removeAllAchievements()
	Player:getSecretAchievements()
	Player:getPublicAchievements()
	Player:getAchievements()
	isAchievementSecret(achievement_id/name)
	Player:getAchievementPoints()

Note: 	This lib was created following the data found in tibia.wikia.com.
		Achievements with no points (or points equal to 0) are achievements with no available info about points in tibia.wikia.com. These achievements should be updated
--]]

-- Updated by F@bio Jr
-- Reordered by Tibia Version and alphabetically
-- LAST UPDATE: 01 December 2019 (PRE-Tibia Update 12.30)

ACHIEVEMENTS_BASE = 300000 -- base storage
ACHIEVEMENTS_ACTION_BASE = 20000 	--this storage will be used to save the process to obtain the certain achievement
									--(Ex: this storage + the id of achievement 'Allowance Collector' to save...
									-- ...how many piggy banks has been broken

achievements =
{	
	--8.6
	[1] = {name = "Allow Cookies?", grade = 1, points = 2, description = "With a perfectly harmless smile you fooled all of those wisecrackers into eating your exploding cookies. Consider a boy or girl scout outfit next time to make the trick even better."},
	[2] = {name = "Allowance Collector", grade = 1, points = 2, secret = true, description = "You certainly have your ways when it comes to acquiring money. Many of them are pink and paved with broken fragments of porcelain."},
	[3] = {name = "Amateur Actor", grade = 1, points = 2, description = "You helped bringing Princess Buttercup, Doctor Dumbness and Lucky the Wonder Dog to life - and will probably dream of them tonight, since you memorised your lines perfectly. What a .. special piece of.. screenplay."},
	[4] = {name = "Animal Activist", grade = 1, points = 2, description = "You have a soft spot for little, weak animals, and you do everything in your power to protect them - even if you probably eat dragons for breakfast."},
	[5] = {name = "Annihilator", grade = 2, points = 5, description = "You've daringly jumped into the infamous Annihilator and survived - taking home fame, glory and your reward."},
	[6] = {name = "Archpostman", grade = 1, points = 3, description = "Delivering letters and parcels has always been a secret passion of yours, and now you can officially put on your blue hat, blow your Post Horn and do what you like to do most. Beware of dogs!"},
	[7] = {name = "Backpack Tourist", grade = 1, points = 1, secret = true, description = "If someone lost a random thing in a random place, you're probably a good person to ask and go find it, even if you don't know what and where."},
	[8] = {name = "Beach Tamer", grade = 1, points = 2, description = "You re-enacted the Taming of the Shrew on a beach setting and proved that you can handle capricious girls quite well. With or without fish tails."},
	[9] = {name = "Bearhugger", grade = 1, points = 1, description = "Warm, furry and cuddly - though that same bear you just hugged would probably rip you into pieces if he had been conscious, he reminded you of that old teddy bear which always slept in your bed when you were still small."},
	[10] = {name = "Blessed!", grade = 1, points = 2, description = "You travelled the world for an almost meaningless prayer - but at least you don't have to do that again and can get a new blessed stake in the blink of an eye."},
	[11] = {name = "Bone Brother", grade = 1, points = 1, description = "You've joined the undead bone brothers - making death your enemy and your weapon as well. Devouring what's weak and leaving space for what's strong is your primary goal."},
	[12] = {name = "Castlemania", grade = 2, points = 5, secret = true, description = "You have an eye for suspicious places and love to read other people's diaries, especially those with vampire stories in it. You're also a dedicated token collector and explorer. Respect!"},
	[13] = {name = "Champion of Chazorai", grade = 2, points = 4, description = "You won the merciless 2 vs. 2 team tournament on the Isle of Strife and wiped out wave after wave of fearsome opponents. Death or victory - you certainly chose the latter."},
	[14] = {name = "Chorister", grade = 1, points = 1, description = "Lalalala... you now know the cult's hymn sung in Liberty Bay"},
	[15] = {name = "Clay Fighter", grade = 1, points = 3, secret = true, description = "You love getting your hands wet and dirty - and covered with clay. Your perfect sculpture of Brog, the raging Titan is your true masterpiece."},	
	[16] = {name = "Clay to Fame", grade = 2, points = 6, secret = true, description = "Sculpting Brog, the raging Titan, is your secret passion. Numerous perfect little clay statues with your name on them can be found everywhere around Tibia."},
	[17] = {name = "Cold as Ice", grade = 2, points = 6, secret = true, description = "Take an ice cube and an obsidian knife and you'll very likely shape something really pretty from it. Mostly cute little mammoths, which are a hit with all the girls."},
	[18] = {name = "Culinary Master", grade = 2, points = 4, description = "Simple hams and bread merely make you laugh. You're the master of the extra-ordinaire, melter of cheese, fryer of bat wings and shaker of shakes. Delicious!"},
	[19] = {name = "Deep Sea Diver", grade = 2, points = 4, secret = true, description = "Under the sea - might not be your natural living space, but you're feeling quite comfortable on the ocean floor. Quara don't scare you anymore and sometimes you sleep with your helmet of the deep still equipped."},
	[20] = {name = "Dread Lord", grade = 3, points = 8, secret = true, description = "You don't care for rules that others set up and shape the world to your liking. Having left behind meaningless conventions and morals, you prize only the power you wield. You're a master of your fate and battle to cleanse the world."},
	[21] = {name = "Efreet Ally", grade = 1, points = 3, description = "Even though the welcomed you only reluctantly and viewed you as \"only a human\" for quite some time, you managed to impress Malor and gained his respect and trade options with the green djinns."},
	[22] = {name = "Elite Hunter", grade = 2, points = 5, description = "You jump at every opportunity for a hunting challenge that's offered to you and carry out those tasks with deadly precision. You're a hunter at heart and a valuable member of the Paw &amp; Fur Society."},
	[23] = {name = "Explorer", grade = 2, points = 4, description = "You've been to places most people don't even know the names of. Collecting botanic, zoologic and ectoplasmic samples is your daily business and you're always prepared to discover new horizons."},
	[24] = {name = "Exquisite Taste", grade = 1, points = 2, secret = true, description = "You love fish - but preferably those caught in the cold north. Even though they're hard to come by you never get tired of picking holes in ice sheets and hanging your fishing rod in."},
	[25] = {name = "Firewalker", grade = 2, points = 4, secret = true, description = "Running barefoot across ember is not for you! You do it the elegant way. Yet, you're kind of drawn to fire and warm surroundings in general - you like it hot!"},	
	[26] = {name = "Fireworks in the Sky", grade = 1, points = 2, secret = true, description = "You love the moment right before your rocket takes off and explodes into beautiful colours - not only on new year's eve!"},
	[27] = {name = "Follower of Azerus", grade = 2, points = 4, description = "When you do something, you do it right. You have an opinion and you stand by it - and no one will be able to convince you otherwise. On a sidenote, you're a bit on the brutal and war-oriented side, but that's not a bad thing, is it?"},
	[28] = {name = "Follower of Palimuth", grade = 2, points = 4, description = "You're a peacekeeper and listen to what the small people have to say. You've made up your mind and know who to help and for which reasons - and you do it consistently. Your war is fought with reason rather than weapons."},
	[29] = {name = "Fountain of Life", grade = 1, points = 1, secret = true, description = "You found and took a sip from the Fountain of Life. Thought it didn't grant you eternal life, you feel changed and somehow at peace."},
	[30] = {name = "Friend of the Apes", grade = 2, points = 4, description = "You know Banuta like the back of your hand and are good at destroying caskets and urns. The sight of giant footprints doesn't keep you from exploring unknown areas either."},
	[31] = {name = "Ghostwhisperer", grade = 1, points = 3, description = "You don't hunt them, you talk to them. You know that ghosts might keep secrets that have been long lost among the living, and you're skilled at talking them into revealing them to you."},
	[32] = {name = "Golem in the Gears", grade = 2, points = 4, description = "You're an aspiring mago-mechanic. Science and magic work well together in your eyes - and even though you probably delivered countless wrong charges while working for Telas, you might just have enough knowledge to build your own golem now."},
	[33] = {name = "Green Thumb", grade = 2, points = 4, secret = true, description = "If someone gives you seeds, you usually grow a beautiful plant from it within a few days. You like your house green and decorated with flowers. Probably you also talk to them."},
	[34] = {name = "Greenhorn", grade = 1, points = 2, description = "You wiped out Orcus the Cruel in the Arena of Svargrond. You're still a bit green behind the ears, but there's some great potential."},
	[35] = {name = "Herbicide", grade = 3, points = 8, secret = true, description = "You're one of the brave heroes to face and defeat the mysterious demon oak and all the critters it threw in your face. Wielding your blessed axe no tree dares stand in your way - demonic or not."},
	[36] = {name = "Here, Fishy Fishy!", grade = 1, points = 1, secret = true, description = "Ah, the smell of the sea! Standing at the shore and casting a line is one of your favourite activities. For you, fishingis relaxing - and at the same time, providing easy food. Perfect!"},
	[37] = {name = "High-Flyer", grade = 2, points = 4, secret = true, description = "The breeze in your hair, your fingers clutching the rim of your Carpet - that's how you like to travel. Faster! Higher! And a looping every now and then."},
	[38] = {name = "High Inquisitor", grade = 2, points = 5, description = "You're the one who poses the questions around here, and you know how to get the answers you want to hear. Besides, you're a famous exorcist and slay a few vampires and demons here and there. You and your stake are a perfect team."},
	[39] = {name = "His True Face", grade = 1, points = 3, secret = true, description = "You're one of the few Tibians who Armenius chose to actually show his true face to - and he made you fight him. Either that means you're very lucky or very unlucky, but one thing's for sure - it's extremely rare."},
	[40] = {name = "Honorary Barbarian", grade = 1, points = 1, description = "You've hugged bears, pushed mammoths and proved your drinking skills. And even though you have a slight hangover, a partially fractured rib and some greasy hair on your tongue, you're quite proud to call yourself a honorary barbarian from now on."},
	[41] = {name = "Huntsman", grade = 1, points = 2, description = "You're familiar with hunting tasks and have carried out quite a few already. A bright career as hunter for the Paw &amp; Fur society lies ahead!"},
	[42] = {name = "Ice Sculptor", grade = 1, points = 3, secret = true, description = "You love to hang out in cold surroundings and consider ice the best material to be shaped. What a waste to use ice cubes for drinks when you can create a beautiful mammoth statue from it!"},
	[43] = {name = "Interior Decorator", grade = 2, points = 4, secret = true, description = "Your home is your castle - and the furniture in it is just as important. Your friends ask for your advice when decorating their Houses and your probably own every statue, rack and bed there is."},
	[44] = {name = "Jamjam", grade = 2, points = 5, secret = true, description = "When it comes to interracial understanding, you're an expert. You've mastered the language of the Chakoya and made someone really happy with your generosity. Achuq!"},	
	[45] = {name = "Jinx", grade = 1, points = 2, secret = true, description = "Sometimes you feel there's a gremlin in there. So many lottery tickets, so many blanks? That's just not fair! Share your misery with the world."},
	[46] = {name = "Just in Time", grade = 1, points = 1, description = "You're a fast runner and are good at delivering wares which are bound to decay just in the nick of time, even if you can't use any means of transportation or if your hands get cold or smelly in the process."},
	[47] = {name = "King Tibianus Fan", grade = 1, points = 3, description = "You're not sure what it is, but you feel drawn to royalty. Your knees are always a bit grazed from crawling around in front of thrones and you love hanging out in castles. Maybe you should consider applying as a guard?"},
	[48] = {name = "Lord Protector", grade = 3, points = 8, secret = true, description = "You proved yourself - not only in your dreams - and possess a strong and spiritual mind. Your valorous fight against demons and the undead plague has granted you the highest and most respected rank among the Nightmare Knights."},
	[49] = {name = "Lord of the Elements", grade = 2, points = 5, description = "You travelled the surreal realm of the elemental spheres, summoned and slayed the Lord of the Elements, all in order to retrieve neutral matter. And as brave as you were, you couldn't have done it without your team!"},
	[50] = {name = "Lucid Dreamer", grade = 1, points = 2, description = "Dreams - are your reality? Strange visions, ticking clocks, going to bed and waking up somewhere completely else - that was some trip, but you're almost sure you actually did enjoy it."},
	[51] = {name = "Lucky Devil", grade = 2, points = 4, secret = true, description = "That's almost too much luck for one person. If something's really, really rare - it probably falls into your lap sooner or later. Congratulations!"},
	[52] = {name = "Marble Madness", grade = 2, points = 6, secret = true, description = "Your little statues of Tibiasula have become quite famous around Tibia and there's few people with similar skills when it comes to shaping marble."},
	[53] = {name = "Marblelous", grade = 1, points = 3, secret = true, description = "You're an aspiring marble sculptor with promising skills - proven by the perfect little Tibiasula statue you shaped. One day you'll be really famous!"},
	[54] = {name = "Marid Ally", grade = 1, points = 3, description = "You've proven to be a valuable ally to the Marid, and Gabel welcomed you to trade with Haroun and Nah'Bob whenever you want to. Though the Djinn war has still not ended, the Marid can't fail with you on their side."},	
	[55] = {name = "Masquerader", grade = 1, points = 3, secret = true, description = "You probably don't know anymore how you really look like - usually when you look into a mirror, some kind of monster stares back at you. On the other hand - maybe that's an improvement?"},
	[56] = {name = "Master Thief", grade = 2, points = 4, description = "Robbing, inviting yourself to VIP parties, faking contracts and pretending to be someone else - you're a jack of all trades when it comes to illegal activities. You take no prisoners, except for the occasional goldfish now and then."},
	[57] = {name = "Master of the Nexus", grade = 2, points = 6, description = "You were able to fight your way through the countless hordes in the Demon Forge. Once more you proved that nothing is impossible."},
	[58] = {name = "Matchmaker", grade = 1, points = 1, description = "You don't believe in romance to be a coincidence or in love at first sight. In fact - love potions, bouquets of flowers and cheesy poems do the trick much better than ever could. Keep those hormones flowing!"},
	[59] = {name = "Mathemagician", grade = 1, points = 1, description = "Sometimes the biggest secrets of life can have a simple solution."},
	[60] = {name = "Ministrel", grade = 1, points = 2, secret = true, description = "You can handle any music instrument you're given - and actually manage to produce a pleasant sound with it. You're a welcome guest and entertainer in most taverns."},
	[61] = {name = "Nightmare Knight", grade = 1, points = 1, description = "You follow the path of dreams and that of responsibility without self-centered power. Free from greed and selfishness, you help others without expecting a reward."},
	[62] = {name = "Party Animal", grade = 1, points = 1, secret = true, description = "Oh my god, it's a paaaaaaaaaaaarty! You're always in for fun, friends and booze and love being the center of attention. There's endless reasons to celebrate! Woohoo!"},
	[63] = {name = "Passionate Kisser", grade = 1, points = 3, description = "For you, a kiss is more than a simple touch of lips. You kiss maidens and deadbeats alike with unmatched affection and faced death and rebirth through the kiss of the banshee queen. Lucky are those who get to share such an intimate moment with you!"},
	[64] = {name = "Perfect Fool", grade = 1, points = 3, description = "You love playing jokes on others and tricking them into looking a little silly. Wagging tongues say that the moment of realisation in your victims' eyes is the reward you feed on, but you're probably just kidding and having fun with them... right??"},
	[65] = {name = "Poet Laureate", grade = 1, points = 2, secret = true, description = "Poems, verses, songs and rhymes you've recited many times. You have passed the cryptic door, raconteur of ancient lore. Even elves you've left impressed, so it seems you're truly blessed."},
	[66] = {name = "Polisher", grade = 2, points = 4, secret = true, description = "If you see a rusty item, you can't resist polishing it. There's always a little flask of rust remover in your inventory - who knows, there might be a golden armor beneath all that dirt!"},
	[67] = {name = "Potion Addict", grade = 2, points = 4, secret = true, description = "Your local magic trader considers you one of his best customers - you usually buy large stocks of potions so you won't wake up in the middle of the night craving for more. Yet, you always seem to run out of them too fast. Cheers!"},	
	[68] = {name = "Quick as a Turtle", grade = 1, points = 2, secret = true, description = "There... is... simply... no... better... way - than to travel on the back of a turtle. At least you get to enjoy the beautiful surroundings of Laguna."},
	[69] = {name = "Razing!", grade = 3, points = 7, secret = true, description = "People with sharp canine teeth better beware of you, especially at nighttime, or they might find a stake between their ribs. You're a merciless vampire hunter and have gathered numerous tokens as proof."},
	[70] = {name = "Recognised Trader", grade = 1, points = 3, description = "You're a talented merchant who's able to handle wares with care, finds good offers and digs up rares every now and then. Never late to complete an order, you're a reliable trader - at least in Rashid's eyes."},	
	[71] = {name = "Rockstar", grade = 1, points = 3, secret = true, description = "Music just comes to you naturally. You feel comfortable on any stage, at any time, and secretly hope that someday you will be able to defeat your foes by playing music only. Rock on!"},
	[72] = {name = "Ruthless", grade = 2, points = 5, description = "You've touched all thrones of The Ruthless Seven and absorbed some of their evil spirit. It may have changed you forever."},
	[73] = {name = "Scrapper", grade = 1, points = 3, description = "You put out the Spirit of Fire's flames in the arena of Svargrond. Arena fights are for you - fair, square, with simple rules and one-on-one battles."},
	[74] = {name = "Sea Scout", grade = 1, points = 2, description = "Not even the hostile underwater environment stops you from doing your duty for the Explorer Society. Scouting the Quara realm is a piece of cake for you."},
	[75] = {name = "Secret Agent", grade = 1, points = 1, description = "Pack your spy gear and get ready for some dangerous missions in service of a secret agency. You've shown you want to - but can you really do it? Time will tell."},
	[76] = {name = "Shell Seeker", grade = 1, points = 3, secret = true, description = "You found a hundred beautiful pearls in large sea shells. By now that necklace should be finished - and hopefully you didn't get your fingers squeezed too often during the process."},
	[77] = {name = "Ship's Kobold", grade = 2, points = 4, secret = true, description = "You've probably never gotten seasick in your life - you love spending your free time on the ocean and covered quite a lot of miles with ships. Aren't you glad you didn't have to swim all that?"},
	[78] = {name = "Steampunked", grade = 1, points = 2, secret = true, description = "Travelling with the dwarven steamboats through the underground rivers is your preferred way of crossing the lands. No pesky seagulls, and good beer on board!"},
	[79] = {name = "Superstitious", grade = 1, points = 2, secret = true, description = "Fortune tellers and horoscopes guide you through your life. And you probably wouldn't dare going on a big game hunt without your trusty voodoo skull giving you his approval for the day."},
	[80] = {name = "Talented Dancer", grade = 1, points = 1, description = "You're a lord or lady of the dance - and not afraid to use your skills to impress tribal gods. One step to the left, one jump to the right, twist and shout!"},
	[81] = {name = "Territorial", grade = 1, points = 1, secret = true, description = "Your map is your friend - always in your back pocket and covered with countless marks of interesting and useful locations. One could say that you might be lost without it - but luckily there's no way to take it from you."},
	[82] = {name = "The Milkman", grade = 1, points = 2, description = "Who's the milkman? You are!"},
	[83] = {name = "Top AVIN Agent", grade = 2, points = 4, description = "You've proven yourself as a worthy member of the 'family' and successfully carried out numerous spy missions for your 'uncle' to support the Venorean traders and their goals."},
	[84] = {name = "Top CGB Agent", grade = 2, points = 4, description = "Girl power! Whether you're female or not, you've proven absolute loyalty and the willingness to put your life at stake for the girls brigade of Carlin."},
	[85] = {name = "Top TBI Agent", grade = 2, points = 4, description = "Conspiracies and open secrets are your daily bread. You've shown loyalty to the Thaian crown through your courage when facing enemies and completing spy missions. You're an excellent field agent of the TBI."},
	[86] = {name = "Turncoat", grade = 2, points = 4, secret = true, description = "You served Yalahar - but you didn't seem so sure whom to believe on the way. Both Azerus and Palimuth had good reasons for their actions, and thus you followed your gut instinct in the end, even if you helped either of them. May Yalahar prosper!"},
	[87] = {name = "Vanity", grade = 1, points = 3, secret = true, description = "Aren't you just perfectly, wonderfully, beautifully gorgeous? You can't pass a mirror without admiring your looks. Or maybe doing a quick check whether something's stuck in your teeth, perhaps?"},
	[88] = {name = "Vive la Resistance", grade = 1, points = 2, description = "You've always been a rebel - admit it! Supplying prisoners, caring for outcasts, stealing from the rich and giving to the poor - no wait, that was another story."},
	[89] = {name = "Warlord of Svargrond", grade = 2, points = 5, description = "You sent the Obliverator into oblivion in the arena of Svargrond and defeated nine other dangerous enemies on the way. All hail the Warlord of Svargrond!"},
	[90] = {name = "Waverider", grade = 1, points = 2, secret = true, description = "One thing's for sure: You definitely love swimming. Hanging out on the beach with your friends, having ice cream and playing beach ball is splashingly good fun!"},
	[91] = {name = "Wayfarer", grade = 1, points = 3, secret = true, description = "Dragon dreams are golden."},
	[92] = {name = "Worm Whacker", grade = 1, points = 1, secret = true, description = "Weehee! Whack those worms! You sure know how to handle a big hammer."}
}

ACHIEVEMENT_FIRST = 1
ACHIEVEMENT_LAST = #achievements

function getAchievementInfoById(id)
	for k, v in pairs(achievements) do
		if k == id then
			local t = {}
			t.id = k
			t.actionStorage = ACHIEVEMENTS_ACTION_BASE + k
			for inf, it in pairs(v) do
				t[inf] = it
			end
			return t
		end
	end
	return false
end

function getAchievementInfoByName(name)
	for k, v in pairs(achievements) do
		if v.name:lower() == name:lower() then
			local t = {}
			t.id = k
			t.actionStorage = ACHIEVEMENTS_ACTION_BASE + k
			for inf, it in pairs(v) do
				t[inf] = it
			end
			return t
		end
	end
	return false
end

function getSecretAchievements()
	local t = {}
	for k, v in pairs(achievements) do
		if v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function getPublicAchievements()
	local t = {}
	for k, v in pairs(achivements) do
		if not v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function getAchievements()
	return achievements
end

function Player.hasAchievement(self, ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	return self:getStorageValue(ACHIEVEMENTS_BASE + achievement.id) > 0
end

function Player.getAchievements(self)
	local t = {}
	for k = 1, #achievements do
		if self:hasAchievement(k) then
			t[#t + 1] = k
		end
	end
	return t
end

function Player.addAchievement(self, ach, denyMsg)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	if not self:hasAchievement(achievement.id) then
		self:setStorageValue(ACHIEVEMENTS_BASE + achievement.id, 1)
		if not denyMsg then
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You earned the achievement \"" .. achievement.name .. "\".")
		end
	end
	return true
end

function Player.removeAchievement(self, ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	if self:hasAchievement(achievement.id) then
		self:setStorageValue(ACHIEVEMENTS_BASE + achievement.id, -1)
	end
	return true
end

function Player.addAllAchievements(self, denyMsg)
	for i = ACHIEVEMENT_FIRST, ACHIEVEMENT_LAST do
		self:addAchievement(i, denyMsg)
	end
	return true
end

function Player.removeAllAchievements(self)
	for k = 1, #achievements do
		if self:hasAchievement(k) then
			self:removeAchievement(k)
		end
	end
	return true
end

function Player.getSecretAchievements(self)
	local t = {}
	for k, v in pairs(achievements) do
		if self:hasAchievement(k) and v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function Player.getPublicAchievements(self)
	local t = {}
	for k, v in pairs(achievements) do
		if self:hasAchievement(k) and not v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function Player.getAchievementPoints(self)
	local points = 0
	local list = self:getAchievements()
	if #list > 0 then --has achievements
		for i = 1, #list do
			local a = getAchievementInfoById(list[i])
			if a.points > 0 then --avoid achievements with unknow points
				points = points + a.points
			end
		end
	end
	return points
end

function Player.addAchievementProgress(self, ach, value)
	local achievement = isNumber(ach) and getAchievementInfoById(ach) or getAchievementInfoByName(ach)
	if not achievement then
		print('[!] -> Invalid achievement "' .. ach .. '".')
		return true
	end

	local storage = ACHIEVEMENTS_ACTION_BASE + achievement.id
	local progress = self:getStorageValue(storage)
	if progress < value then
		self:setStorageValue(storage, math.max(1, progress) + 1)
	elseif progress == value then
		self:setStorageValue(storage, value + 1)
		self:addAchievement(achievement.id)
	end
	return true
end
