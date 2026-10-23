# Check if a placed tower already occupies this spot
execute if entity @e[type=item_display,tag=gg_tower_placed,distance=..1.2] run return run function gourd_guard:tower/preview/move_invalid

# Valid dirt_path! Move preview here and mark as valid
scoreboard players set @s gg.tower_valid 1
execute as @e[type=item_display,tag=gg_my_preview] run tp @s ~ ~ ~ ~ 0
execute as @e[type=item_display,tag=gg_my_preview] run function gourd_guard:tower/preview/set_variant_valid
