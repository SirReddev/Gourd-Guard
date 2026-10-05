# Pathfinding - Clean Ground-Planted Walking & 3D Flight Engine
# Runs as each active path mob, every tick.

# 1. Reset fall distance so mobs never accumulate fall damage on elevation changes
data modify entity @s FallDistance set value 0.0f

# 2. Advance forward in facing direction (0.15 blocks/tick = 3 blocks/sec)
tp @s ^ ^ ^0.15

# --- GROUND MOBS (Zombies, Spiders, Skeletons, etc.) ---
# Predictive Step-Up: Look ahead 0.25b and elevate BEFORE entering block face (prevents Spider head suffocation)
execute as @s[tag=!path_flyer] at @s positioned ^ ^ ^0.25 unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.35 ~

# Ground Collision Step-Up fallback
execute as @s[tag=!path_flyer] at @s unless block ~ ~0.05 ~ air if block ~ ~1.5 ~ air run tp @s ~ ~0.25 ~

# Step-Down (Gravity): If in air above lower floor, descend smoothly until feet land on solid ground
execute as @s[tag=!path_flyer] at @s if block ~ ~-0.05 ~ air run tp @s ~ ~-0.25 ~

# Anti-Suffocation Protection: If a wide mob's head is briefly inside a solid wall, grant momentary resistance
execute as @s[tag=!path_flyer] at @s unless block ~ ~0.3 ~ air run effect give @s minecraft:resistance 1 4 true
