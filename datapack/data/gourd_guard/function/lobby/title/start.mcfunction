# gourd_guard:lobby/title/start
# Summons the 3D "START" lobby title model

execute rotated ~ 0 run function aj:gourdguard_lobby_titles/summon
execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles.root,distance=..3,limit=1,sort=nearest] at @s run tag @s add gg_lobby_title_start

# Hide Settings and Credits bones so only START is displayed
execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles.bone.settings.child,distance=..4] run data merge entity @s {transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f]},item:{id:"minecraft:air"}}
execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles.bone.credits.child,distance=..4] run data merge entity @s {transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f]},item:{id:"minecraft:air"}}

tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned 'START' 3D title!","color":"green","bold":true}]
