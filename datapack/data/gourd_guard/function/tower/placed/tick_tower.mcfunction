# Executed as & at each placed tower root entity
scoreboard players operation #t_id gg.tower_id = @s gg.tower_id

# Orient horizontally toward the nearest player so [MOVE] (left) and [SELL] (right) match the vertical billboard text!
execute facing entity @p[distance=..16] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
execute facing entity @p[distance=..16] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
