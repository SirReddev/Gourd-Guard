# Pathfinding - Assign a mob to a specific map and path
# Usage: execute as <mob> run function gourd_guard:path/route/assign {map:1,path:1}

scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.state dummy

$scoreboard players set @s path.map $(map)
$scoreboard players set @s path.route $(path)
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

# Disable vanilla circling/wander AI on airborne mobs and elevate to flight altitude (1.0 block)
execute if entity @s[tag=path_flyer] run data modify entity @s NoAI set value 1b
execute if entity @s[tag=path_flyer] at @s run tp @s ~ ~1.0 ~

# Immediately orient towards Node 0
execute at @s run function gourd_guard:path/mob/process

$tellraw @a [{"text":"[Path] ","color":"dark_green"},{"text":"Assigned ","color":"green"},{"selector":"@s"},{"text":" to Map $(map) Path $(path)","color":"yellow","bold":true}]
