ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent("explore_esx:addMoney")
AddEventHandler("explore_esx:addMoney", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(math.random(10, 40) ) -- Fizetés event
end)