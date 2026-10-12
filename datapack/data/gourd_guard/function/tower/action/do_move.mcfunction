# Executed as the clicking player (@s) at the button location
# Find the placed tower with gg.tower_id == #btn_tid
tag @e[type=item_display,tag=gg_tower_placed] remove gg_target_tower
execute as @e[type=item_display,tag=gg_tower_placed,distance=..5] if score @s gg.tower_id = #btn_tid gg.tower_id run tag @s add gg_target_tower

execute unless entity @e[type=item_display,tag=gg_target_tower] run return 0

# Get tower type and give the matching tower item back to the player
execute store result score #move_type gg.tower_type run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_type
execute if score #move_type gg.tower_type matches 1 run function gourd_guard:tower/give/firework_cannon

# Play pickup sound & message
playsound minecraft:entity.item.pickup master @s ~ ~ ~ 0.8 1.2
title @s actionbar {"text":"Picked up tower to move!","color":"aqua"}

# Remove the tower model and its interaction buttons
function gourd_guard:tower/action/cleanup_target_tower
