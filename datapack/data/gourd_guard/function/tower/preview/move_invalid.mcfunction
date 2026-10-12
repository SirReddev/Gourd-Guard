scoreboard players set @s gg.tower_valid 0
execute as @e[type=item_display,tag=gg_my_preview] run tp @s ~ ~ ~ ~ 0
execute as @e[type=item_display,tag=gg_my_preview] run function gourd_guard:tower/preview/set_variant_fail
