# Consume 1 tower item from inventory if the player is in Creative mode (Survival/Adventure already consumed 1 on right-click)
execute if entity @s[gamemode=creative] if score #spawn_type gg.tower_type matches 1 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:1}] 1
execute if entity @s[gamemode=creative] if score #spawn_type gg.tower_type matches 2 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:2}] 1
execute if entity @s[gamemode=creative] if score #spawn_type gg.tower_type matches 3 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:3}] 1
execute if entity @s[gamemode=creative] if score #spawn_type gg.tower_type matches 4 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:4}] 1
execute if entity @s[gamemode=creative] if score #spawn_type gg.tower_type matches 5 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:5}] 1

# Locate this player's snapped preview hologram and spawn the real tower there!
tag @e[type=item_display,tag=gg_tower_preview] remove gg_place_target
execute as @e[type=item_display,tag=gg_tower_preview] if score @s gg.tower_pid = #cur_pid gg.tower_pid run tag @s add gg_place_target

execute at @e[type=item_display,tag=gg_place_target,limit=1] run function gourd_guard:tower/place/spawn_tower

# Remove the preview hologram now that the tower is placed
execute as @e[type=item_display,tag=gg_place_target] run function gourd_guard:tower/preview/remove_single
execute as @e[type=interaction,tag=gg_tower_place_btn] if score @s gg.tower_pid = #cur_pid gg.tower_pid run kill @s
scoreboard players set @s gg.tower_valid 0
scoreboard players set @s gg.tower_hold 0
