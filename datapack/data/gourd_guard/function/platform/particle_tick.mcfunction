# gourd_guard:platform/particle_tick
# Executed as @s (platform marker) at its location

# 1. Only show if a player is within 20 blocks
execute unless entity @a[distance=..20] run return 0

# 2. Hide if a tower is placed on or near this platform (within 2.0 blocks)
execute if entity @e[tag=gg_tower_placed,distance=..2.0] run return 0

# 3. Ambient golden spark particles sitting right above platform surface
particle minecraft:wax_on ~ ~0.12 ~ 0.55 0.03 0.55 0.01 2
particle minecraft:dust{color:[1.0f,0.75f,0.2f],scale:0.75f} ~ ~0.06 ~ 0.5 0.02 0.5 0 2
