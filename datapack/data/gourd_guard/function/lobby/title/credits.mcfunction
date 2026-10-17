# gourd_guard:lobby/title/credits
# Summons the 3D "CREDITS" lobby title model

execute at @s rotated ~ 0 run function aj:gourdguard_lobby_titles_credits/summon
tag @e[type=item_display,tag=aj.gourdguard_lobby_titles_credits.root,distance=..3,limit=1,sort=nearest] add gg_lobby_title_credits

tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned 'CREDITS' 3D title!","color":"green","bold":true}]

