 # JD_vehWhitelist
 Vehicle Whitelist for FXServer

 ### Requirements
 - FiveM FXServer

 ### Features
 - Add vehicles to a player's SteamHEX
 - Delete spawned Vehicle (changeable in config)

 ## Download & Installation

 - Download the files
 - Put it in the server resource directory

 ### Installation
 - Add this to your `server.cfg`
 ```
 ensure JD_vehWhitelist
 ```

 ### Add people to Whitelist
 open Config.lua
 Add the SteamHEX of people on a new line to  add them to the list
 ```
 ['steam:123456789123456'] = lockedVehicles,						-- Give Access to All Locked Vehicles   ### Player 1
 ['steam:123456789123456'] = {'apc'},							      -- Give Access to Single Vehicles       ### Player 2
 ['steam:123456789123456'] = {'apc'},       						-- Give Access to Single Vehicles       ### Player 3
 ['steam:123456789123456'] = {'apc'},							      -- Give Access to Single Vehicles       ### Player 4
 ```


 ### My Discord: https://discord.gg/m4BvmkG
