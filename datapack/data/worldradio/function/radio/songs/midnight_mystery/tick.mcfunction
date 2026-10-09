# Song: Midnight Mystery - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_midnightmy,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_midnightmy += speed nbs_midnightmy
scoreboard players operation #radio nbs_midnightmy += speed nbs_midnightmy

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_midnightmy,tag=!worldradio.local_zone] at @s run function worldradio:songs/midnight_mystery/tree/0_4095

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_midnightmy,tag=!worldradio.local_zone,limit=1] run scoreboard players operation #radio nbs_midnightmy_t = @s nbs_midnightmy_t

execute unless entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_midnightmy,tag=!worldradio.local_zone] run scoreboard players set #radio_has_song worldradio.data 0
execute if score #radio nbs_midnightmy_t matches 2242.. run scoreboard players set #radio_has_song worldradio.data 0
