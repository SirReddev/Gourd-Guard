# Determine which corner of the 2x2 black_glazed_terracotta platform we are looking at
# and shift to the exact center of the 2x2 platform:
scoreboard players set #snapped math 0

# Case 1: (+X, +Z) -> blocks at (0,0), (+1,0), (0,+1), (+1,+1)
execute if score #snapped math matches 0 if block ~1 ~-1 ~ minecraft:black_glazed_terracotta if block ~ ~-1 ~1 minecraft:black_glazed_terracotta if block ~1 ~-1 ~1 minecraft:black_glazed_terracotta positioned ~0.5 ~ ~0.5 run function gourd_guard:tower/preview/set_snapped_pos

# Case 2: (-X, +Z) -> blocks at (0,0), (-1,0), (0,+1), (-1,+1)
execute if score #snapped math matches 0 if block ~-1 ~-1 ~ minecraft:black_glazed_terracotta if block ~ ~-1 ~1 minecraft:black_glazed_terracotta if block ~-1 ~-1 ~1 minecraft:black_glazed_terracotta positioned ~-0.5 ~ ~0.5 run function gourd_guard:tower/preview/set_snapped_pos

# Case 3: (+X, -Z) -> blocks at (0,0), (+1,0), (0,-1), (+1,-1)
execute if score #snapped math matches 0 if block ~1 ~-1 ~ minecraft:black_glazed_terracotta if block ~ ~-1 ~-1 minecraft:black_glazed_terracotta if block ~1 ~-1 ~-1 minecraft:black_glazed_terracotta positioned ~0.5 ~ ~-0.5 run function gourd_guard:tower/preview/set_snapped_pos

# Case 4: (-X, -Z) -> blocks at (0,0), (-1,0), (0,-1), (-1,-1)
execute if score #snapped math matches 0 if block ~-1 ~-1 ~ minecraft:black_glazed_terracotta if block ~ ~-1 ~-1 minecraft:black_glazed_terracotta if block ~-1 ~-1 ~-1 minecraft:black_glazed_terracotta positioned ~-0.5 ~ ~-0.5 run function gourd_guard:tower/preview/set_snapped_pos

# Fallback: if it's a single black_glazed_terracotta block (not 2x2), still allow snapping to its center
execute if score #snapped math matches 0 run function gourd_guard:tower/preview/set_snapped_pos
