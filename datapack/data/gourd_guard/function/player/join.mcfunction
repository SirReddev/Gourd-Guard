# gourd_guard:player/join
# Executed as any player who joins the map for the first time

# 1. Tag player so this only runs once per player
tag @s add gg_joined

# 2. Teleport to initial start location for new players
execute in minecraft:overworld run tp @s 2270.45 -2.00 5.56 180.00 -4.35

# 3. Set their spawnpoint here
execute in minecraft:overworld run spawnpoint @s 2270 -2 6 180.00

# 4. Set Adventure mode (unless tagged gourd_test)
gamemode adventure @s[tag=!gourd_test]

# 5. Enable skip trigger
scoreboard players enable @s gg_skip

# 6. Clear any lingering posteffects or accidental deco tags
posteffect remove @s gourd_guard:cutscene_fade
posteffect remove @s gourd_guard:fade_black
tag @s remove gg_npc_deco
