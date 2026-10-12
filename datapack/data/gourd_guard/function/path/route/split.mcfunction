# Pathfinding - Switch route editor to a split option by number (1 or 2)
# Usage: /function gourd_guard:path/route/split {option:1}

scoreboard objectives add path.edit dummy
$scoreboard players set #req_opt path.edit $(option)

execute if score #req_opt path.edit matches 1 run function gourd_guard:path/route/option_1
execute if score #req_opt path.edit matches 2 run function gourd_guard:path/route/option_2
execute unless score #req_opt path.edit matches 1..2 run tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"Invalid split option! Use {option:1} or {option:2}.","color":"red"}]
