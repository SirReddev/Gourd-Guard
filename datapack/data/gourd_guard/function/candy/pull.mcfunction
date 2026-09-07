# Get player position in millimeters
execute store result score .px math run data get entity @p Pos[0] 1000
execute store result score .py math run data get entity @p Pos[1] 1000
execute store result score .pz math run data get entity @p Pos[2] 1000

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

# Acceleration scaling (divisor 2 for crisp, responsive flight directly into player)
scoreboard players set .scale math 2
scoreboard players operation .px math /= .scale math
scoreboard players operation .py math /= .scale math
scoreboard players operation .pz math /= .scale math

# Store directly into entity Motion
execute store result entity @s Motion[0] double 0.001 run scoreboard players get .px math
execute store result entity @s Motion[1] double 0.001 run scoreboard players get .py math
execute store result entity @s Motion[2] double 0.001 run scoreboard players get .pz math
data merge entity @s {NoGravity: 1b}