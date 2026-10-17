# gourd_guard:player/join
# Executed as any player who joins the map for the first time

# 1. Tag player so this only runs once per player
tag @s add gg_joined

# 2. Teleport to initial start location for new players (skip builders with gourd_test)
execute unless entity @s[tag=gourd_test] in minecraft:overworld run tp @s 2270.47 -2.00 5.34 1621.20 -6.90

# 3. Set their spawnpoint here (skip builders)
execute unless entity @s[tag=gourd_test] run spawnpoint @s 2270.47 -2.00 5.34 1621.20

# 4. Set Adventure mode (unless tagged gourd_test)
gamemode adventure @s[tag=!gourd_test]

# 5. Enable skip trigger
scoreboard players enable @s gg_skip
