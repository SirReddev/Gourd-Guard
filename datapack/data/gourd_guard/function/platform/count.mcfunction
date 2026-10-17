# gourd_guard:platform/count
# Counts and highlights all existing platform markers
scoreboard players set #count math 0
execute as @e[type=marker,tag=gg_platform_marker] run scoreboard players add #count math 1

tellraw @s [{"text":"[Platform] ","color":"gold"},{"text":"Total active platform markers: ","color":"yellow"},{"score":{"name":"#count","objective":"math"},"color":"aqua","bold":true}]

# Highlight all markers with particles for inspection
execute as @e[type=marker,tag=gg_platform_marker] at @s run particle minecraft:happy_villager ~ ~0.6 ~ 0.2 0.2 0.2 0 10
execute as @e[type=marker,tag=gg_platform_marker] at @s run particle minecraft:end_rod ~ ~1.0 ~ 0 0.1 0 0.05 5
