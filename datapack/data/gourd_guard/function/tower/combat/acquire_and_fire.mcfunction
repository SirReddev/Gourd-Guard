# Executed as & at the placed tower root (@s)
# Pillager Convoy (Type 3) does not aim single projectiles; check its multi-path convoy dispatch timer
execute if score @s gg.tower_type matches 3 run return run function gourd_guard:tower/convoy/check_fire

tag @e[tag=gg_in_range] remove gg_in_range
tag @e[tag=gg_tower_target] remove gg_tower_target

# Tag all living wave mobs within this tower's level-based range (Lvl 1 = 6b, Lvl 2 = 7b, Lvl 3 = 8b, Lvl 4 = 9b, Lvl 5 = 10.5b)
execute if score @s gg.tower_lvl matches 1 run tag @e[tag=gg_mob,distance=..6.0] add gg_in_range
execute if score @s gg.tower_lvl matches 2 run tag @e[tag=gg_mob,distance=..7.0] add gg_in_range
execute if score @s gg.tower_lvl matches 3 run tag @e[tag=gg_mob,distance=..8.0] add gg_in_range
execute if score @s gg.tower_lvl matches 4 run tag @e[tag=gg_mob,distance=..9.0] add gg_in_range
execute if score @s gg.tower_lvl matches 5 run tag @e[tag=gg_mob,distance=..10.5] add gg_in_range

# Handle Type 2 (Copper Golem Launcher) open/close animation states
# When mobs enter range and tower is closed -> play open animation
execute if score @s gg.tower_type matches 2 if entity @e[tag=gg_in_range] unless entity @s[tag=gg_tower_open] run function aj:gourdguard_tower_copper_golem_launcher/animations/open/play_exclusive
execute if score @s gg.tower_type matches 2 if entity @e[tag=gg_in_range] run tag @s add gg_tower_open

# When NO mobs are left in range and tower is open -> play close animation
execute if score @s gg.tower_type matches 2 unless entity @e[tag=gg_in_range] if entity @s[tag=gg_tower_open] run function aj:gourdguard_tower_copper_golem_launcher/animations/close/play_exclusive
execute if score @s gg.tower_type matches 2 unless entity @e[tag=gg_in_range] run tag @s remove gg_tower_open

# Early exit if no wave mobs are within range
execute unless entity @e[tag=gg_in_range] run return 0

# For Type 7 (Slowness Cauldron), prioritize mobs that are not currently slowed
execute if score @s gg.tower_type matches 7 as @e[tag=gg_in_range] unless score @s gg.slow_ticks matches 1.. run tag @s add gg_prefer_target
execute if score @s gg.tower_type matches 7 if entity @e[tag=gg_prefer_target] run tag @e[tag=gg_in_range,tag=!gg_prefer_target] remove gg_in_range
tag @e remove gg_prefer_target

# Find the mob in range with the HIGHEST gg.mob_prog (the FIRST mob in the wave!)
scoreboard players set #best_prog gg.mob_prog -1
execute as @e[tag=gg_in_range] if score @s gg.mob_prog > #best_prog gg.mob_prog run scoreboard players operation #best_prog gg.mob_prog = @s gg.mob_prog
execute as @e[tag=gg_in_range] if score @s gg.mob_prog = #best_prog gg.mob_prog run tag @s add gg_tower_target

# Aim Type 1 cannon's wooden mount and barrel horizontally toward the leading target mob
execute if score @s gg.tower_type matches 1 facing entity @e[tag=gg_tower_target,limit=1,sort=nearest] eyes rotated ~ 0 on passengers if entity @s[tag=!aj.gourdguard_tower_firework_cannon.node.stone_base,tag=!aj.gourdguard_tower_firework_cannon.node.text_display] run rotate @s ~ 0

# If cooldown is ready (0), fire at the target!
execute if score @s gg.tower_cd matches ..0 run function gourd_guard:tower/combat/fire_shot

# Clean up tags
tag @e[tag=gg_in_range] remove gg_in_range
tag @e[tag=gg_tower_target] remove gg_tower_target
