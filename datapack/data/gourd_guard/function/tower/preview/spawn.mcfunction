# Spawn placeholder variant of the held tower for this player
execute if score #cur_type gg.tower_type matches 1 run function aj:gourdguard_tower_firework_cannon/summon {args:{variant:'placeholder'}}
execute as @n[type=item_display,tag=aj.gourdguard_tower_firework_cannon.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned
