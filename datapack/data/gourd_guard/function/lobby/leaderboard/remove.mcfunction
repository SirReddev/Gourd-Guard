# gourd_guard:lobby/leaderboard/remove
# Removes nearest Leaderboard display within 6 blocks

kill @e[type=text_display,tag=gg_leaderboard_display,distance=..6,limit=1,sort=nearest]
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Nearest Leaderboard display removed.","color":"yellow"}]
