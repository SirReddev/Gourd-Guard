# Remove 1 tower item from the player's inventory (works identically in Adventure, Survival, and Creative mode)
scoreboard players set #spawn_lvl gg.tower_lvl 1
execute if items entity @s weapon.offhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b}] run scoreboard players set #spawn_lvl gg.tower_lvl 1
execute if items entity @s weapon.offhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_lvl:2}] run scoreboard players set #spawn_lvl gg.tower_lvl 2
execute if items entity @s weapon.offhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_lvl:3}] run scoreboard players set #spawn_lvl gg.tower_lvl 3
execute if items entity @s weapon.offhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_lvl:4}] run scoreboard players set #spawn_lvl gg.tower_lvl 4
execute if items entity @s weapon.offhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_lvl:5}] run scoreboard players set #spawn_lvl gg.tower_lvl 5
execute if items entity @s weapon.mainhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b}] run scoreboard players set #spawn_lvl gg.tower_lvl 1
execute if items entity @s weapon.mainhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_lvl:2}] run scoreboard players set #spawn_lvl gg.tower_lvl 2
execute if items entity @s weapon.mainhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_lvl:3}] run scoreboard players set #spawn_lvl gg.tower_lvl 3
execute if items entity @s weapon.mainhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_lvl:4}] run scoreboard players set #spawn_lvl gg.tower_lvl 4
execute if items entity @s weapon.mainhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_lvl:5}] run scoreboard players set #spawn_lvl gg.tower_lvl 5
execute store result storage gourd_guard:tower_restore lvl int 1 run scoreboard players get #spawn_lvl gg.tower_lvl
execute if score #spawn_type gg.tower_type matches 1 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:1}] 1
execute if score #spawn_type gg.tower_type matches 2 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:2}] 1
execute if score #spawn_type gg.tower_type matches 3 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:3}] 1
execute if score #spawn_type gg.tower_type matches 4 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:4}] 1
execute if score #spawn_type gg.tower_type matches 5 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:5}] 1
execute if score #spawn_type gg.tower_type matches 6 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:6}] 1
execute if score #spawn_type gg.tower_type matches 7 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:7}] 1
execute if score #spawn_type gg.tower_type matches 8 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:8}] 1
execute if score #spawn_type gg.tower_type matches 9 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:9}] 1
execute if score #spawn_type gg.tower_type matches 10 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:10}] 1
execute if score #spawn_type gg.tower_type matches 11 run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:11}] 1

# Locate this player's snapped preview hologram and spawn the real tower there!
tag @e[type=item_display,tag=gg_tower_preview] remove gg_place_target
execute as @e[type=item_display,tag=gg_tower_preview] if score @s gg.tower_pid = #cur_pid gg.tower_pid run tag @s add gg_place_target

execute at @e[type=item_display,tag=gg_place_target,limit=1] run function gourd_guard:tower/place/spawn_tower

# Remove the preview hologram and placement hitbox now that the tower is placed
execute as @e[type=item_display,tag=gg_place_target] run function gourd_guard:tower/preview/remove_single
execute as @e[type=interaction,tag=gg_tower_place_btn] if score @s gg.tower_pid = #cur_pid gg.tower_pid run kill @s
scoreboard players set @s gg.tower_valid 0
scoreboard players set @s gg.tower_hold 0
