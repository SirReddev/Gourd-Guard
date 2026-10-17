# gourd_guard:platform/detect_2x2
# Aligned at corner block of terracotta: detect 2x2 arrangement and snap to exact center seam
scoreboard players set #snapped math 0

# Case 1: (+X, +Z) -> blocks at (0,0), (+1,0), (0,+1), (+1,+1)
execute if score #snapped math matches 0 if block ~1 ~ ~ minecraft:black_glazed_terracotta if block ~ ~ ~1 minecraft:black_glazed_terracotta if block ~1 ~ ~1 minecraft:black_glazed_terracotta positioned ~1.0 ~1.0 ~1.0 run function gourd_guard:platform/spawn_marker

# Case 2: (-X, +Z) -> blocks at (0,0), (-1,0), (0,+1), (-1,+1)
execute if score #snapped math matches 0 if block ~-1 ~ ~ minecraft:black_glazed_terracotta if block ~ ~ ~1 minecraft:black_glazed_terracotta if block ~-1 ~ ~1 minecraft:black_glazed_terracotta positioned ~0.0 ~1.0 ~1.0 run function gourd_guard:platform/spawn_marker

# Case 3: (+X, -Z) -> blocks at (0,0), (+1,0), (0,-1), (+1,-1)
execute if score #snapped math matches 0 if block ~1 ~ ~ minecraft:black_glazed_terracotta if block ~ ~ ~-1 minecraft:black_glazed_terracotta if block ~1 ~ ~-1 minecraft:black_glazed_terracotta positioned ~1.0 ~1.0 ~0.0 run function gourd_guard:platform/spawn_marker

# Case 4: (-X, -Z) -> blocks at (0,0), (-1,0), (0,-1), (-1,-1)
execute if score #snapped math matches 0 if block ~-1 ~ ~ minecraft:black_glazed_terracotta if block ~ ~ ~-1 minecraft:black_glazed_terracotta if block ~-1 ~ ~-1 minecraft:black_glazed_terracotta positioned ~0.0 ~1.0 ~0.0 run function gourd_guard:platform/spawn_marker

# Fallback (single block): center is ~0.5 ~1.0 ~0.5
execute if score #snapped math matches 0 positioned ~0.5 ~1.0 ~0.5 run function gourd_guard:platform/spawn_marker
