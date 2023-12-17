
function onUse(cid, item, frompos, item2, topos)
item1 = {x=32160, y=32163, z=8, stackpos=2}
get1item = getThingfromPos(item1)
item2 = {x=32154, y=32222, z=8, stackpos=2}
get2item = getThingfromPos(item2)
item3 = {x=32052, y=32233, z=8, stackpos=2}
get3item = getThingfromPos(item3)
item4 = {x=31984, y=32213, z=8, stackpos=2}
get4item = getThingfromPos(item4)
item5 = {x=32015, y=32202, z=8, stackpos=2}
get5item = getThingfromPos(item5)
item6 = {x=32168, y=32139, z=9, stackpos=2}
get6item = getThingfromPos(item6)
item7 = {x=32002, y=32116, z=8, stackpos=2}
get7item = getThingfromPos(item7)
item8 = {x=32127, y=32070, z=11, stackpos=2}
get8item = getThingfromPos(item8)

if item.itemid == 1945 and getPlayerVocation(cid) == 9 then
if getPlayerStorageValue(cid,7034) <= 0 then
	if get1item.itemid == Cflegionhelmet then
		if get2item.itemid == Cfchainarmor then
			if get3item.itemid == Cfstuddedlegs then
				if get4item.itemid == Cfleatherboots then
					if get5item.itemid == 2006 then
						if get6item.itemid == Cfcarlinsword then
							if get7item.itemid == Cfsilveramulet then
								if get8item.itemid == Cfcoppershield then
								GOLDENKEY = doPlayerAddItem(cid, 2091)
								doSetItemActionId(GOLDENKEY, 2009)
								doSetItemSpecialDescription(GOLDENKEY, "(Key: 1037)")
								doPlayerSendTextMessage(cid,19,"You have found a golden key.")
								doSendMagicEffect(getPlayerPosition(cid), 19)
								doSendMagicEffect(getPlayerPosition(cid), 13)
								setPlayerStorageValue(cid,7034,1)
								doTransformItem(item.uid,item.itemid+1)	
								doRemoveItem(get1item.uid,1)
								doRemoveItem(get2item.uid,1)
								doRemoveItem(get3item.uid,1)
								doRemoveItem(get4item.uid,1)
								doRemoveItem(get5item.uid,1)
								doRemoveItem(get6item.uid,1)
								doRemoveItem(get7item.uid,1)
								doRemoveItem(get8item.uid,1)
								else
								doPlayerSendCancel(cid,"Copper Shield is missing.")
								end
							else
							doPlayerSendCancel(cid,"Silver amulet is missing.")
							end
						else
						doPlayerSendCancel(cid,"Carlin sword is missing.")
						end
					else
					doPlayerSendCancel(cid,"Vial is missing.")
					end
				else
				doPlayerSendCancel(cid,"Leather boots is missing.")
				end
			else
			doPlayerSendCancel(cid,"Studded legs is missing.")
			end
		else
		doPlayerSendCancel(cid,"Chain armor is missing.")
		end
	else
	doPlayerSendCancel(cid,"Legion helmet is missing.")
	end
else
doPlayerSendCancel(cid,"You have already done this part!")
end	

elseif item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Only Rook stayers may pull this switch!")
end
return 1
end
  