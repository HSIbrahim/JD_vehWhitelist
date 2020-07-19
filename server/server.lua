RegisterNetEvent('sendSteamID')
AddEventHandler('sendSteamID', function()
    TriggerClientEvent('getSteamID', source, GetPlayerIdentifiers(source)[1])
end)

-- version check
Citizen.CreateThread(
	function()
		local vRaw = LoadResourceFile(GetCurrentResourceName(), 'version.json')
		if vRaw and Config.versionCheck then
			local v = json.decode(vRaw)
			PerformHttpRequest(
				'https://raw.githubusercontent.com/JokeDevil/JD_vehWhitelist/master/version.json',
				function(code, res, headers)
					if code == 200 then
						local rv = json.decode(res)
						if rv.version ~= v.version then
							print(
								([[^1

-------------------------------------------------------
JD_vehWhitelist
UPDATE: %s AVAILABLE
CHANGELOG: %s
-------------------------------------------------------
^0]]):format(
									rv.version,
									rv.changelog
								)
							)
						end
					else
						print('JD_vehWhitelist unable to check version')
					end
				end,
				'GET'
			)
		end
	end
)
