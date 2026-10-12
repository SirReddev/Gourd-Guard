# Executed as & at each placed tower root entity
scoreboard players operation #t_id gg.tower_id = @s gg.tower_id

# Show text_display only when a player is within 6 blocks (0.09375 * 64 = 6 blocks; 0.0 when no player is within 6 blocks)
execute if entity @a[distance=..6] on passengers if entity @s[type=text_display] run data modify entity @s view_range set value 0.09375f
execute unless entity @a[distance=..6] on passengers if entity @s[type=text_display] run data modify entity @s view_range set value 0.0f

# Orient horizontally toward the nearest player within 6 blocks so [MOVE] (player's left = ^-0.42) and [SELL] (player's right = ^0.42) match the billboard text!
execute if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
