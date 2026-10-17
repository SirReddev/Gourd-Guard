# gourd_guard:lobby/title/remove_all
# Removes all lobby title models in the world

execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles_start.root] at @s run function aj:gourdguard_lobby_titles_start/remove/this
execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles_settings.root] at @s run function aj:gourdguard_lobby_titles_settings/remove/this
execute as @e[type=item_display,tag=aj.gourdguard_lobby_titles_credits.root] at @s run function aj:gourdguard_lobby_titles_credits/remove/this
kill @e[type=item_display,tag=aj.gourdguard_lobby_titles_start.entity]
kill @e[type=item_display,tag=aj.gourdguard_lobby_titles_settings.entity]
kill @e[type=item_display,tag=aj.gourdguard_lobby_titles_credits.entity]
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"All 3D lobby titles removed!","color":"green","bold":true}]

