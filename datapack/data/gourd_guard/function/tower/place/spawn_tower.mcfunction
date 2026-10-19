# Assign a unique tower ID
scoreboard players operation #new_tid gg.tower_id = #next gg.tower_next_id
scoreboard players add #next gg.tower_next_id 1

# Summon the Animated Java model with default variant
execute if score #spawn_type gg.tower_type matches 1 run function aj:gourdguard_tower_firework_cannon/summon {args:{variant:'default'}}
execute if score #spawn_type gg.tower_type matches 2 run function aj:gourdguard_tower_copper_golem_launcher/summon {args:{variant:'default'}}
execute if score #spawn_type gg.tower_type matches 3 run function aj:gourdguard_tower_pillager_convoy/summon {args:{variant:'default'}}
execute if score #spawn_type gg.tower_type matches 4 run function aj:gourdguard_tower_cauldron_damage/summon {args:{variant:'default'}}
execute if score #spawn_type gg.tower_type matches 5 run function aj:gourdguard_tower_tesla_coil/summon {args:{variant:'default'}}

# Initialize the newly summoned tower root
execute as @n[type=item_display,tag=aj.gourdguard_tower_firework_cannon.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..0.5] run function gourd_guard:tower/place/init_placed_root
execute as @n[type=item_display,tag=aj.gourdguard_tower_copper_golem_launcher.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..0.5] run function gourd_guard:tower/place/init_placed_root
execute as @n[type=item_display,tag=aj.gourdguard_tower_pillager_convoy.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..0.5] run function gourd_guard:tower/place/init_placed_root
execute as @n[type=item_display,tag=aj.gourdguard_tower_cauldron_damage.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..0.5] run function gourd_guard:tower/place/init_placed_root
execute as @n[type=item_display,tag=aj.gourdguard_tower_tesla_coil.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..0.5] run function gourd_guard:tower/place/init_placed_root

# Play placement sound & particles (happy_villager for cannon, wax_off for copper golem launcher, raid horn & ominous for pillager convoy, brewing & witch for cauldron, thunder & sparks for tesla)
execute if score #spawn_type gg.tower_type matches 1 run playsound minecraft:block.anvil.place master @a[distance=..16] ~ ~ ~ 0.7 1.2
execute if score #spawn_type gg.tower_type matches 1 run particle minecraft:happy_villager ~ ~0.5 ~ 0.4 0.3 0.4 0.05 10
execute if score #spawn_type gg.tower_type matches 2 run playsound minecraft:block.copper.place master @a[distance=..16] ~ ~ ~ 1.0 1.0
execute if score #spawn_type gg.tower_type matches 2 run particle minecraft:wax_off ~ ~0.5 ~ 0.4 0.3 0.4 0.05 16
execute if score #spawn_type gg.tower_type matches 3 run playsound minecraft:event.raid.horn master @a[distance=..16] ~ ~ ~ 0.8 1.1
execute if score #spawn_type gg.tower_type matches 3 run particle minecraft:raid_omen ~ ~0.8 ~ 0.4 0.3 0.4 0.0 16
execute if score #spawn_type gg.tower_type matches 4 run playsound minecraft:block.brewing_stand.brew master @a[distance=..16] ~ ~ ~ 1.0 1.0
execute if score #spawn_type gg.tower_type matches 4 run particle minecraft:witch ~ ~0.5 ~ 0.4 0.3 0.4 0.05 16
execute if score #spawn_type gg.tower_type matches 5 run playsound minecraft:item.trident.thunder master @a[distance=..16] ~ ~ ~ 1.0 1.5
execute if score #spawn_type gg.tower_type matches 5 run particle minecraft:electric_spark ~ ~0.8 ~ 0.4 0.3 0.4 0.1 20
