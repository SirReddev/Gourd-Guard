# Pillager Convoy (Type 3) Combat Check
# Executed as & at the placed tower root (@s)

# Only dispatch when cooldown is ready (<= 0)
execute unless score @s gg.tower_cd matches ..0 run return 0

# Stagger dispatches: If another convoy is currently within 6 blocks of a route start entrance, wait 25 ticks (1.25s)
execute at @e[tag=path_node,scores={path.node=0..1}] if entity @e[tag=gg_convoy,distance=..8.0] run return run scoreboard players set @s gg.tower_cd 60

# Only dispatch when wave is active (state 1) OR living wave mobs exist on the map
execute if score .wave state matches 1 run return run function gourd_guard:tower/convoy/dispatch
execute if entity @e[tag=gg_mob] run return run function gourd_guard:tower/convoy/dispatch
