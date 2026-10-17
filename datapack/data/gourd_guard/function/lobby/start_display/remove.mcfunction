# gourd_guard:lobby/start_display/remove
# Removes the nearest Start Game display and interaction hitbox within 6 blocks

kill @e[type=text_display,tag=gg_start_display,distance=..6,limit=1,sort=nearest]
kill @e[type=interaction,tag=gg_start_display_interaction,distance=..6,limit=1,sort=nearest]
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Nearest Start Game display removed.","color":"yellow"}]
