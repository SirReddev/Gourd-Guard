# Executed as & at each placed tower root entity
scoreboard players operation #t_id gg.tower_id = @s gg.tower_id

# Ensure stats are initialized for pre-existing towers
execute unless score @s gg.tower_dmg matches 1.. run function gourd_guard:tower/placed/update_stats

# 1. Show text_display only when a player is within 6 blocks (0.09375 * 64 = 6 blocks; 0.0 when no player is within 6 blocks)
execute if entity @a[distance=..6] on passengers if entity @s[type=text_display] run data modify entity @s view_range set value 0.09375f
execute unless entity @a[distance=..6] on passengers if entity @s[type=text_display] run data modify entity @s view_range set value 0.0f

# 2. Orient [MOVE] (player's left = ^-0.42) and [SELL] (player's right = ^0.42) toward nearest player within 6 blocks
execute if score @s gg.tower_type matches 1 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 1 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
execute if score @s gg.tower_type matches 2 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.35 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 2 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.35 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05

# 3. Combat Cooldown & First-in-Wave Target Acquisition
execute if score @s gg.tower_cd matches 1.. run scoreboard players remove @s gg.tower_cd 1
function gourd_guard:tower/combat/acquire_and_fire
