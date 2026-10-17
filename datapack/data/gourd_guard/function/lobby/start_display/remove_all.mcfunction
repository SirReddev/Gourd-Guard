# gourd_guard:lobby/start_display/remove_all
# Removes all Start Game displays and interactions in the world

kill @e[type=text_display,tag=gg_start_display]
kill @e[type=interaction,tag=gg_start_display_interaction]
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"All Start Game displays removed!","color":"green","bold":true}]
