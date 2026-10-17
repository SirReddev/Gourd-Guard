# gourd_guard:lobby/tick
# Check for right-click or punch on start display interaction hitbox
execute as @e[type=interaction,tag=gg_start_display_interaction] at @s if data entity @s interaction run function gourd_guard:lobby/start_display/click
execute as @e[type=interaction,tag=gg_start_display_interaction] at @s if data entity @s attack run function gourd_guard:lobby/start_display/click
