# gourd_guard:platform/spawn_marker
# Check if marker already exists within 0.8 blocks
execute if entity @e[type=marker,tag=gg_platform_marker,distance=..0.8] run tellraw @s [{"text":"[Platform] ","color":"gold"},{"text":"Platform marker already exists here!","color":"yellow"}]
execute if entity @e[type=marker,tag=gg_platform_marker,distance=..0.8] run return 0

summon minecraft:marker ~ ~ ~ {Tags:["gg_platform_marker","gg_forceloaded"]}
scoreboard players set #platform_placed math 1
scoreboard players set #snapped math 1

playsound minecraft:block.amethyst_block.hit master @a[distance=..16] ~ ~ ~ 1 1.2
particle minecraft:wax_on ~ ~0.5 ~ 0.3 0.2 0.3 0.05 15
particle minecraft:happy_villager ~ ~0.6 ~ 0.3 0.1 0.3 0 5
tellraw @s [{"text":"[Platform] ","color":"green"},{"text":"Platform particle marker summoned!","color":"yellow"}]
