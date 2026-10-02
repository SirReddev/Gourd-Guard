# WorldRadio - Summon Boombox & Auto-Sync
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

execute rotated ~ 0 run function aj:worldradio_boombox/summon {args: {}}
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,limit=1] worldradio.device 1
