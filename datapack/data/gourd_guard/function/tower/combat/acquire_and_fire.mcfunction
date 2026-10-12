# Executed as & at the placed tower root (@s)
tag @e remove gg_in_range
tag @e remove gg_tower_target

# Tag all living wave mobs within this tower's level-based range (Lvl 1 = 6b, Lvl 2 = 7b, Lvl 3 = 8b, Lvl 4 = 9b, Lvl 5 = 10.5b)
execute if score @s gg.tower_lvl matches 1 run tag @e[tag=gg_mob,distance=..6.0] add gg_in_range
execute if score @s gg.tower_lvl matches 2 run tag @e[tag=gg_mob,distance=..7.0] add gg_in_range
execute if score @s gg.tower_lvl matches 3 run tag @e[tag=gg_mob,distance=..8.0] add gg_in_range
execute if score @s gg.tower_lvl matches 4 run tag @e[tag=gg_mob,distance=..9.0] add gg_in_range
execute if score @s gg.tower_lvl matches 5 run tag @e[tag=gg_mob,distance=..10.5] add gg_in_range

# Early exit if no wave mobs are within range
execute unless entity @e[tag=gg_in_range] run return 0

# Find the mob in range with the HIGHEST gg.mob_prog (the FIRST mob in the wave!)
scoreboard players set #best_prog gg.mob_prog -1
execute as @e[tag=gg_in_range] if score @s gg.mob_prog > #best_prog gg.mob_prog run scoreboard players operation #best_prog gg.mob_prog = @s gg.mob_prog
execute as @e[tag=gg_in_range] if score @s gg.mob_prog = #best_prog gg.mob_prog run tag @s add gg_tower_target

# Aim the cannon's wooden mount and barrel horizontally toward the leading target mob!
execute facing entity @n[tag=gg_tower_target] eyes rotated ~ 0 on passengers if entity @s[tag=!aj.gourdguard_tower_firework_cannon.node.stone_base,tag=!aj.gourdguard_tower_firework_cannon.node.text_display] run rotate @s ~ 0

# If cooldown is ready (0), fire an arcing firework rocket at the target!
execute if score @s gg.tower_cd matches ..0 run function gourd_guard:tower/combat/fire_shot
