local internet = true 
local keys = {22,37,45,80,140,250,263,310,140,141,257,142,143,24,25,58}

function block()
    Citizen.CreateThread( function()
        while not internet do
            local ped = PlayerPedId()
            for k,v in pairs(keys) do 
                DisableControlAction(0, v, true) 
            end
                DisablePlayerFiring(ped, true) 
            Citizen.Wait(0)
        end
    end)
end

RegisterNUICallback("lock",function(data,cb) 
    if not internet then
        return
    end
    internet = false 
    TriggerEvent('luke_dupe:close') 
    local ped = PlayerPedId()
    FreezeEntityPosition(ped,true) 
    block() 
    cb('ok')
end)

RegisterNUICallback("unlock",function(data,cb) 
    if internet then
        return
    end
    internet = true
    local ped = PlayerPedId()
    FreezeEntityPosition(ped,false)
    cb('ok')
end)


