# gourd_guard:lobby/title/start
# Summons the 3D "START" lobby title model

execute at @s rotated ~ 0 run function aj:gourdguard_lobby_titles_start/summon
tag @e[type=item_display,tag=aj.gourdguard_lobby_titles_start.root,distance=..3,limit=1,sort=nearest] add gg_lobby_title_start

tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned 'START' 3D title!","color":"green","bold":true}]

