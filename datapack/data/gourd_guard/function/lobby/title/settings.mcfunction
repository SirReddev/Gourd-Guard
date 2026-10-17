# gourd_guard:lobby/title/settings
# Summons the 3D "SETTINGS" lobby title model

execute at @s rotated ~ 0 run function aj:gourdguard_lobby_titles_settings/summon
tag @e[type=item_display,tag=aj.gourdguard_lobby_titles_settings.root,distance=..3,limit=1,sort=nearest] add gg_lobby_title_settings

tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned 'SETTINGS' 3D title!","color":"green","bold":true}]

