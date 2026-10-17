# gourd_guard:lobby/title/summon_all
# Summons all 3 lobby titles (Start, Settings, Credits)

execute at @s rotated ~ 0 run function aj:gourdguard_lobby_titles/summon
execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles.root,distance=..3,limit=1,sort=nearest] at @s run tag @s add gg_lobby_title_all
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned all 3 3D lobby titles!","color":"green","bold":true}]
