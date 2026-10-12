# Consume 1 tower item from inventory if the player is in Creative mode (Survival/Adventure already consumed 1 on right-click)
execute if entity @s[gamemode=creative] if items entity @s weapon.mainhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:1}] run item modify entity @s weapon.mainhand {function:"minecraft:set_count",count:-1,add:true}
execute if entity @s[gamemode=creative] unless items entity @s weapon.mainhand minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:1}] run clear @s minecraft:armor_stand[minecraft:custom_data~{gg_tower:1b,tower_type:1}] 1

# Locate this player's snapped preview hologram and spawn the real tower there!
tag @e[type=item_display,tag=gg_tower_preview] remove gg_place_target
execute as @e[type=item_display,tag=gg_tower_preview] if score @s gg.tower_pid = #cur_pid gg.tower_pid run tag @s add gg_place_target

execute at @e[type=item_display,tag=gg_place_target,limit=1] run function gourd_guard:tower/place/spawn_tower

# Remove the preview hologram now that the tower is placed
execute as @e[type=item_display,tag=gg_place_target] run function gourd_guard:tower/preview/remove_single
scoreboard players set @s gg.tower_valid 0
scoreboard players set @s gg.tower_hold 0
