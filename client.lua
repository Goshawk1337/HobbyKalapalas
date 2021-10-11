ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local working = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(PlayerPedId())
        local distance = Vdist(pedCoords.x, pedCoords.y, pedCoords.z, vector3(-155.9, -1029.4, 27.3) )

            if distance < 2.0 and not working then
                DrawMarker(20, -155.9, -1029.4, 27.3, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 0, 128, 0, 100, false, true, 2, false, nil, false)
            end
            if  IsControlJustPressed(0, 86) then
                if distance < 1.0 then
                TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_HAMMERING", -1, "enter" )
                Citizen.Wait(2000)
                ClearPedTasks(GetPlayerPed(-1)) 
                    TriggerServerEvent('explore_esx:addMoney')

            end
        end 
    end
end)




        --blip
        local blips = {
                    --blip nev    szin melyik legyen    kordik x,y,z
            {title="Epitkezes" ,colour=5, id=22, x = -155.9, y = -1029.4, z = 27.3}
         }
       Citizen.CreateThread(function()
       
           for _, info in pairs(blips) do
             info.blip = AddBlipForCoord(info.x, info.y, info.z)
             SetBlipSprite(info.blip, info.id)
             SetBlipDisplay(info.blip, 2)
             SetBlipScale(info.blip, 1.0)
             SetBlipColour(info.blip, info.colour)
             SetBlipAsShortRange(info.blip, true)
             BeginTextCommandSetBlipName("STRING")
             AddTextComponentString(info.title)
             EndTextCommandSetBlipName(info.blip)
           end
       end)