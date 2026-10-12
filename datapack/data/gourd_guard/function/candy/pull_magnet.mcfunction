# Pull candy from up to 30 blocks away towards the nearest player holding a Candy Magnet
tag @s add gg_magnet_pulled
tag @s add gg_being_pulled

# Get magnet-holding player position in millimeters
execute store result score .px math run data get entity @p[tag=gg_holding_magnet,distance=..30.0] Pos[0] 1000
execute store result score .py math run data get entity @p[tag=gg_holding_magnet,distance=..30.0] Pos[1] 1000
execute store result score .pz math run data get entity @p[tag=gg_holding_magnet,distance=..30.0] Pos[2] 1000

# Aim for player's torso center (+0.6m = +600mm)
scoreboard players add .py math 600

# Get candy position in millimeters
execute store result score .ix math run data get entity @s Pos[0] 1000
execute store result score .iy math run data get entity @s Pos[1] 1000
execute store result score .iz math run data get entity @s Pos[2] 1000

# Vector Delta: (Player - Candy)
scoreboard players operation .px math -= .ix math
scoreboard players operation .py math -= .iy math
scoreboard players operation .pz math -= .iz math

# Scale down and clamp velocity so long-range attraction is fast, smooth, and never overshoots
scoreboard players set .scale math 6
scoreboard players operation .px math /= .scale math
scoreboard players operation .py math /= .scale math
scoreboard players operation .pz math /= .scale math

execute if score .px math matches 750.. run scoreboard players set .px math 750
execute if score .px math matches ..-750 run scoreboard players set .px math -750
execute if score .py math matches 750.. run scoreboard players set .py math 750
execute if score .py math matches ..-750 run scoreboard players set .py math -750
execute if score .pz math matches 750.. run scoreboard players set .pz math 750
execute if score .pz math matches ..-750 run scoreboard players set .pz math -750

# Step smoothly towards the magnet holder so candies glide over stairs, slabs, and walls without getting stuck
execute facing entity @p[tag=gg_holding_magnet,distance=..30.0] eyes positioned as @s run tp @s ^ ^ ^0.45

# Store velocity into entity Motion for smooth client interpolation
execute store result entity @s Motion[0] double 0.001 run scoreboard players get .px math
execute store result entity @s Motion[1] double 0.001 run scoreboard players get .py math
execute store result entity @s Motion[2] double 0.001 run scoreboard players get .pz math
data merge entity @s {NoGravity: 1b}
