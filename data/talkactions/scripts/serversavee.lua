function prepareShutdown(minutes)
        if(minutes <= 0) then
                doSetGameState(GAMESTATE_SHUTDOWN)
                return false
        end

        if(minutes == 1) then
                doBroadcastMessage("Server is going down in " .. minutes .. " minute for global save, please log out now!")
        elseif(minutes <= 3) then
                doBroadcastMessage("Server is going down in " .. minutes .. " minutes for global save, please log out.")
        else
                doBroadcastMessage("Server is going down in " .. minutes .. " minutes for global save.")
        end

        shutdownEvent = addEvent(prepareShutdown, 60000, minutes - 1)
        return true
end

function onTime()
    return prepareShutdown(5) -- Quantos minutos pra executar o ServeSave. 
end