# Executed as the clicking player (@s) at the button location
# Find the placed tower with gg.tower_id == #btn_tid
tag @e[type=item_display,tag=gg_tower_placed] remove gg_target_tower
execute as @e[type=item_display,tag=gg_tower_placed,distance=..6] if score @s gg.tower_id = #btn_tid gg.tower_id run tag @s add gg_target_tower

execute unless entity @e[type=item_display,tag=gg_target_tower] run return 0

# Refund the tower's base value, regardless of its upgrade level.
execute store result score #sell_type gg.tower_type run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_type
execute if score #sell_type gg.tower_type matches 1 run scoreboard players set #refund coins 10
execute if score #sell_type gg.tower_type matches 2 run scoreboard players set #refund coins 15
execute if score #sell_type gg.tower_type matches 3 run scoreboard players set #refund coins 25
execute if score #sell_type gg.tower_type matches 4 run scoreboard players set #refund coins 16
execute if score #sell_type gg.tower_type matches 5 run scoreboard players set #refund coins 22
execute if score #sell_type gg.tower_type matches 6 run scoreboard players set #refund coins 23
execute if score #sell_type gg.tower_type matches 7 run scoreboard players set #refund coins 20
execute if score #sell_type gg.tower_type matches 8 run scoreboard players set #refund coins 30
execute if score #sell_type gg.tower_type matches 9 run scoreboard players set #refund coins 8
execute if score #sell_type gg.tower_type matches 10 run scoreboard players set #refund coins 20
execute if score #sell_type gg.tower_type matches 11 run scoreboard players set #refund coins 18
scoreboard players operation @a coins += #refund coins

# Play coin chime & show chat notification
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.9 1.4
execute store result storage gourd_guard:tower macro.sell int 1 run scoreboard players get #refund coins
function gourd_guard:tower/action/notify_sell with storage gourd_guard:tower macro
particle minecraft:wax_off ~ ~-1.5 ~ 0.4 0.4 0.4 0.1 12

# Remove the tower model and its interaction buttons
function gourd_guard:tower/action/cleanup_target_tower
