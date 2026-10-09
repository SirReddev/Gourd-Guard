# Cutscene System - Add Camera Waypoint Node
# Usage: /function gourd_guard:cutscene/node/add_cam
# Places a Camera waypoint matching your current eye position & facing angle

function gourd_guard:cutscene/init

# Summon marker capturing player position and rotation
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["cs_cam_node","cs_cam_new"]}

# Copy rotation
execute at @s run tp @e[tag=cs_cam_new] ~ ~ ~ ~ ~

scoreboard players operation @e[tag=cs_cam_new] cs.map = CurrentMap cs.edit
scoreboard players operation @e[tag=cs_cam_new] cs.node = NextNode cs.edit

execute at @e[tag=cs_cam_new] run particle minecraft:end_rod ~ ~ ~ 0.1 0.1 0.1 0.02 20

tag @e[tag=cs_cam_new] remove cs_cam_new

tellraw @s [{"text":"[Cutscene] ","color":"aqua"},{"text":"Placed Cam Node ","color":"green"},{"score":{"name":"NextNode","objective":"cs.edit"},"color":"gold","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"cs.edit"},"color":"yellow","bold":true}]
