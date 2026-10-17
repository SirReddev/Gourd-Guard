# gourd_guard:lobby/title/remove
# Removes the nearest lobby title model within 10 blocks

execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles.root,distance=..10,limit=1,sort=nearest] at @s run function aj:gourdguard_lobby_titles/remove/this
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Nearest 3D lobby title removed.","color":"yellow"}]
