# gourd_guard:lobby/title/settings
# Summons the 3D "SETTINGS" lobby title model

execute rotated ~ 0 run function aj:gourdguard_lobby_titles/summon
execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles.root,distance=..3,limit=1,sort=nearest] at @s run tag @s add gg_lobby_title_settings

# Hide Start and Credits bones so only SETTINGS is displayed
execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles.bone.start.child,distance=..4] run data merge entity @s {transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f]},item:{id:"minecraft:air"}}
execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles.bone.credits.child,distance=..4] run data merge entity @s {transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f]},item:{id:"minecraft:air"}}

tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned 'SETTINGS' 3D title!","color":"green","bold":true}]
