# gourd_guard:hud/init_player_head
# Clean up any leftover head display entities

execute at @s run kill @e[type=item_display,tag=gg_player_head,distance=..5]
execute at @s run kill @e[type=marker,tag=gg_player_head,distance=..5]
