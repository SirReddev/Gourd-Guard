# gourd_guard:wave/transition/teleport_lobby
# Full multiplayer post-game reset: restores gamemodes, health, hunger, clears items/effects, resets dialogue sessions and teleports to lobby

# 1. Restore Gamemode to adventure for any player (alive, dead, or spectator)
gamemode adventure @a[tag=!gourd_test]

# 2. Fully heal, feed, extinguish, and clear status effects
effect give @a[tag=!gourd_test] minecraft:instant_health 1 255 true
effect give @a[tag=!gourd_test] minecraft:saturation 1 255 true
execute as @a[tag=!gourd_test] run data modify entity @s Fire set value 0s
effect clear @a[tag=!gourd_test]

# 3. Clear all game items, gliders, and hotbar gear
clear @a[tag=!gourd_test]

# 4. Remove active game/cutscene/death tags
tag @a remove cs_viewer
tag @a remove cs_player
tag @a remove dead
tag @a remove gg_dead
tag @a remove talker
tag @a remove gg_talking

# 5. Reset player dialogue and flight hold states
scoreboard players set @a fly_hold 0
function chatbox:reset
scoreboard players reset @a chatbox.session
scoreboard players reset @a chatbox.page

# 6. Re-enable skip trigger for all players
scoreboard players enable @a gg_skip

# 7. Teleport players to post-game lobby location
execute as @a[tag=!gourd_test] in minecraft:overworld run tp @s 2271.49 -1.00 -64.54 1618.65 -3.75

# 8. Set player spawnpoint to default lobby spawn
execute as @a[tag=!gourd_test] run spawnpoint @s 2270.47 -2.00 5.34 1621.20
