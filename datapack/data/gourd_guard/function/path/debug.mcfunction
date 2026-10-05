# Pathfinding System - Comprehensive Debug Diagnostics
# Usage: /function gourd_guard:path/debug

scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.state dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.edit dummy

scoreboard players set TotalNodes path.cmp 0
scoreboard players set TotalMobs path.cmp 0

execute as @e[tag=path_node] run scoreboard players add TotalNodes path.cmp 1
execute as @e[tag=path_mob] run scoreboard players add TotalMobs path.cmp 1

tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
tellraw @s [{"text":"  🔍 ","color":"white"},{"text":"Pathfinding System Diagnostics","color":"yellow","bold":true}]
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
tellraw @s [{"text":"  Total Waypoint Nodes: ","color":"gray"},{"score":{"name":"TotalNodes","objective":"path.cmp"},"color":"aqua","bold":true}]
tellraw @s [{"text":"  Active Path Mobs:     ","color":"gray"},{"score":{"name":"TotalMobs","objective":"path.cmp"},"color":"green","bold":true}]
tellraw @s [{"text":"  Current Edit Route:   ","color":"gray"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true},{"text":" (Next node: ","color":"dark_gray"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua"},{"text":")","color":"dark_gray"}]
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}

# Detail per node (if within 20 blocks of player)
tellraw @s [{"text":"  Nearby Nodes (20b radius):","color":"gold"}]
execute as @e[tag=path_node,distance=..20] run tellraw @s [{"text":"    • Node ","color":"gray"},{"score":{"name":"@s","objective":"path.node"},"color":"aqua","bold":true},{"text":" (Route ","color":"gray"},{"score":{"name":"@s","objective":"path.route"},"color":"yellow","bold":true},{"text":") at ","color":"gray"},{"text":"[Marker]","color":"white"}]

# Detail per mob
tellraw @s [{"text":"  Tracked Mobs:","color":"gold"}]
execute as @e[tag=path_mob] run tellraw @s [{"text":"    • ","color":"gray"},{"selector":"@s"},{"text":" -> Route ","color":"gray"},{"score":{"name":"@s","objective":"path.route"},"color":"yellow","bold":true},{"text":", Target Node: ","color":"gray"},{"score":{"name":"@s","objective":"path.node"},"color":"aqua","bold":true},{"text":", State: ","color":"gray"},{"score":{"name":"@s","objective":"path.state"},"color":"green"}]

tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
