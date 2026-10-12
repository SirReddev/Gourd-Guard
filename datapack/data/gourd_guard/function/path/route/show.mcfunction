# Pathfinding - Visualize a specific map and path's nodes (color-coded by section)
# Usage: /function gourd_guard:path/route/show {map:1,path:1}

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.branch dummy
scoreboard objectives add path.cmp dummy

$scoreboard players set ShowMap path.cmp $(map)
$scoreboard players set ShowRoute path.cmp $(path)
scoreboard players set FoundNodes path.cmp 0
scoreboard players set FoundStart path.cmp 0
scoreboard players set FoundOpt1 path.cmp 0
scoreboard players set FoundOpt2 path.cmp 0
scoreboard players set FoundEnd path.cmp 0

# Count matching nodes total and per section
execute as @e[tag=path_node] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundNodes path.cmp 1
execute as @e[tag=path_node,scores={path.branch=0}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundStart path.cmp 1
execute as @e[tag=path_node,scores={path.branch=1}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundOpt1 path.cmp 1
execute as @e[tag=path_node,scores={path.branch=2}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundOpt2 path.cmp 1
execute as @e[tag=path_node,scores={path.branch=3}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundEnd path.cmp 1

# Render section-colored particles at each node:
# Shared Start (branch 0): Blue Soul Flames
execute as @e[tag=path_node,scores={path.branch=0}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:soul_fire_flame ~ ~0.4 ~ 0.1 0.3 0.1 0.02 35
execute as @e[tag=path_node,scores={path.branch=0}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:soul ~ ~0.6 ~ 0.1 0.3 0.1 0.02 15
# Split Option 1 (branch 1): Green Emerald Sparkles
execute as @e[tag=path_node,scores={path.branch=1}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:happy_villager ~ ~0.4 ~ 0.15 0.3 0.15 0.05 35
# Split Option 2 (branch 2): Purple Witch Sparkles
execute as @e[tag=path_node,scores={path.branch=2}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:witch ~ ~0.4 ~ 0.15 0.3 0.15 0.05 40
# Common End (branch 3): Gold/Orange Flames
execute as @e[tag=path_node,scores={path.branch=3}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:flame ~ ~0.4 ~ 0.1 0.3 0.1 0.02 35
execute as @e[tag=path_node,scores={path.branch=3}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:lava ~ ~0.6 ~ 0.1 0.2 0.1 0.02 10

# Feedback messages
$execute if score FoundNodes path.cmp matches 0 run tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"No nodes found for Map $(map) Path $(path). Run ","color":"red"},{"text":"/function gourd_guard:path/route/begin {map:$(map),path:$(path)}","color":"yellow"},{"text":" to start adding nodes!","color":"red"}]
$execute if score FoundNodes path.cmp matches 1.. run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Map $(map) Path $(path) (","color":"green"},{"score":{"name":"FoundNodes","objective":"path.cmp"},"color":"white","bold":true},{"text":" nodes): ","color":"green"},{"text":"Start=","color":"aqua"},{"score":{"name":"FoundStart","objective":"path.cmp"},"color":"aqua","bold":true},{"text":" | Opt1=","color":"green"},{"score":{"name":"FoundOpt1","objective":"path.cmp"},"color":"green","bold":true},{"text":" | Opt2=","color":"light_purple"},{"score":{"name":"FoundOpt2","objective":"path.cmp"},"color":"light_purple","bold":true},{"text":" | End=","color":"gold"},{"score":{"name":"FoundEnd","objective":"path.cmp"},"color":"gold","bold":true}]
