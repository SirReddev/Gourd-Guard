# Consume 1 tower item from inventory if the player is in Creative mode
execute if entity @s[gamemode=creative] run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:1}] 1

# Snap directly from the armor_stand position onto the 2x2 black_glazed_terracotta center
scoreboard players set #snapped math 0
execute align xyz positioned ~0.5 ~ ~0.5 if block ~1 ~-1 ~ minecraft:black_glazed_terracotta if block ~ ~-1 ~1 minecraft:black_glazed_terracotta if block ~1 ~-1 ~1 minecraft:black_glazed_terracotta positioned ~0.5 ~ ~0.5 run function gourd_guard:tower/place/spawn_tower_snapped
execute if score #snapped math matches 0 align xyz positioned ~0.5 ~ ~0.5 if block ~-1 ~-1 ~ minecraft:black_glazed_terracotta if block ~ ~-1 ~1 minecraft:black_glazed_terracotta if block ~-1 ~-1 ~1 minecraft:black_glazed_terracotta positioned ~-0.5 ~ ~0.5 run function gourd_guard:tower/place/spawn_tower_snapped
execute if score #snapped math matches 0 align xyz positioned ~0.5 ~ ~0.5 if block ~1 ~-1 ~ minecraft:black_glazed_terracotta if block ~ ~-1 ~-1 minecraft:black_glazed_terracotta if block ~1 ~-1 ~-1 minecraft:black_glazed_terracotta positioned ~0.5 ~ ~-0.5 run function gourd_guard:tower/place/spawn_tower_snapped
execute if score #snapped math matches 0 align xyz positioned ~0.5 ~ ~0.5 if block ~-1 ~-1 ~ minecraft:black_glazed_terracotta if block ~ ~-1 ~-1 minecraft:black_glazed_terracotta if block ~-1 ~-1 ~-1 minecraft:black_glazed_terracotta positioned ~-0.5 ~ ~-0.5 run function gourd_guard:tower/place/spawn_tower_snapped
execute if score #snapped math matches 0 align xyz positioned ~0.5 ~ ~0.5 run function gourd_guard:tower/place/spawn_tower_snapped

# Remove any active preview hologram for this player
execute as @e[type=item_display,tag=gg_tower_preview] if score @s gg.tower_pid = #cur_pid gg.tower_pid run function gourd_guard:tower/preview/remove_single
scoreboard players set @s gg.tower_valid 0
scoreboard players set @s gg.tower_hold 0
