# WorldRadio - Tick Local Jukebox Song Playback
# Song 1 - Bat Cave
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},tag=nbs_batcave] run scoreboard players operation @s nbs_batcave += speed nbs_batcave
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},tag=nbs_batcave] at @s run function worldradio:songs/bat_cave/tree/0_2047
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_batcave] run scoreboard players operation @s nbs_batcave += speed nbs_batcave
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_batcave] at @s run function worldradio:songs/bat_cave/tree/0_2047
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},tag=!nbs_batcave,tag=!worldradio.busy] run function worldradio:jukebox/sequences/start_next_sequence

# Song 2 - Creaking Tree
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},tag=nbs_creakingtr] run scoreboard players operation @s nbs_creakingtr += speed nbs_creakingtr
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},tag=nbs_creakingtr] at @s run function worldradio:songs/creaking_tree/tree/0_2047
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_creakingtr] run scoreboard players operation @s nbs_creakingtr += speed nbs_creakingtr
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_creakingtr] at @s run function worldradio:songs/creaking_tree/tree/0_2047
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},tag=!nbs_creakingtr,tag=!worldradio.busy] run function worldradio:jukebox/sequences/start_next_sequence

# Song 3 - Ghost Giggles
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=3},tag=nbs_ghostgiggl] run scoreboard players operation @s nbs_ghostgiggl += speed nbs_ghostgiggl
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=3},tag=nbs_ghostgiggl] at @s run function worldradio:songs/ghost_giggles/tree/0_4095
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_ghostgiggl] run scoreboard players operation @s nbs_ghostgiggl += speed nbs_ghostgiggl
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_ghostgiggl] at @s run function worldradio:songs/ghost_giggles/tree/0_4095
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=3},tag=!nbs_ghostgiggl,tag=!worldradio.busy] run function worldradio:jukebox/sequences/start_next_sequence

# Song 4 - Gourd Dance
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=4},tag=nbs_gourddance] run scoreboard players operation @s nbs_gourddance += speed nbs_gourddance
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=4},tag=nbs_gourddance] at @s run function worldradio:songs/gourd_dance/tree/0_4095
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_gourddance] run scoreboard players operation @s nbs_gourddance += speed nbs_gourddance
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_gourddance] at @s run function worldradio:songs/gourd_dance/tree/0_4095
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=4},tag=!nbs_gourddance,tag=!worldradio.busy] run function worldradio:jukebox/sequences/start_next_sequence

# Song 5 - Midnight Mystery
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=5},tag=nbs_midnightmy] run scoreboard players operation @s nbs_midnightmy += speed nbs_midnightmy
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=5},tag=nbs_midnightmy] at @s run function worldradio:songs/midnight_mystery/tree/0_4095
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_midnightmy] run scoreboard players operation @s nbs_midnightmy += speed nbs_midnightmy
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_midnightmy] at @s run function worldradio:songs/midnight_mystery/tree/0_4095
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=5},tag=!nbs_midnightmy,tag=!worldradio.busy] run function worldradio:jukebox/sequences/start_next_sequence

# Song 6 - Night Fade
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=6},tag=nbs_nightfade] run scoreboard players operation @s nbs_nightfade += speed nbs_nightfade
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=6},tag=nbs_nightfade] at @s run function worldradio:songs/night_fade/tree/0_4095
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_nightfade] run scoreboard players operation @s nbs_nightfade += speed nbs_nightfade
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_nightfade] at @s run function worldradio:songs/night_fade/tree/0_4095
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=6},tag=!nbs_nightfade,tag=!worldradio.busy] run function worldradio:jukebox/sequences/start_next_sequence
