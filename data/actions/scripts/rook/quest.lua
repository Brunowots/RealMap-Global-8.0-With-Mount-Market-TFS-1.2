--999--Storage is taken (used to free wand/rod in magic shop)

--7000 - 7999 is reserved storage ids for Rook quests only--

--7001 = Semour Exchange quest, Present and gain legion helmet.
--7002 = Willie Exchange quest, Banana and gain studded shield.
--7003 = Billy Exchange quest, Pan and gain antidote rune.
--7004 = Lee'Delle Exchange quest, Honey Flower and Studded legs.
--7005 = Al Dee Exchange quest, Small axe and gain pick.
--7007 = Amber Exchange quest, Ambers Notebook and gain short sword.
--7027 = Benny Carter quest, help him deal with few missions.
--7028 = Benny Carter quest, Kill rats storage.
--7029 = Benny Carter quest, Kill spiders storage.
--7030 = Benny Carter quest, Kill Aaron.
--7032 = Benny Carter quest, Vocation quest.
--7033 = Benny Carter quest, Minotaur mage switch quest.
--7034 = Golden Key Quest.
--7035 Movement tile for Spike sword (Poison spider cave)
--7036 Movement tile for Spike sword (Rotworm cave)
--7037 Access to the door above Tom's shop
--7041 Spike sword storage for web (given in last door)
function onUse(cid, item, frompos, item2, topos)
-- Ambers Notebook --
if item.uid == 7006 then
	if getPlayerStorageValue(cid,7006) <= 0 then
		if getPlayerFreeCap(cid) <= 10 then
		doPlayerSendTextMessage(cid,22,"You need 10 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a book.")
	AMBERSBOOK = doPlayerAddItem(cid,1955,1)  
	doSetItemText(AMBERSBOOK, "Hardek *\nBozo *\nSam ****\nOswald\nPartos ***\nQuentin *\nTark ***\nHarsky ***\nStutch *\nFerumbras *\nFrodo **\nNoodles ****")
	setPlayerStorageValue(cid,7006,1)
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Letter + Salmon --
elseif item.uid == 7008 then
	if getPlayerStorageValue(cid,7008) <= 0 then
		if getPlayerFreeCap(cid) <= 7 then
		doPlayerSendTextMessage(cid,22,"You need 7 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a letter and some salmon.")
	doPlayerAddItem(cid, Cfletter, 1)
	doPlayerAddItem(cid, Cfsalmon, 2)	
	setPlayerStorageValue(cid,7008,1)
	
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Bear Room Key --
elseif item.uid == 7009 then
	if getPlayerStorageValue(cid,7009) <= 0 then
		if getPlayerFreeCap(cid) <= 7 then
		doPlayerSendTextMessage(cid,22,"You need 7 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a key.")
	BEARROOMKEY = doPlayerAddItem(cid, 2089, 1)
	doSetItemActionId(BEARROOMKEY, 2004)
	doSetItemSpecialDescription(BEARROOMKEY, "(Key: 4601)")
	setPlayerStorageValue(cid,7009,1)
	
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----	
-- Bear Room Chain Armor --
elseif item.uid == 7010 then
	if getPlayerStorageValue(cid,7010) <= 0 then
		if getPlayerFreeCap(cid) <= 100 then
		doPlayerSendTextMessage(cid,22,"You need 100 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a chain armor.")
	doPlayerAddItem(cid, Cfchainarmor, 1)
	setPlayerStorageValue(cid,7010,1)
	
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Bear Room Brass Helmet --
elseif item.uid == 7011 then
	if getPlayerStorageValue(cid,7011) <= 0 then
		if getPlayerFreeCap(cid) <= 27 then
		doPlayerSendTextMessage(cid,22,"You need 27 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a brass helmet.")
	doPlayerAddItem(cid, Cfbrasshelmet, 1)
	setPlayerStorageValue(cid,7011,1)
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Bear Room Bag --
elseif item.uid == 7012 then
	if getPlayerStorageValue(cid,7012) <= 0 then
		if getPlayerFreeCap(cid) <= 27 then
		doPlayerSendTextMessage(cid,22,"You need 27 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a bag.")
	BEARROOMBAG = doPlayerAddItem(cid, 1987, 1)
	doAddContainerItem(BEARROOMBAG, Cfarrow, 12)
	doAddContainerItem(BEARROOMBAG, cfcoppercoin, 40)
	setPlayerStorageValue(cid,7012,1)
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Combat Knife --
elseif item.uid == 7013 then
	if getPlayerStorageValue(cid,7013) <= 0 then
		if getPlayerFreeCap(cid) <= 9 then
		doPlayerSendTextMessage(cid,22,"You need 9 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a combat knife.")
	doPlayerAddItem(cid, Cfcombatknife, 1)
	setPlayerStorageValue(cid,7013,1)
	
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Doublet --
elseif item.uid == 7014 then
	if getPlayerStorageValue(cid,7014) <= 0 then
		if getPlayerFreeCap(cid) <= 25 then
		doPlayerSendTextMessage(cid,22,"You need 25 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a doublet.")
	doPlayerAddItem(cid, Cfdoublet, 1)
	setPlayerStorageValue(cid,7014,1) 
	else
	doPlayerSendTextMessage(cid,22,"The loose board is empty.")
	end
-----
-----
-- Dragon corpse --
elseif item.uid == 7015 then
	if getPlayerStorageValue(cid,7015) <= 0 then
		if getPlayerFreeCap(cid) <= 102 then
		doPlayerSendTextMessage(cid,22,"You need 102 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a bag.")
	DRAGONCORPSE = doPlayerAddItem(cid, 1987, 1)
	doAddContainerItem(DRAGONCORPSE, Cflegionhelmet, 1)
	doAddContainerItem(DRAGONCORPSE, Cfcoppershield, 1)
	setPlayerStorageValue(cid,7015,1) 
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Goblin Temple --
elseif item.uid == 7016 then
	if getPlayerStorageValue(cid,7016) <= 0 then
		if getPlayerFreeCap(cid) <= 32 then
		doPlayerSendTextMessage(cid,22,"You need 32 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a bag.")
	GOBBLINTEMPLEBAG1 = doPlayerAddItem(cid, 1987, 1)
	doAddContainerItem(GOBBLINTEMPLEBAG1, Cfpan, 1)
	doAddContainerItem(GOBBLINTEMPLEBAG1, Cfsmallstone, 5)
	doAddContainerItem(GOBBLINTEMPLEBAG1, cfcoppercoin, 50)
	setPlayerStorageValue(cid,7016,1) 
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Goblin Temple --
elseif item.uid == 7017 then
	if getPlayerStorageValue(cid,7017) <= 0 then
		if getPlayerFreeCap(cid) <= 21 then
		doPlayerSendTextMessage(cid,22,"You need 21 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a bag.")
	GOBBLINTEMPLEBAG2 = doPlayerAddItem(cid, 1987, 1)
	doAddContainerItem(GOBBLINTEMPLEBAG2, 2006, 6)
	doAddContainerItem(GOBBLINTEMPLEBAG2, Cfsnowball, 4)
	doAddContainerItem(GOBBLINTEMPLEBAG2, Cfsandals, 1)
	setPlayerStorageValue(cid,7017,1)
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Katana Key --
elseif item.uid == 7018 then
	if getPlayerStorageValue(cid,7018) <= 0 then
		if getPlayerFreeCap(cid) <= 1 then
		doPlayerSendTextMessage(cid,22,"You need 1 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a key.")
	KATANAKEY = doPlayerAddItem(cid, 2088, 1)
	doSetItemActionId(KATANAKEY, 2007)
	doSetItemSpecialDescription(KATANAKEY, "(Key: 4603)")
	setPlayerStorageValue(cid,7018,1)
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Katana --
elseif item.uid == 7019 then
	if getPlayerStorageValue(cid,7019) <= 0 then
		if getPlayerFreeCap(cid) <= 31 then
		doPlayerSendTextMessage(cid,22,"You need 31 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a katana.")
	doPlayerAddItem(cid, Cfkatana, 1)
	setPlayerStorageValue(cid,7019,1) 
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Carlin Sword --
elseif item.uid == 7020 then
	if getPlayerStorageValue(cid,7020) <= 0 then
		if getPlayerFreeCap(cid) <= 40 then
		doPlayerSendTextMessage(cid,22,"You need 40 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a carlin sword.")
	doPlayerAddItem(cid, Cfcarlinsword, 1)
	setPlayerStorageValue(cid,7020,1) 
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Carlin Sword (Fishing Rod) --
elseif item.uid == 7021 then
	if getPlayerStorageValue(cid,7021) <= 0 then
		if getPlayerFreeCap(cid) <= 9 then
		doPlayerSendTextMessage(cid,22,"You need 9 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a fishing rod.")
	doPlayerAddItem(cid, Cffishingrod, 1)
	setPlayerStorageValue(cid,7021,1)
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Carlin Sword (Bag) --
elseif item.uid == 7022 then
	if getPlayerStorageValue(cid,7022) <= 0 then
		if getPlayerFreeCap(cid) <= 19 then
		doPlayerSendTextMessage(cid,22,"You need 19 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a bag.")
	CARLINSWORDBAG = doPlayerAddItem(cid, 1987, 1)
	doAddContainerItem(CARLINSWORDBAG, Cfpoisonarrow, 4)
	doAddContainerItem(CARLINSWORDBAG, Cfarrow, 10)
	setPlayerStorageValue(cid,7022,1)
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Rapier --
elseif item.uid == 7023 then
	if getPlayerStorageValue(cid,7023) <= 0 then
		if getPlayerFreeCap(cid) <= 15 then
		doPlayerSendTextMessage(cid,22,"You need 15 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a rapier.")
	doPlayerAddItem(cid, Cfrapier, 1)
	setPlayerStorageValue(cid,7023,1) 
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Torch --
elseif item.uid == 7024 then
	if getPlayerStorageValue(cid,7024) <= 0 then
		if getPlayerFreeCap(cid) <= 5 then
		doPlayerSendTextMessage(cid,22,"You need 5 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a torch.")
	doPlayerAddItem(cid, Cftorch, 1)
	setPlayerStorageValue(cid,7024,1)
	
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Present --
elseif item.uid == 7025 then
	if getPlayerStorageValue(cid,7025) <= 0 then
		if getPlayerFreeCap(cid) <= 35 then
		doPlayerSendTextMessage(cid,22,"You need 35 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a backpack.")
	PRESENTBP = doPlayerAddItem(cid, Cfbackpack, 1)
	doAddContainerItem(PRESENTBP, Cfcup, 1)
	doAddContainerItem(PRESENTBP, Cfplate, 1)
	doAddContainerItem(PRESENTBP, Cfjug, 1)
	doAddContainerItem(PRESENTBP, 1990, 1)
	setPlayerStorageValue(cid,7025,1)
	
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Small Axe --
elseif item.uid == 7026 then
	if getPlayerStorageValue(cid,7026) <= 0 then
		if getPlayerFreeCap(cid) <= 20 then
		doPlayerSendTextMessage(cid,22,"You need 20 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a small axe.")
	doPlayerAddItem(cid, Cfsmallaxe, 1)
	setPlayerStorageValue(cid,7026,1)
	
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Banana Palm --
elseif item.uid == 7031 then
	if getPlayerStorageValue(cid,7031) <= 0 then
		if getPlayerFreeCap(cid) <= 2 then
		doPlayerSendTextMessage(cid,22,"You need 2 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a banana.")
	doPlayerAddItem(cid, Cfbanana, 1)
	setPlayerStorageValue(cid,7031,1)
	
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
-- Spike Sword Quest --
-- Key 0013 (Open's the mino mage door)
elseif item.uid == 7038 then
	if getPlayerStorageValue(cid,7038) <= 0 then
		if getPlayerStorageValue(cid,7037) ~= 1 then
		doPlayerSendTextMessage(cid,22,"Something is weird about this stone.")
		return TRUE
		end
		if getPlayerFreeCap(cid) <= 1 then
		doPlayerSendTextMessage(cid,22,"You need 1 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a golden key.")
	SPIKESWORDKEY = doPlayerAddItem(cid, Cfgoldenkey, 1)
	doSetItemActionId(SPIKESWORDKEY, 2043)
	doSetItemSpecialDescription(SPIKESWORDKEY, "(Key: 0013)")	
	setPlayerStorageValue(cid,7038,1)
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-- Key 0015 (Opens Toms bedroom)
elseif item.uid == 7039 then
	if getPlayerStorageValue(cid,7039) <= 0 then
		if getPlayerStorageValue(cid,7037) ~= 1 then
		doPlayerSendTextMessage(cid,22,"Something is weird about this corpse.")
		return TRUE
		end
		if getPlayerFreeCap(cid) <= 1 then
		doPlayerSendTextMessage(cid,22,"You need 1 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a copper key.")
	KEY = doPlayerAddItem(cid, Cfcopperkey, 1)
	doSetItemActionId(KEY, 2045)
	doSetItemSpecialDescription(KEY, "(Key: 0015)")	
	setPlayerStorageValue(cid,7039,1)
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-- Key 0011 (Opens Gobblin switch rooms)
elseif item.uid == 7040 then
	if getPlayerStorageValue(cid,7040) <= 0 then
		if getPlayerStorageValue(cid,7040) ~= 1 then
		doPlayerSendTextMessage(cid,22,"Something is weird about this chest.")
		return TRUE
		end
		if getPlayerFreeCap(cid) <= 1 then
		doPlayerSendTextMessage(cid,22,"You need 1 cap or more to loot this!")
		return TRUE
		end
	doPlayerSendTextMessage(cid,22,"You have found a copper key.")
	KEY = doPlayerAddItem(cid, Cfcopperkey, 1)
	doSetItemActionId(KEY, 2046)
	doSetItemSpecialDescription(KEY, "(Key: 0011)")	
	setPlayerStorageValue(cid,7040,1)
	else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
-----
-----
else	
  return 0
end
return 1
end
