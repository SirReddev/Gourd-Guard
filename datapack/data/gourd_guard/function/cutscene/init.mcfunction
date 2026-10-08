# Cutscene System - Initialization
scoreboard objectives add cs.state dummy
scoreboard objectives add cs.map dummy
scoreboard objectives add cs.node dummy
scoreboard objectives add cs.target dummy
scoreboard objectives add cs.cmp dummy
scoreboard objectives add cs.edit dummy
scoreboard objectives add cs.timer dummy

# Default to map 1 if unset
execute unless score .global map matches 1..5 run scoreboard players set .global map 1
execute unless score CurrentMap cs.edit matches 1.. run scoreboard players set CurrentMap cs.edit 1
execute unless score NextNode cs.edit matches 0.. run scoreboard players set NextNode cs.edit 0
