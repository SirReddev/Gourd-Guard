# Song: Ghost Giggles - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_ghostgiggl,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_ghostgiggl += speed nbs_ghostgiggl
scoreboard players operation #radio nbs_ghostgiggl += speed nbs_ghostgiggl

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_ghostgiggl,tag=!worldradio.local_zone] at @s run function worldradio:songs/ghost_giggles/tree/0_4095

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_ghostgiggl,tag=!worldradio.local_zone,limit=1] run scoreboard players operation #radio nbs_ghostgiggl_t = @s nbs_ghostgiggl_t

execute unless entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_ghostgiggl,tag=!worldradio.local_zone] run scoreboard players set #radio_has_song worldradio.data 0
execute if score #radio nbs_ghostgiggl_t matches 2846.. run scoreboard players set #radio_has_song worldradio.data 0
