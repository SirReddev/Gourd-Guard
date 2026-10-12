scoreboard players set #snapped math 1

# Check if a placed tower already occupies this 2x2 platform center (within 1.2 blocks)
execute if entity @e[type=item_display,tag=gg_tower_placed,distance=..1.2] run return run function gourd_guard:tower/preview/move_invalid

# Valid unoccupied platform! Move preview hologram here, set normal `placeholder` variant, and mark player as valid to place
scoreboard players set @s gg.tower_valid 1
execute as @e[type=item_display,tag=gg_my_preview] run tp @s ~ ~ ~ ~ 0
execute as @e[type=item_display,tag=gg_my_preview] run function gourd_guard:tower/preview/set_variant_valid
