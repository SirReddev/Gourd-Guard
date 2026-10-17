# gourd_guard:platform/remove_all
# Removes all platform particle markers from the map
scoreboard players set #count math 0
execute as @e[type=marker,tag=gg_platform_marker] run scoreboard players add #count math 1

kill @e[type=marker,tag=gg_platform_marker]
tellraw @s [{"text":"[Platform] ","color":"gold"},{"text":"Removed all ","color":"yellow"},{"score":{"name":"#count","objective":"math"},"color":"aqua","bold":true},{"text":" platform markers from the world!","color":"yellow"}]
