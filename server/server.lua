RegisterNetEvent('sendSteamID')
AddEventHandler('sendSteamID', function()
    TriggerClientEvent('getSteamID', source, GetPlayerIdentifiers(source)[1])
end)