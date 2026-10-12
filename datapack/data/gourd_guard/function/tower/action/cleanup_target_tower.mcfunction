# Kill both interaction buttons for this tower ID
execute as @e[type=interaction,tag=gg_tower_btn,distance=..8] if score @s gg.tower_id = #btn_tid gg.tower_id run kill @s

# Remove the Animated Java model cleanly
execute as @e[type=item_display,tag=gg_target_tower] run function gourd_guard:tower/preview/remove_single
