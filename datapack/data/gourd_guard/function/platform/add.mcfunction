# gourd_guard:platform/add
# Places a platform particle marker at player's position, auto-snapping to black glazed terracotta 2x2 center
scoreboard players set #platform_placed math 0

# Check block directly under feet (~ ~-1 ~)
execute if block ~ ~-1 ~ minecraft:black_glazed_terracotta align xyz positioned ~ ~-1 ~ run function gourd_guard:platform/detect_2x2

# Check block at feet (~ ~ ~)
execute if score #platform_placed math matches 0 if block ~ ~ ~ minecraft:black_glazed_terracotta align xyz positioned ~ ~ ~ run function gourd_guard:platform/detect_2x2

# Fallback: place directly at player's aligned feet position
execute if score #platform_placed math matches 0 align xyz positioned ~0.5 ~ ~0.5 run function gourd_guard:platform/spawn_marker
