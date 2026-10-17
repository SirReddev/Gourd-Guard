# gourd_guard:platform/remove
# Removes the nearest platform particle marker within close range (5 blocks) of the player
execute unless entity @e[type=marker,tag=gg_platform_marker,distance=..5] run return run tellraw @s [{"text":"[Platform] ","color":"red"},{"text":"No platform marker found within 5 blocks.","color":"gray"}]

execute as @e[type=marker,tag=gg_platform_marker,distance=..5,sort=nearest,limit=1] at @s run particle minecraft:smoke ~ ~0.5 ~ 0.2 0.2 0.2 0.05 15
execute as @e[type=marker,tag=gg_platform_marker,distance=..5,sort=nearest,limit=1] at @s run playsound minecraft:block.bone_block.break master @a[distance=..16] ~ ~ ~ 1 0.8
kill @e[type=marker,tag=gg_platform_marker,distance=..5,sort=nearest,limit=1]

tellraw @s [{"text":"[Platform] ","color":"green"},{"text":"Removed nearest platform marker!","color":"yellow"}]
