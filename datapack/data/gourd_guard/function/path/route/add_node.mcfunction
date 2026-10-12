# Pathfinding - Add a waypoint node at your current position
# Usage: /function gourd_guard:path/route/add_node

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.branch dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.edit dummy

# Default to Map 1, Route 1, Branch 0 (Shared Start) if not previously configured
execute unless score CurrentMap path.edit matches 1.. run scoreboard players set CurrentMap path.edit 1
execute unless score CurrentRoute path.edit matches 1.. run scoreboard players set CurrentRoute path.edit 1
execute unless score CurrentBranch path.edit matches 0..23 run scoreboard players set CurrentBranch path.edit 0
execute unless score NextNode path.edit matches 0.. run scoreboard players set NextNode path.edit 0

# Summon invisible marker armor stand at player's feet and force-load its 5x5 chunk area permanently
execute at @s run forceload add ~-32 ~-32 ~32 ~32
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Marker:1b,Tags:["path_node","path_node_new","gg_forceloaded","gg_forceloaded_5x5"]}

# Assign map, route, branch and node index scores
scoreboard players operation @e[tag=path_node_new] path.map = CurrentMap path.edit
scoreboard players operation @e[tag=path_node_new] path.route = CurrentRoute path.edit
scoreboard players operation @e[tag=path_node_new] path.branch = CurrentBranch path.edit
scoreboard players operation @e[tag=path_node_new] path.node = NextNode path.edit

# Visual particle indicator color-coded by section
execute if score CurrentBranch path.edit matches 0 at @e[tag=path_node_new] run particle minecraft:soul_fire_flame ~ ~0.2 ~ 0.1 0.1 0.1 0.02 25
execute if score CurrentBranch path.edit matches 0 at @e[tag=path_node_new] run particle minecraft:soul ~ ~0.4 ~ 0.1 0.1 0.1 0.02 15
execute if score CurrentBranch path.edit matches 1 at @e[tag=path_node_new] run particle minecraft:happy_villager ~ ~0.3 ~ 0.15 0.2 0.15 0.05 25
execute if score CurrentBranch path.edit matches 11..13 at @e[tag=path_node_new] run particle minecraft:scrape ~ ~0.3 ~ 0.15 0.2 0.15 0.05 25
execute if score CurrentBranch path.edit matches 11..13 at @e[tag=path_node_new] run particle minecraft:happy_villager ~ ~0.3 ~ 0.15 0.2 0.15 0.05 15
execute if score CurrentBranch path.edit matches 2 at @e[tag=path_node_new] run particle minecraft:witch ~ ~0.3 ~ 0.15 0.2 0.15 0.05 30
execute if score CurrentBranch path.edit matches 21..23 at @e[tag=path_node_new] run particle minecraft:portal ~ ~0.3 ~ 0.15 0.2 0.15 0.1 30
execute if score CurrentBranch path.edit matches 21..23 at @e[tag=path_node_new] run particle minecraft:witch ~ ~0.3 ~ 0.15 0.2 0.15 0.05 15
execute if score CurrentBranch path.edit matches 3 at @e[tag=path_node_new] run particle minecraft:flame ~ ~0.2 ~ 0.1 0.1 0.1 0.02 25
execute if score CurrentBranch path.edit matches 3 at @e[tag=path_node_new] run particle minecraft:lava ~ ~0.4 ~ 0.1 0.1 0.1 0.02 10

# Remove temp tag
tag @e[tag=path_node_new] remove path_node_new

# Confirm to player with visible section & score numbers
execute if score CurrentBranch path.edit matches 0 run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed ","color":"green"},{"text":"[Start] ","color":"aqua","bold":true},{"text":"Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]
execute if score CurrentBranch path.edit matches 1 run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed ","color":"green"},{"text":"[Option 1] ","color":"green","bold":true},{"text":"Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]
execute if score CurrentBranch path.edit matches 11 run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed ","color":"green"},{"text":"[Option 1A] ","color":"dark_aqua","bold":true},{"text":"Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]
execute if score CurrentBranch path.edit matches 12 run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed ","color":"green"},{"text":"[Option 1B] ","color":"blue","bold":true},{"text":"Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]
execute if score CurrentBranch path.edit matches 13 run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed ","color":"green"},{"text":"[Sub-Merge 1] ","color":"yellow","bold":true},{"text":"Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]
execute if score CurrentBranch path.edit matches 2 run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed ","color":"green"},{"text":"[Option 2] ","color":"light_purple","bold":true},{"text":"Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]
execute if score CurrentBranch path.edit matches 21 run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed ","color":"green"},{"text":"[Option 2A] ","color":"dark_purple","bold":true},{"text":"Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]
execute if score CurrentBranch path.edit matches 22 run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed ","color":"green"},{"text":"[Option 2B] ","color":"red","bold":true},{"text":"Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]
execute if score CurrentBranch path.edit matches 23 run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed ","color":"green"},{"text":"[Sub-Merge 2] ","color":"yellow","bold":true},{"text":"Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]
execute if score CurrentBranch path.edit matches 3 run tellraw @s [{"text":"[Path] ","color":"dark_green"},{"text":"Placed ","color":"green"},{"text":"[Common End] ","color":"gold","bold":true},{"text":"Node ","color":"green"},{"score":{"name":"NextNode","objective":"path.edit"},"color":"aqua","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"path.edit"},"color":"gold","bold":true},{"text":" Path ","color":"green"},{"score":{"name":"CurrentRoute","objective":"path.edit"},"color":"yellow","bold":true}]

# Increment next available node index
scoreboard players add NextNode path.edit 1
