# gourd_guard:lobby/stats/remove_all
# Removes all Statistics text displays in the world

kill @e[type=text_display,tag=gg_stats_display]
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"All Statistics text displays removed!","color":"green","bold":true}]
