# Pathfinding - Add a waypoint node at your current position
# Usage: /function gourd_guard:path/route/add_node

# If no active editing route is set, default to route 1
execute unless score #edit_route path.edit matches 1.. run scoreboard players set #edit_route path.edit 1
execute unless score #next_node path.edit matches 0.. run scoreboard players set #next_node path.edit 0

# Summon invisible marker armor stand at player's feet
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Marker:1b,Tags:["path_node","path_node_new"]}

# Assign route and node index scores
scoreboard players operation @e[tag=path_node_new] path.route = #edit_route path.edit
scoreboard players operation @e[tag=path_node_new] path.node = #next_node path.edit

# Visual particle indicator at node position
execute at @e[tag=path_node_new] run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.1 0.1 0.05 20
execute at @e[tag=path_node_new] run particle minecraft:flame ~ ~0.1 ~ 0.1 0.1 0.1 0.02 10

# Remove temp tag
tag @e[tag=path_node_new] remove path_node_new

# Confirm to player
tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Node ","color":"green"},{"score":{"name":"#next_node","objective":"path.edit"},"color":"aqua","bold":true},{"text":" placed on Route ","color":"green"},{"score":{"name":"#edit_route","objective":"path.edit"},"color":"yellow","bold":true}]

# Increment next available node index
scoreboard players add #next_node path.edit 1
