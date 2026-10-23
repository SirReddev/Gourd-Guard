# Upgrade button handler - executed as the clicking player (@s) at button position
# Find target tower by its ID
tag @e[type=item_display,tag=gg_tower_placed] remove gg_target_tower
execute as @e[type=item_display,tag=gg_tower_placed,distance=..8] if score @s gg.tower_id = #btn_tid gg.tower_id run tag @s add gg_target_tower
execute unless entity @e[type=item_display,tag=gg_target_tower] run return 0

# Store current level
execute store result score #up_lvl gg.calc run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_lvl

# Already max level?
execute if score #up_lvl gg.calc matches 5 run return run tellraw @s [{"text":"[Tower] ","color":"red"},{"text":"Already at MAX level!","color":"yellow"}]

# Set upgrade cost based on current level (15/25/40/60)
execute if score #up_lvl gg.calc matches 1 run scoreboard players set #up_cost gg.calc 15
execute if score #up_lvl gg.calc matches 2 run scoreboard players set #up_cost gg.calc 25
execute if score #up_lvl gg.calc matches 3 run scoreboard players set #up_cost gg.calc 40
execute if score #up_lvl gg.calc matches 4 run scoreboard players set #up_cost gg.calc 60

# Not enough candy?
execute unless score @s coins >= #up_cost gg.calc run return run tellraw @s [{"text":"[Tower] ","color":"red"},{"text":"Not enough Candy to upgrade! Cost: ","color":"yellow"},{"score":{"name":"#up_cost","objective":"gg.calc"},"color":"gold"}]

# Deduct candy and perform upgrade
scoreboard players operation @s coins -= #up_cost gg.calc
execute as @n[type=item_display,tag=gg_target_tower] run scoreboard players add @s gg.tower_lvl 1
execute as @n[type=item_display,tag=gg_target_tower] run function gourd_guard:tower/placed/update_stats

# Store new level for message
execute store result score #new_lvl gg.calc run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_lvl

playsound minecraft:block.enchantment_table.use master @s ~ ~ ~ 1.0 1.2
particle minecraft:enchant ~ ~1 ~ 0.4 0.4 0.4 0.5 20
tellraw @s [{"text":"[Tower] ","color":"aqua"},{"text":"Upgraded to level ","color":"yellow"},{"score":{"name":"#new_lvl","objective":"gg.calc"},"color":"gold"},{"text":"! Cost: ","color":"yellow"},{"score":{"name":"#up_cost","objective":"gg.calc"},"color":"dark_green"},{"text":" candy.","color":"yellow"}]

tag @e[tag=gg_target_tower] remove gg_target_tower
