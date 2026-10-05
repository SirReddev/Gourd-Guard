# Pathfinding - Cheap Per-Tick Walk
# Runs as each path mob, every tick.
# No entity lookups - just advances the mob in its currently stored facing direction.

# Move forward 0.15 blocks/tick (= 3 blocks/sec)
tp @s ^ ^ ^0.15

# Step-up correction: if the mob has moved into a solid block, push it up 1 block.
# Only triggers if there is also headroom above (prevents clipping through ceilings).
execute at @s unless block ~ ~ ~ air if block ~ ~2 ~ air run tp @s ~ ~1 ~
