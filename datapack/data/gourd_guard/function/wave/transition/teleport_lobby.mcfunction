# gourd_guard:wave/transition/teleport_lobby
# Teleports players to the location after a game has ended (victory, defeat, or manual end)
# Excludes builders tagged gourd_test so their building work is never interrupted
execute as @a[tag=!gourd_test] in minecraft:overworld run tp @s 2271.49 -1.00 -64.54 1618.65 -3.75
