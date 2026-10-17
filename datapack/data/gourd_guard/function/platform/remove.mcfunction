# gourd_guard:platform/remove
# Removes the nearest platform particle marker within 3.5 blocks of the player
execute unless entity @e[type=marker,tag=gg_platform_marker,distance=..3.5] run return run tellraw @s [{"text":"[Platform] ","color":"red"},{"text":"No platform marker found within 3.5 blocks.","color":"gray"}]

execute at @n[type=marker,tag=gg_platform_marker,distance=..3.5] run particle minecraft:smoke ~ ~0.5 ~ 0.2 0.2 0.2 0.05 10
execute at @n[type=marker,tag=gg_platform_marker,distance=..3.5] run playsound minecraft:block.bone_block.break master @s ~ ~ ~ 1 0.8
kill @n[type=marker,tag=gg_platform_marker,distance=..3.5]

tellraw @s [{"text":"[Platform] ","color":"green"},{"text":"Removed nearest platform marker!","color":"yellow"}]
