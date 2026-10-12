# Executed as the clicking player (@s) at the button location
# Find the placed tower with gg.tower_id == #btn_tid
tag @e[type=item_display,tag=gg_tower_placed] remove gg_target_tower
execute as @e[type=item_display,tag=gg_tower_placed,distance=..5] if score @s gg.tower_id = #btn_tid gg.tower_id run tag @s add gg_target_tower

execute unless entity @e[type=item_display,tag=gg_target_tower] run return 0

# Refund the tower's sell value to the player's candy score (coins)
execute store result score #refund coins run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_sell
scoreboard players operation @s coins += #refund coins

# Play coin chime & show actionbar notification
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.9 1.4
execute store result storage gourd_guard:tower macro.sell int 1 run scoreboard players get #refund coins
function gourd_guard:tower/action/notify_sell with storage gourd_guard:tower macro
particle minecraft:wax_off ~ ~-1.5 ~ 0.4 0.4 0.4 0.1 12

# Remove the tower model and its interaction buttons
function gourd_guard:tower/action/cleanup_target_tower
