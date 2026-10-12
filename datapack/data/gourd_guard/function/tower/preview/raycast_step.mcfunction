# Step along player look ray until hitting a non-air block
execute unless block ~ ~ ~ #minecraft:air unless block ~ ~ ~ minecraft:light run return run function gourd_guard:tower/preview/on_ray_hit
scoreboard players remove #ray_steps math 1
execute if score #ray_steps math matches 1.. positioned ^ ^ ^0.25 run function gourd_guard:tower/preview/raycast_step
