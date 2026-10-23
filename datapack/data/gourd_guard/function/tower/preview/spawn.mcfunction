# Spawn placeholder_fail variant initially for the held tower
execute if score #cur_type gg.tower_type matches 1 run function aj:gourdguard_tower_firework_cannon/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 1 as @n[type=item_display,tag=aj.gourdguard_tower_firework_cannon.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned

execute if score #cur_type gg.tower_type matches 2 run function aj:gourdguard_tower_copper_golem_launcher/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 2 as @n[type=item_display,tag=aj.gourdguard_tower_copper_golem_launcher.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned

execute if score #cur_type gg.tower_type matches 3 run function aj:gourdguard_tower_pillager_convoy/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 3 as @n[type=item_display,tag=aj.gourdguard_tower_pillager_convoy.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned

execute if score #cur_type gg.tower_type matches 4 run function aj:gourdguard_tower_cauldron_damage/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 4 as @n[type=item_display,tag=aj.gourdguard_tower_cauldron_damage.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned

execute if score #cur_type gg.tower_type matches 5 run function aj:gourdguard_tower_tesla_coil/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 5 as @n[type=item_display,tag=aj.gourdguard_tower_tesla_coil.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned

execute if score #cur_type gg.tower_type matches 6 run function aj:gourdguard_tower_cauldron_poison/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 6 as @n[type=item_display,tag=aj.gourdguard_tower_cauldron_poison.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned

execute if score #cur_type gg.tower_type matches 7 run function aj:gourdguard_tower_cauldron_slowness/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 7 as @n[type=item_display,tag=aj.gourdguard_tower_cauldron_slowness.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned

execute if score #cur_type gg.tower_type matches 8 run function aj:gourdguard_tower_magic_altar/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 8 as @n[type=item_display,tag=aj.gourdguard_tower_magic_altar.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned

execute if score #cur_type gg.tower_type matches 9 run function aj:gourdguard_tower_scarecrow/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 9 as @n[type=item_display,tag=aj.gourdguard_tower_scarecrow.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned

execute if score #cur_type gg.tower_type matches 10 run function aj:gourdguard_tower_fortune_pillar/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 10 as @n[type=item_display,tag=aj.gourdguard_tower_fortune_pillar.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned

execute if score #cur_type gg.tower_type matches 11 run function aj:gourdguard_tower_ballista/summon {args:{variant:'placeholder_fail'}}
execute if score #cur_type gg.tower_type matches 11 as @n[type=item_display,tag=aj.gourdguard_tower_ballista.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..2] run function gourd_guard:tower/preview/init_spawned
