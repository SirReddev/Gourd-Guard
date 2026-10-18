# WorldRadio - Set Jukebox Mode to Local
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

scoreboard players set #jukebox_mode worldradio.data 1
scoreboard players set #jukebox_radius worldradio.data 20
execute store result storage worldradio:settings radius int 1 run scoreboard players get #jukebox_radius worldradio.data
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Jukebox Mode: ","color":"gray"},{"text":"Local (20-Block Zone)","color":"gold","bold":true}]
