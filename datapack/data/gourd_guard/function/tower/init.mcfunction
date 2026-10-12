# Gourd Guard Tower System - Scoreboard & Storage Initialization
scoreboard objectives add gg.tower_pid dummy
scoreboard objectives add gg.tower_next_pid dummy
scoreboard objectives add gg.tower_id dummy
scoreboard objectives add gg.tower_next_id dummy
scoreboard objectives add gg.tower_type dummy
scoreboard objectives add gg.tower_lvl dummy
scoreboard objectives add gg.tower_sell dummy
scoreboard objectives add gg.tower_valid dummy
scoreboard objectives add gg.tower_hold dummy

execute unless score #next gg.tower_next_pid matches 1.. run scoreboard players set #next gg.tower_next_pid 1
execute unless score #next gg.tower_next_id matches 1.. run scoreboard players set #next gg.tower_next_id 1
