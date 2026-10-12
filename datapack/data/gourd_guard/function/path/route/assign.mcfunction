# Pathfinding - Assign a mob to a specific map and path
# Usage: execute as <mob> run function gourd_guard:path/route/assign {map:1,path:1}

scoreboard objectives add path.branch dummy
scoreboard objectives add path.option dummy
scoreboard objectives add path.cmp dummy

$scoreboard players set @s path.map $(map)
$scoreboard players set @s path.route $(path)
scoreboard players set @s path.branch 0
scoreboard players set @s path.node 0
scoreboard players set @s path.state 1

# Alternate split option 50/50 (1, 2, 1, 2...) per Map & Path so equal numbers take each branch
$execute unless score #split_m$(map)_p$(path) path.cmp matches 1..2 run scoreboard players set #split_m$(map)_p$(path) path.cmp 1
$scoreboard players operation @s path.option = #split_m$(map)_p$(path) path.cmp
$execute if score #split_m$(map)_p$(path) path.cmp matches 1 run scoreboard players set #next_opt path.cmp 2
$execute if score #split_m$(map)_p$(path) path.cmp matches 2 run scoreboard players set #next_opt path.cmp 1
$scoreboard players operation #split_m$(map)_p$(path) path.cmp = #next_opt path.cmp

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

$execute if score .debug path.debug matches 1 run tellraw @a [{"text":"[Path] ","color":"dark_green"},{"text":"Assigned ","color":"green"},{"selector":"@s"},{"text":" to Map $(map) Path $(path)","color":"yellow","bold":true}]
