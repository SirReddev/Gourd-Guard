# Pathfinding - Add a waypoint node at your current position
# Usage: /function gourd_guard:path/route/add_node

scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.edit dummy

# If CurrentRoute is not set, default to 1
execute unless score CurrentRoute path.edit matches 1.. run scoreboard players set CurrentRoute path.edit 1
execute unless score NextNode path.edit matches 0.. run scoreboard players set NextNode path.edit 0

# Summon invisible marker armor stand at player's feet
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Marker:1b,Tags:["path_node","path_node_new"]}

# Assign route and node index scores
scoreboard players operation @e[tag=path_node_new] path.route = CurrentRoute path.edit
scoreboard players operation @e[tag=path_node_new] path.node = NextNode path.edit

# Visual blue soul particle indicator at node position
execute at @e[tag=path_node_new] run particle minecraft:soul_fire_flame ~ ~0.2 ~ 0.1 0.1 0.1 0.02 25
execute at @e[tag=path_node_new] run particle minecraft:soul ~ ~0.4 ~ 0.1 0.1 0.1 0.02 15

# Remove temp tag
tag @e[tag=path_node_new] remove path_node_new

# Confirm to player with visible score numbers
tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Route ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]

# Increment next available node index
scoreboard players add NextNode path.edit 1
