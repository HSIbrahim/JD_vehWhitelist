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
		for i2 = 1, #Config.lockedVehicles2 do
		local model3 = GetHashKey(Config.lockedVehicles2[i2])
		if model == model3 then
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
		for i3 = 1, #Config.lockedVehicles3 do
		local model4 = GetHashKey(Config.lockedVehicles3[i3])
		if model == model4 then
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
		for i4 = 1, #Config.lockedVehicles4 do
		local model5 = GetHashKey(Config.lockedVehicles4[i4])
		if model == model5 then
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
		for i5 = 1, #Config.lockedVehicles5 do
		local model6 = GetHashKey(Config.lockedVehicles5[i5])
		if model == model6 then
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
				ShowInfo(Config.alert)
				if Config.JD_logs then
				exports.JD_logs:discord('**'.. GetPlayerName(PlayerId()) ..'** tried to get in a `'.. VehNameText ..'`', Config.JD_Logs_color, Config.JD_Logs_channel) -- Export to JD_logs
				end
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
		ShowInfo(Config.join)
	end
end)

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, false)
end
