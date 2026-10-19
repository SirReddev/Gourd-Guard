# gourd_guard:player/join
# Executed as any player who joins the map for the first time

# 1. Tag player so this only runs once per player
tag @s add has_joined
tag @s add gg_joined

# 2. Teleport to initial start location for new players
execute in minecraft:overworld run tp @s 2270.45 -2.00 5.15 -178.95 -3.00

# 3. Set their spawnpoint here
execute in minecraft:overworld run spawnpoint @s 2270 -2 5 180

# 4. Set Adventure mode (unless tagged gourd_test)
gamemode adventure @s[tag=!gourd_test]

# 5. Enable skip trigger
scoreboard players enable @s gg_skip

# 6. Initialize default player scores
scoreboard players set @s hud_toggle 1
scoreboard players set @s coins 0
scoreboard players set @s fly_status 0
scoreboard players set @s fly_hold 0

# 7. Remove accidental deco tag
tag @s remove gg_npc_deco
