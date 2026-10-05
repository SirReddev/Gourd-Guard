# Pathfinding - Assign a mob to a route
# Usage: execute as <mob> run function gourd_guard:path/route/assign {route:1}

$scoreboard players set @s path.route $(route)
scoreboard players set @s path.node 0
scoreboard players set @s path.state 1
tag @s add path_mob

# Auto-detect flying mobs for specialized aerial navigation
execute if entity @s[type=phantom] run tag @s add path_flyer
execute if entity @s[type=bat] run tag @s add path_flyer
execute if entity @s[type=vex] run tag @s add path_flyer
execute if entity @s[type=allay] run tag @s add path_flyer
execute if entity @s[type=ghast] run tag @s add path_flyer
execute if entity @s[type=blaze] run tag @s add path_flyer

# Disable vanilla flight AI on airborne mobs so they glide with 100% path precision
execute if entity @s[tag=path_flyer] run data modify entity @s NoAI set value 1b

# Immediately orient towards Node 0
execute at @s run function gourd_guard:path/mob/process

$tellraw @a [{"text":"[Path] ","color":"dark_green"},{"text":"Assigned ","color":"green"},{"selector":"@s"},{"text":" to Route ","color":"green"},{"text":"$(route)","color":"yellow","bold":true}]
