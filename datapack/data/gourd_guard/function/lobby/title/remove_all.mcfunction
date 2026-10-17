# gourd_guard:lobby/title/remove_all
# Removes all lobby title models in the world

execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles.root] at @s run function aj:gourdguard_lobby_titles/remove/this
kill @e[type=item_display,tag=aj.gourdguard_lobby_titles.entity]
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"All 3D lobby titles removed!","color":"green","bold":true}]
