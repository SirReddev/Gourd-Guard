# Pathfinding - Assign a mob to a route
# Usage: execute as <mob> run function gourd_guard:path/route/assign {route:1}

$scoreboard players set @s path.route $(route)
scoreboard players set @s path.node 0
scoreboard players set @s path.state 1
tag @s add path_mob

# Auto-detect flying mobs for elevated hover altitude (Phantoms, Vexes, Bats, etc.)
execute if entity @s[type=phantom] run tag @s add path_flyer
execute if entity @s[type=bat] run tag @s add path_flyer
execute if entity @s[type=vex] run tag @s add path_flyer
execute if entity @s[type=allay] run tag @s add path_flyer
execute if entity @s[type=ghast] run tag @s add path_flyer
execute if entity @s[type=blaze] run tag @s add path_flyer

# Immediately orient towards Node 0
execute at @s run function gourd_guard:path/mob/process

$tellraw @a [{"text":"[Path] ","color":"dark_green"},{"text":"Assigned ","color":"green"},{"selector":"@s"},{"text":" to Route ","color":"green"},{"text":"$(route)","color":"yellow","bold":true}]
