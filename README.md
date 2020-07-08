 # JD_vehWhitelist
 Vehicle Whitelist for FXServer
 <h4 align="center">
	<a href="https://github.com/JokeDevil/JD_vehWhitelist/releases/latest" title=""><img alt="Licence" src="https://img.shields.io/github/release/JokeDevil/JD_vehWhitelist.svg"></a>
	<a href="LICENSE" title=""><img alt="Licence" src="https://img.shields.io/github/license/JokeDevil/JD_vehWhitelist.svg"></a>
	<a href="https://discord.gg/m4BvmkG" title=""><img alt="Discord Status" src="https://discordapp.com/api/guilds/721339695199682611/widget.png"></a>
</h4>

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
 ['steam:123456789123456'] = lockedVehicles, -- Give Access to All Locked Vehicles   ### Player 1
 ['steam:123456789123456'] = {'apc'},        -- Give Access to Single Vehicles       ### Player 2
 ['steam:123456789123456'] = {'apc'},        -- Give Access to Single Vehicles       ### Player 3
 ['steam:123456789123456'] = {'apc'},        -- Give Access to Single Vehicles       ### Player 4
 ```


 ### My Discord: https://discord.gg/m4BvmkG
