dofile('data/lib/QuestPoints/Quest.lua')

function ShowModal(player, playerSayCiudad)
	local text = {}
	text[1] = "--- " ..playerSayCiudad .. " --- \n"
	
	
	for i = 0, #Quest do			
		if Quest[i].City:lower() == playerSayCiudad:lower() then
			if player:getStorageValue(Quest[i].Store) >= Quest[i].Qvalue then			
				text[#text+1] = "[OK] - " .. Quest[i].Name ..  "  Pts:" .. Quest[i].Points .. "\n"
			else
				text[#text+1] = "" .. Quest[i].Name .. "\n"
			end	
		end				
	end

	player:showTextDialog(1949, table.concat(text), false)
	return true
end


