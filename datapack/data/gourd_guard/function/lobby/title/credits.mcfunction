# gourd_guard:lobby/title/credits
# Summons the 3D "CREDITS" lobby title model

execute at @s rotated ~ 0 run function aj:gourdguard_lobby_titles/summon
execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles.root,distance=..3,limit=1,sort=nearest] at @s run tag @s add gg_lobby_title_credits

# Hide Start and Settings bones so only CREDITS is displayed
execute as @e[type=item_display,tag=gg_lobby_title_credits,distance=..3,limit=1,sort=nearest] on passengers if entity @s[tag=aj.gourdguard_lobby_titles.bone.start.child] run data merge entity @s {item:{id:"minecraft:air"},transformation:[0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,1f]}
execute as @e[type=item_display,tag=gg_lobby_title_credits,distance=..3,limit=1,sort=nearest] on passengers if entity @s[tag=aj.gourdguard_lobby_titles.bone.settings.child] run data merge entity @s {item:{id:"minecraft:air"},transformation:[0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,1f]}

tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned 'CREDITS' 3D title!","color":"green","bold":true}]
