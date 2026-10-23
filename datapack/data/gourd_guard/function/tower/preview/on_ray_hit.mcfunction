scoreboard players set #ray_hit math 1

# Check if the hit block is black_glazed_terracotta (or if the block directly below the hit air point is black_glazed_terracotta)
execute if block ~ ~ ~ minecraft:black_glazed_terracotta align xyz positioned ~0.5 ~1.0 ~0.5 run return run function gourd_guard:tower/preview/snap_2x2
execute if block ~ ~-1 ~ minecraft:black_glazed_terracotta if block ~ ~ ~ #minecraft:air align xyz positioned ~0.5 ~ ~0.5 run return run function gourd_guard:tower/preview/snap_2x2

# Otherwise, we hit a non-platform block: show placeholder_fail preview on top of the hit block (or at ray point) and mark invalid (0)
execute if block ~ ~1 ~ #minecraft:air align y positioned ~ ~1.0 ~ run return run function gourd_guard:tower/preview/move_invalid
function gourd_guard:tower/preview/move_invalid
# Scarecrow (type 9) can be placed on dirt_path (single block, no 2x2 snap needed)
execute if score #cur_type gg.tower_type matches 9 if block ~ ~ ~ minecraft:dirt_path align xyz positioned ~0.5 ~1.0 ~0.5 run function gourd_guard:tower/preview/snap_scarecrow
execute if score #cur_type gg.tower_type matches 9 if block ~ ~-1 ~ minecraft:dirt_path if block ~ ~ ~ #minecraft:air align xyz positioned ~0.5 ~ ~0.5 run function gourd_guard:tower/preview/snap_scarecrow