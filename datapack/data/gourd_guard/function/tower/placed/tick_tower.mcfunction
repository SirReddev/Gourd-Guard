# Executed as & at each placed tower root entity
scoreboard players operation #t_id gg.tower_id = @s gg.tower_id

# Ensure stats are initialized for pre-existing towers
execute unless score @s gg.tower_max_cd matches 1.. run function gourd_guard:tower/placed/update_stats

# 1. Show text_display only when a player is within 6 blocks (0.09375 * 64 = 6 blocks; 0.0 when no player is within 6 blocks)
execute if entity @a[distance=..6] on passengers if entity @s[type=text_display] run data modify entity @s view_range set value 0.09375f
execute unless entity @a[distance=..6] on passengers if entity @s[type=text_display] run data modify entity @s view_range set value 0.0f
execute if score @s gg.tower_type matches 2 unless entity @s[tag=gg_cgl_rot_fixed] on passengers if entity @s[type=text_display] run data merge entity @s {transformation:[1f,0f,0f,0.0031f,0f,1f,0f,2.4553f,0f,0f,1f,0.0236f,0f,0f,0f,1f]}
execute if score @s gg.tower_type matches 2 unless entity @s[tag=gg_cgl_rot_fixed] run tag @s add gg_cgl_rot_fixed
execute if score @s gg.tower_type matches 4 unless entity @s[tag=gg_cauldron_bb_fixed] on passengers if entity @s[type=text_display] run data merge entity @s {billboard:"vertical"}
execute if score @s gg.tower_type matches 4 unless entity @s[tag=gg_cauldron_bb_fixed] run tag @s add gg_cauldron_bb_fixed

# 2. Orient [MOVE] (player's left = ^-0.42) and [SELL] (player's right = ^0.42) toward nearest player within 6 blocks
execute if score @s gg.tower_type matches 1 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 1 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
execute if score @s gg.tower_type matches 2 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.35 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 2 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.35 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
execute if score @s gg.tower_type matches 3 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.0 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 3 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.0 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
execute if score @s gg.tower_type matches 4 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 4 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
execute if score @s gg.tower_type matches 5 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.7 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 5 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.7 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
execute if score @s gg.tower_type matches 6 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 6 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
execute if score @s gg.tower_type matches 7 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 7 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
execute if score @s gg.tower_type matches 8 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.0 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 8 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.0 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05

# Ambient particles at Magic Altar locator above the book
execute if score @s gg.tower_type matches 8 as @e[type=marker,tag=aj.gourdguard_tower_magic_altar.locator.locator,distance=..3,limit=1] at @s run particle minecraft:enchant ~ ~ ~ 0.15 0.15 0.15 0.5 2

# 3. Combat Cooldown & First-in-Wave Target Acquisition
execute if score @s gg.tower_cd matches 1.. run scoreboard players remove @s gg.tower_cd 1
function gourd_guard:tower/combat/acquire_and_fire
# New towers (9/10/11) button positioning
execute if score @s gg.tower_type matches 9 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~1.95 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.42 ^ ^0.05
execute if score @s gg.tower_type matches 9 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~1.95 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.42 ^ ^0.05
execute if score @s gg.tower_type matches 10 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.7 ^ ^0.05
execute if score @s gg.tower_type matches 10 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.0 ^ ^0.05
execute if score @s gg.tower_type matches 10 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_upgrade,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.72 ^ ^0.05
execute if score @s gg.tower_type matches 10 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_stats,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^1.35 ^ ^0.05
execute if score @s gg.tower_type matches 11 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_move,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^-0.7 ^ ^0.05
execute if score @s gg.tower_type matches 11 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_sell,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.0 ^ ^0.05
execute if score @s gg.tower_type matches 11 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_upgrade,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.72 ^ ^0.05
execute if score @s gg.tower_type matches 11 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_stats,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^1.35 ^ ^0.05

# Also add upgrade/stats btn positioning for existing towers 1-8
execute if score @s gg.tower_type matches 1 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_upgrade,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.72 ^ ^0.05
execute if score @s gg.tower_type matches 1 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.95 ~ as @e[type=interaction,tag=gg_tower_btn_stats,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^1.35 ^ ^0.05
execute if score @s gg.tower_type matches 2 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.35 ~ as @e[type=interaction,tag=gg_tower_btn_upgrade,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.72 ^ ^0.05
execute if score @s gg.tower_type matches 2 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.35 ~ as @e[type=interaction,tag=gg_tower_btn_stats,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^1.35 ^ ^0.05
execute if score @s gg.tower_type matches 3 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.0 ~ as @e[type=interaction,tag=gg_tower_btn_upgrade,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.72 ^ ^0.05
execute if score @s gg.tower_type matches 3 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.0 ~ as @e[type=interaction,tag=gg_tower_btn_stats,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^1.35 ^ ^0.05
execute if score @s gg.tower_type matches 4 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_upgrade,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.72 ^ ^0.05
execute if score @s gg.tower_type matches 4 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_stats,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^1.35 ^ ^0.05
execute if score @s gg.tower_type matches 5 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.7 ~ as @e[type=interaction,tag=gg_tower_btn_upgrade,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.72 ^ ^0.05
execute if score @s gg.tower_type matches 5 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.7 ~ as @e[type=interaction,tag=gg_tower_btn_stats,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^1.35 ^ ^0.05
execute if score @s gg.tower_type matches 6 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_upgrade,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.72 ^ ^0.05
execute if score @s gg.tower_type matches 6 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_stats,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^1.35 ^ ^0.05
execute if score @s gg.tower_type matches 7 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_upgrade,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.72 ^ ^0.05
execute if score @s gg.tower_type matches 7 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~2.7 ~ as @e[type=interaction,tag=gg_tower_btn_stats,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^1.35 ^ ^0.05
execute if score @s gg.tower_type matches 8 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.0 ~ as @e[type=interaction,tag=gg_tower_btn_upgrade,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^0.72 ^ ^0.05
execute if score @s gg.tower_type matches 8 if entity @a[distance=..6] facing entity @p[distance=..6] eyes rotated ~ 0 positioned ~ ~3.0 ~ as @e[type=interaction,tag=gg_tower_btn_stats,distance=..5] if score @s gg.tower_id = #t_id gg.tower_id run tp @s ^1.35 ^ ^0.05

# Scarecrow tick: check proximity trigger
execute if score @s gg.tower_type matches 9 run function gourd_guard:tower/scarecrow/tick

# Fortune Pillar tick: apply candy aura to nearby mobs
execute if score @s gg.tower_type matches 10 run function gourd_guard:tower/fortune/tick

# Ballista: rotate head bone toward nearest mob in range
execute if score @s gg.tower_type matches 11 if entity @e[tag=gg_in_range] facing entity @e[tag=gg_tower_target,limit=1,sort=nearest] eyes rotated ~ 0 on passengers if entity @s[tag=aj.gourdguard_tower_ballista.node.head] run rotate @s ~ 0
execute if score @s gg.tower_type matches 11 if entity @e[tag=gg_in_range] at @s run particle minecraft:crit ~ ~2.5 ~ 0.1 0.1 0.1 0.1 1
