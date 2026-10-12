# Pathfinding - Visualize a specific map and path's nodes (color-coded particles + 3D floating labels + detailed breakdown)
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
scoreboard players set FoundOpt1A path.cmp 0
scoreboard players set FoundOpt1B path.cmp 0
scoreboard players set FoundOpt2 path.cmp 0
scoreboard players set FoundOpt2A path.cmp 0
scoreboard players set FoundOpt2B path.cmp 0
scoreboard players set FoundEnd path.cmp 0

# Clear any previous floating labels and spawn new 3D labels above each node on this route (lasts 15s)
function gourd_guard:path/route/hide_labels
execute as @e[tag=path_node] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run function gourd_guard:path/route/spawn_label
schedule function gourd_guard:path/route/hide_labels 300t replace

# Count matching nodes total and per section
execute as @e[tag=path_node] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundNodes path.cmp 1
execute as @e[tag=path_node,scores={path.branch=0}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundStart path.cmp 1
execute as @e[tag=path_node,scores={path.branch=1}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundOpt1 path.cmp 1
execute as @e[tag=path_node,scores={path.branch=11}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundOpt1A path.cmp 1
execute as @e[tag=path_node,scores={path.branch=12}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundOpt1B path.cmp 1
execute as @e[tag=path_node,scores={path.branch=2}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundOpt2 path.cmp 1
execute as @e[tag=path_node,scores={path.branch=21}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundOpt2A path.cmp 1
execute as @e[tag=path_node,scores={path.branch=22}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundOpt2B path.cmp 1
execute as @e[tag=path_node,scores={path.branch=3}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp run scoreboard players add FoundEnd path.cmp 1

# Render section-colored particles at each node:
execute as @e[tag=path_node,scores={path.branch=0}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:soul_fire_flame ~ ~0.4 ~ 0.1 0.3 0.1 0.02 35
execute as @e[tag=path_node,scores={path.branch=1}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:happy_villager ~ ~0.4 ~ 0.15 0.3 0.15 0.05 35
execute as @e[tag=path_node,scores={path.branch=11..13}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:scrape ~ ~0.4 ~ 0.15 0.3 0.15 0.05 35
execute as @e[tag=path_node,scores={path.branch=2}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:witch ~ ~0.4 ~ 0.15 0.3 0.15 0.05 40
execute as @e[tag=path_node,scores={path.branch=21..23}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:portal ~ ~0.4 ~ 0.15 0.3 0.15 0.1 40
execute as @e[tag=path_node,scores={path.branch=3}] if score @s path.map = ShowMap path.cmp if score @s path.route = ShowRoute path.cmp at @s run particle minecraft:flame ~ ~0.4 ~ 0.1 0.3 0.1 0.02 35

# Feedback messages with detailed sub-branch counts and clickable test button
$execute if score FoundNodes path.cmp matches 0 run tellraw @s [{"text":"[Path] ","color":"dark_red"},{"text":"No nodes found for Map $(map) Path $(path). Run ","color":"red"},{"text":"/function gourd_guard:path/route/begin {map:$(map),path:$(path)}","color":"yellow"},{"text":" to start adding nodes!","color":"red"}]
$execute if score FoundNodes path.cmp matches 1.. run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Map $(map) Path $(path) (","color":"green"},{"score":{"name":"FoundNodes","objective":"path.cmp"},"color":"white","bold":true},{"text":" nodes): ","color":"green"},{"text":"Start=","color":"aqua"},{"score":{"name":"FoundStart","objective":"path.cmp"},"color":"aqua","bold":true},{"text":" | Opt1=","color":"green"},{"score":{"name":"FoundOpt1","objective":"path.cmp"},"color":"green","bold":true},{"text":" (1A=","color":"dark_aqua"},{"score":{"name":"FoundOpt1A","objective":"path.cmp"},"color":"dark_aqua","bold":true},{"text":", 1B=","color":"blue"},{"score":{"name":"FoundOpt1B","objective":"path.cmp"},"color":"blue","bold":true},{"text":") | Opt2=","color":"light_purple"},{"score":{"name":"FoundOpt2","objective":"path.cmp"},"color":"light_purple","bold":true},{"text":" (2A=","color":"dark_purple"},{"score":{"name":"FoundOpt2A","objective":"path.cmp"},"color":"dark_purple","bold":true},{"text":", 2B=","color":"red"},{"score":{"name":"FoundOpt2B","objective":"path.cmp"},"color":"red","bold":true},{"text":") | End=","color":"gold"},{"score":{"name":"FoundEnd","objective":"path.cmp"},"color":"gold","bold":true}]
$execute if score FoundNodes path.cmp matches 1.. run tellraw @s [{"text":"  ","color":"gray"},{"text":"[▶ Spawn 4 Test Mobs]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:path/route/test {map:$(map),path:$(path)}"}},{"text":"  ","color":"gray"},{"text":"[✖ Hide Labels]","color":"red","click_event":{"action":"run_command","command":"/function gourd_guard:path/route/hide_labels"}}]
