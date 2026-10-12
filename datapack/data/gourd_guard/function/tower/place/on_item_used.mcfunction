# Executed as & at the spawned armor_stand entity when a player right-clicks with the tower item
scoreboard players set #spawn_type gg.tower_type 1
execute if entity @s[tag=gg_tower_spawn_type_1] run scoreboard players set #spawn_type gg.tower_type 1

# Also check if the armor stand itself was placed directly on top of black_glazed_terracotta
scoreboard players set #direct_terracotta math 0
execute if block ~ ~-1 ~ minecraft:black_glazed_terracotta unless entity @e[type=item_display,tag=gg_tower_placed,distance=..1.5] run scoreboard players set #direct_terracotta math 1
execute if block ~ ~ ~ minecraft:black_glazed_terracotta unless entity @e[type=item_display,tag=gg_tower_placed,distance=..1.5] run scoreboard players set #direct_terracotta math 1

# Find the nearest player within 7 blocks who just used this item
execute as @p[distance=..7] run function gourd_guard:tower/place/try_place_for_player

# Always remove the temporary armor_stand spawned by the item
kill @s
