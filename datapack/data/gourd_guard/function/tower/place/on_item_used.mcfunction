# Fallback handler if an armor_stand entity was directly spawned
scoreboard players set #spawn_type gg.tower_type 1
execute if entity @s[tag=gg_tower_spawn_type_1] run scoreboard players set #spawn_type gg.tower_type 1
execute if entity @s[tag=gg_tower_spawn_type_2] run scoreboard players set #spawn_type gg.tower_type 2
execute if entity @s[tag=gg_tower_spawn_type_3] run scoreboard players set #spawn_type gg.tower_type 3
execute if entity @s[tag=gg_tower_spawn_type_4] run scoreboard players set #spawn_type gg.tower_type 4
execute if entity @s[tag=gg_tower_spawn_type_5] run scoreboard players set #spawn_type gg.tower_type 5

# Refresh the nearest player's raycast & 2x2 platform check at the exact moment of right-click
execute as @p[distance=..7] at @s run scoreboard players operation @s gg.tower_hold = #spawn_type gg.tower_type
execute as @p[distance=..7] at @s run function gourd_guard:tower/preview/update_player

# Attempt placement for that player
execute as @p[distance=..7] at @s run function gourd_guard:tower/place/try_place_for_player

# Always remove the temporary armor_stand spawned by the item
kill @s
