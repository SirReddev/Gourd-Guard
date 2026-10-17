# gourd_guard:lobby/tick
# Check for clicks on start display interaction hitbox
execute as @e[type=interaction,tag=gg_start_display_interaction] if data entity @s interaction run function gourd_guard:lobby/start_display/click
