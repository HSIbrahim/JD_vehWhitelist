local steamid = nil
RegisterNetEvent('getSteamID')
AddEventHandler('getSteamID', function(steam)
	steamid = steam
end)

function ownedVehicle(veh)
	local model = GetEntityModel(veh)
	for i = 1, #Config.lockedVehicles do
		local model2 = GetHashKey(Config.lockedVehicles[i])
		if model == model2 then
			if Config.purchased['' .. steamid .. ''] ~= nil then
				for ii = 1, #Config.purchased[steamid] do
					if GetHashKey(Config.purchased[steamid][ii]) == model then
						return false
					end
				end
				return true
			else
				return true
			end
		end
	end
	return false
end

Citizen.CreateThread(function()
  while true do
	Citizen.Wait(500)
	local Faxped = GetPlayerPed(-1)
	local veh = nil

	if IsPedInAnyVehicle(Faxped, false) then
		veh = GetVehiclePedIsUsing(Faxped)
		VehHash = GetEntityModel(veh)
		VehName = GetDisplayNameFromVehicleModel(VehHash)
		VehNameText = GetLabelText(VehName)
	else
		veh = GetVehiclePedIsTryingToEnter(Faxped)
		VehHash = GetEntityModel(veh)
		VehName = GetDisplayNameFromVehicleModel(VehHash)
		VehNameText = GetLabelText(VehName)
	end

	if DoesEntityExist(veh) then
		if ownedVehicle(veh) then
			if GetPedInVehicleSeat(veh, -1) == Faxped then
				ShowInfo("~r~~h~Restricted Vehicle.~h~~s~ This vehicle is restricted. If incorrect make report on Forums.")
				--exports.JD_logs:discord('**'.. GetPlayerName(PlayerId()) ..'** tried to get in a `'.. VehNameText ..'`', '1752220', 'vehicle') -- Export to JD_logs (https://github.com/JokeDevil/JD_logs)
				if Config.DeleteVehilce then
				SetEntityAsMissionEntity(veh, true, true)
				DeleteVehicle(veh)
				end
				ClearPedTasksImmediately(Faxped)
			end
		end
	end
  end
end)

Citizen.CreateThread(function()
	TriggerServerEvent('sendSteamID')
end)

Citizen.CreateThread(function()
	Wait(400)
	if Config.purchased['' .. steamid .. ''] ~= nil then
		ShowInfo("Thank you for supporting ~o~Innovation Roleplay~s~. Your private vehicles have been ~g~loaded~s~.")
	end
end)

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, false)
end
