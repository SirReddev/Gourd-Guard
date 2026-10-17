# gourd_guard:lobby/stats/remove
# Removes the nearest Statistics text display within 10 blocks

execute as @e[type=text_display,tag=gg_stats_display,distance=..10,limit=1,sort=nearest] run kill @s
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Nearest Statistics text display removed.","color":"yellow"}]
