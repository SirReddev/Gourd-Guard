# Cutscene System - Add NPC Waypoint Node
# Usage: /function gourd_guard:cutscene/node/add_npc
# Places the next Peeves waypoint at your feet and captures your facing direction

function gourd_guard:cutscene/init

# Summon invisible marker at player feet and copy player rotation
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["cs_npc_node","cs_node_new"]}
execute at @s run tp @e[tag=cs_node_new] ~ ~ ~ ~ ~

# Assign map and node index
scoreboard players operation @e[tag=cs_node_new] cs.map = CurrentMap cs.edit
scoreboard players operation @e[tag=cs_node_new] cs.node = NextNode cs.edit

# Visual soul flame particle
execute at @e[tag=cs_node_new] run particle minecraft:happy_villager ~ ~0.5 ~ 0.2 0.3 0.2 0.02 20
execute at @e[tag=cs_node_new] run particle minecraft:soul_fire_flame ~ ~0.2 ~ 0.1 0.1 0.1 0.02 15

tag @e[tag=cs_node_new] remove cs_node_new

tellraw @s [{"text":"[Cutscene] ","color":"aqua"},{"text":"Placed NPC Node ","color":"green"},{"score":{"name":"NextNode","objective":"cs.edit"},"color":"gold","bold":true},{"text":" on Map ","color":"green"},{"score":{"name":"CurrentMap","objective":"cs.edit"},"color":"yellow","bold":true}]

# Increment node counter
scoreboard players add NextNode cs.edit 1
