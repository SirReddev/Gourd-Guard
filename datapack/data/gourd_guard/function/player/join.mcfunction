# gourd_guard:player/join
# Executed as any player who joins the map for the first time

# 1. Tag player so this only runs once per player
tag @s add gg_joined

# 2. Teleport to initial start location for new players (skip builders with gourd_test)
execute unless entity @s[tag=gourd_test] in minecraft:overworld run tp @s 2270.47 -2.00 5.34 181.2 -6.90

# 3. Set their spawnpoint here (skip builders)
execute unless entity @s[tag=gourd_test] run spawnpoint @s 2270.47 -2.00 5.34 181.2

# 4. Set Adventure mode (unless tagged gourd_test)
gamemode adventure @s[tag=!gourd_test]

# 5. Enable skip trigger
scoreboard players enable @s gg_skip

# 6. Clear any lingering posteffects or accidental deco tags
posteffect remove @s gourd_guard:cutscene_fade
posteffect remove @s gourd_guard:fade_black
tag @s remove gg_npc_deco

# 7. Initialize player candy score with team global candy
scoreboard players operation @s coins = .global coins
