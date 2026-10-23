# Stats button handler - executed as the clicking player (@s) at button position
# Find target tower by its ID
tag @e[type=item_display,tag=gg_tower_placed] remove gg_target_tower
execute as @e[type=item_display,tag=gg_tower_placed,distance=..8] if score @s gg.tower_id = #btn_tid gg.tower_id run tag @s add gg_target_tower
execute unless entity @e[type=item_display,tag=gg_target_tower] run return 0

# Store stats from tower
execute store result score #stat_lvl gg.calc run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_lvl
execute store result score #stat_dmg gg.fw_dmg run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_dmg
execute store result score #stat_cd gg.fw_tid run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_max_cd
execute store result score #stat_sell gg.fw_splash run scoreboard players get @n[type=item_display,tag=gg_target_tower] gg.tower_sell

# Set next level upgrade cost (0 if already max)
scoreboard players set #up_cost gg.calc 0
execute if score #stat_lvl gg.calc matches 1 run scoreboard players set #up_cost gg.calc 15
execute if score #stat_lvl gg.calc matches 2 run scoreboard players set #up_cost gg.calc 25
execute if score #stat_lvl gg.calc matches 3 run scoreboard players set #up_cost gg.calc 40
execute if score #stat_lvl gg.calc matches 4 run scoreboard players set #up_cost gg.calc 60

# Display stats in chat
tellraw @s [{"text":"--- [Tower Stats] ---","color":"aqua","bold":true}]
tellraw @s [{"text":"Level: ","color":"gray"},{"score":{"name":"#stat_lvl","objective":"gg.calc"},"color":"gold"},{"text":" | DMG: ","color":"gray"},{"score":{"name":"#stat_dmg","objective":"gg.fw_dmg"},"color":"red"},{"text":" | Cooldown: ","color":"gray"},{"score":{"name":"#stat_cd","objective":"gg.fw_tid"},"color":"aqua"},{"text":"t | Sell: ","color":"gray"},{"score":{"name":"#stat_sell","objective":"gg.fw_splash"},"color":"green"}]
execute if score #stat_lvl gg.calc matches ..4 run tellraw @s [{"text":"Upgrade cost: ","color":"gray"},{"score":{"name":"#up_cost","objective":"gg.calc"},"color":"dark_aqua"},{"text":" candy","color":"gray"}]
execute if score #stat_lvl gg.calc matches 5 run tellraw @s [{"text":"MAX LEVEL","color":"gold","bold":true}]
tellraw @s [{"text":"---------------------","color":"dark_gray"}]

tag @e[tag=gg_target_tower] remove gg_target_tower
