# Assign a unique tower ID
scoreboard players operation #new_tid gg.tower_id = #next gg.tower_next_id
scoreboard players add #next gg.tower_next_id 1

# Summon the Animated Java model with default variant
execute if score #spawn_type gg.tower_type matches 1 run function aj:gourdguard_tower_firework_cannon/summon {args:{variant:'default'}}
execute if score #spawn_type gg.tower_type matches 2 run function aj:gourdguard_tower_copper_golem_launcher/summon {args:{variant:'default'}}

# Initialize the newly summoned tower root
execute as @n[type=item_display,tag=aj.gourdguard_tower_firework_cannon.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..0.5] run function gourd_guard:tower/place/init_placed_root
execute as @n[type=item_display,tag=aj.gourdguard_tower_copper_golem_launcher.root,tag=!gg_tower_preview,tag=!gg_tower_placed,distance=..0.5] run function gourd_guard:tower/place/init_placed_root

# Play placement sound
playsound minecraft:block.anvil.place master @a[distance=..16] ~ ~ ~ 0.7 1.2
particle minecraft:happy_villager ~ ~0.5 ~ 0.4 0.3 0.4 0.05 10
