# Spawn placeholder_fail variant initially for the held tower
execute if score #cur_type gg.tower_type matches 1 run function aj:gourdguard_tower_firework_cannon/summon {args:{variant:'placeholder_fail'}}
execute as @n[type=item_display,tag=aj.gourdguard_tower_firework_cannon.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned
