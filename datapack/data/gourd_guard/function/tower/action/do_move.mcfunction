# Executed as the clicking player (@s) at the button location
# Find the placed tower with gg.tower_id == #btn_tid
tag @e[type=item_display,tag=gg_tower_placed] remove gg_target_tower
execute as @e[type=item_display,tag=gg_tower_placed,distance=..6] if score @s gg.tower_id = #btn_tid gg.tower_id run tag @s add gg_target_tower

execute unless entity @e[type=item_display,tag=gg_target_tower] run return 0

# Get tower type and give the matching tower armor_stand item back to the player (into active hand slot if empty)
execute store result score #move_type gg.tower_type run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_type
execute store result storage gourd_guard:tower_restore lvl int 1 run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_lvl
execute if score #move_type gg.tower_type matches 1 run function gourd_guard:tower/place/restore_firework_cannon with storage gourd_guard:tower_restore
execute if score #move_type gg.tower_type matches 2 run function gourd_guard:tower/place/restore_copper_golem_launcher with storage gourd_guard:tower_restore
execute if score #move_type gg.tower_type matches 3 run function gourd_guard:tower/place/restore_pillager_convoy with storage gourd_guard:tower_restore
execute if score #move_type gg.tower_type matches 4 run function gourd_guard:tower/place/restore_cauldron_damage with storage gourd_guard:tower_restore
execute if score #move_type gg.tower_type matches 5 run function gourd_guard:tower/place/restore_tesla_coil with storage gourd_guard:tower_restore
execute if score #move_type gg.tower_type matches 6 run function gourd_guard:tower/place/restore_cauldron_poison with storage gourd_guard:tower_restore
execute if score #move_type gg.tower_type matches 7 run function gourd_guard:tower/place/restore_cauldron_slowness with storage gourd_guard:tower_restore
execute if score #move_type gg.tower_type matches 8 run function gourd_guard:tower/place/restore_magic_altar with storage gourd_guard:tower_restore
execute if score #move_type gg.tower_type matches 9 run function gourd_guard:tower/place/restore_scarecrow with storage gourd_guard:tower_restore
execute if score #move_type gg.tower_type matches 10 run function gourd_guard:tower/place/restore_fortune_pillar with storage gourd_guard:tower_restore
execute if score #move_type gg.tower_type matches 11 run function gourd_guard:tower/place/restore_ballista with storage gourd_guard:tower_restore

# Play pickup sound & chat message
playsound minecraft:entity.item.pickup master @s ~ ~ ~ 0.8 1.2
tellraw @s [{"text":"[Tower] ","color":"aqua"},{"text":"Picked up tower, ready to move!","color":"yellow"}]

# Remove the tower model and its interaction buttons
function gourd_guard:tower/action/cleanup_target_tower
