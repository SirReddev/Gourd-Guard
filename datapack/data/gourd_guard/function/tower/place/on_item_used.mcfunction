# Fallback handler if an armor_stand entity was directly spawned
scoreboard players set #spawn_type gg.tower_type 1
execute if entity @s[tag=gg_tower_spawn_type_1] run scoreboard players set #spawn_type gg.tower_type 1
execute if entity @s[tag=gg_tower_spawn_type_2] run scoreboard players set #spawn_type gg.tower_type 2
execute if entity @s[tag=gg_tower_spawn_type_3] run scoreboard players set #spawn_type gg.tower_type 3
execute if entity @s[tag=gg_tower_spawn_type_4] run scoreboard players set #spawn_type gg.tower_type 4
execute if entity @s[tag=gg_tower_spawn_type_5] run scoreboard players set #spawn_type gg.tower_type 5
execute if entity @s[tag=gg_tower_spawn_type_6] run scoreboard players set #spawn_type gg.tower_type 6
execute if entity @s[tag=gg_tower_spawn_type_7] run scoreboard players set #spawn_type gg.tower_type 7
execute if entity @s[tag=gg_tower_spawn_type_8] run scoreboard players set #spawn_type gg.tower_type 8
execute if entity @s[tag=gg_tower_spawn_type_9] run scoreboard players set #spawn_type gg.tower_type 9
execute if entity @s[tag=gg_tower_spawn_type_10] run scoreboard players set #spawn_type gg.tower_type 10
execute if entity @s[tag=gg_tower_spawn_type_11] run scoreboard players set #spawn_type gg.tower_type 11

# Carry an item's upgrade level through placement and invalid-placement restoration.
scoreboard players set #spawn_lvl gg.tower_lvl 1
execute if entity @s[tag=gg_tower_level_2] run scoreboard players set #spawn_lvl gg.tower_lvl 2
execute if entity @s[tag=gg_tower_level_3] run scoreboard players set #spawn_lvl gg.tower_lvl 3
execute if entity @s[tag=gg_tower_level_4] run scoreboard players set #spawn_lvl gg.tower_lvl 4
execute if entity @s[tag=gg_tower_level_5] run scoreboard players set #spawn_lvl gg.tower_lvl 5
execute store result storage gourd_guard:tower_restore lvl int 1 run scoreboard players get #spawn_lvl gg.tower_lvl

# Refresh the nearest player's raycast & 2x2 platform check at the exact moment of right-click
execute as @p[distance=..7] at @s run scoreboard players operation @s gg.tower_hold = #spawn_type gg.tower_type
execute as @p[distance=..7] at @s run function gourd_guard:tower/preview/update_player

# Attempt placement for that player
execute as @p[distance=..7] at @s run function gourd_guard:tower/place/try_place_for_player

# Always remove the temporary armor_stand spawned by the item
kill @s
