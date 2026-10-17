# gourd_guard:lobby/leaderboard/remove_all
# Removes all Leaderboard text displays in the world

kill @e[type=text_display,tag=gg_leaderboard_display]
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"All Leaderboard displays removed!","color":"green","bold":true}]
