# Executed as & at each placed tower root entity
scoreboard players operation #t_id gg.tower_id = @s gg.tower_id

# Ensure stats are initialized for pre-existing towers
execute unless score @s gg.tower_max_cd matches 1.. run function gourd_guard:tower/placed/update_stats
execute unless entity @s[tag=gg_tower_base_sell_text_fixed] run function gourd_guard:tower/placed/update_text
tag @s add gg_tower_base_sell_text_fixed

# 1. Show text_display only when a player is within 6 blocks (0.09375 * 64 = 6 blocks; 0.0 when no player is within 6 blocks)
execute if entity @a[distance=..6] on passengers if entity @s[type=text_display] run data modify entity @s view_range set value 0.09375f
execute unless entity @a[distance=..6] on passengers if entity @s[type=text_display] run data modify entity @s view_range set value 0.0f
execute if score @s gg.tower_type matches 2 unless entity @s[tag=gg_cgl_rot_fixed] on passengers if entity @s[type=text_display] run data merge entity @s {transformation:[1f,0f,0f,0.0031f,0f,1f,0f,2.4553f,0f,0f,1f,0.0236f,0f,0f,0f,1f]}
execute if score @s gg.tower_type matches 2 unless entity @s[tag=gg_cgl_rot_fixed] run tag @s add gg_cgl_rot_fixed
execute if score @s gg.tower_type matches 4 unless entity @s[tag=gg_cauldron_bb_fixed] on passengers if entity @s[type=text_display] run data merge entity @s {billboard:"vertical"}
execute if score @s gg.tower_type matches 4 unless entity @s[tag=gg_cauldron_bb_fixed] run tag @s add gg_cauldron_bb_fixed

# 2. Position all interaction buttons from the tower's actual text-display transform.
function gourd_guard:tower/placed/position_buttons

# Ambient particles at Magic Altar locator above the book
execute if score @s gg.tower_type matches 8 as @e[type=marker,tag=aj.gourdguard_tower_magic_altar.locator.locator,distance=..3,limit=1] at @s run particle minecraft:enchant ~ ~ ~ 0.15 0.15 0.15 0.5 2

# 3. Combat Cooldown & First-in-Wave Target Acquisition
execute if score @s gg.tower_cd matches 1.. run scoreboard players remove @s gg.tower_cd 1
function gourd_guard:tower/combat/acquire_and_fire
# Scarecrow tick: check proximity trigger
execute if score @s gg.tower_type matches 9 run function gourd_guard:tower/scarecrow/tick

# Fortune Pillar tick: apply candy aura to nearby mobs
execute if score @s gg.tower_type matches 10 run function gourd_guard:tower/fortune/tick

# Ballista: rotate head bone toward nearest mob in range
execute if score @s gg.tower_type matches 11 if entity @e[tag=gg_in_range] facing entity @e[tag=gg_tower_target,limit=1,sort=nearest] eyes rotated ~ 0 on passengers if entity @s[tag=aj.gourdguard_tower_ballista.node.head] run rotate @s ~ 0
execute if score @s gg.tower_type matches 11 if entity @e[tag=gg_in_range] at @s run particle minecraft:crit ~ ~2.5 ~ 0.1 0.1 0.1 0.1 1
