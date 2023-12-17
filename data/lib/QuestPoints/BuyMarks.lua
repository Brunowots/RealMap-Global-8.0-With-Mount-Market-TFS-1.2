dofile('data/lib/QuestPoints/Quest.lua')
dofile('data/lib/QuestPoints/Marks.lua')


function buyMarks(player,msg)
	choiceId = -1
	
	for i = 0, #Quest do			
		if Quest[i].Name:lower() == msg:lower() then
			choiceId = i
		end				
	end
	
	if choiceId == -1 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,"I never heard about that quest: " .. msg .. "."  )  
	else	
		if Quest[choiceId].Price >0 then
				if player:removeMoneyNpc(Quest[choiceId].Price) then				
					--Colocar Marcas del quest
					for i = 0, #Marks do					
						if Marks[i].Quest == Quest[choiceId].Name then
							player:addMapMark(Marks[i].pos, Marks[i].type, Marks[i].description)						
						end		
					end
					
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,"Congratulations you know more about the secrets of tibia!"  )  
					
				else
					--Sin dinero
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,"The price of " .. Quest[choiceId].Name .. " MapMarks are ${" ..Quest[choiceId].Price .. "} gold coins"  )              
				end
			
		else
					--Sin Marcas
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,"Sorry...I dont have MapMarks for the quest: " .. Quest[choiceId].Name .. "."  )  		
		end	
	end	
		
		
	return true
end


