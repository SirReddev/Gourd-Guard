# Pillager Convoy (Type 3) Combat Check
# Executed as & at the placed tower root (@s)

# Only dispatch when cooldown is ready (<= 0)
execute unless score @s gg.tower_cd matches ..0 run return 0

# Only dispatch when wave is active (state 1) OR living wave mobs exist on the map
execute if score .wave state matches 1 run return run function gourd_guard:tower/convoy/dispatch
execute if entity @e[tag=gg_mob] run return run function gourd_guard:tower/convoy/dispatch
