# gourd_guard:wave/transition/teleport_lobby
# Full multiplayer post-game reset: restores gamemodes, health, hunger, clears items/effects, resets dialogue sessions and teleports to lobby

# 1. Restore Gamemode to adventure for any non-creative player (alive, dead, or spectator)
gamemode adventure @a[gamemode=!creative]

# 2. Fully heal, feed, extinguish, and clear status effects
effect give @a minecraft:instant_health 1 255 true
effect give @a minecraft:saturation 1 255 true
execute as @a run data modify entity @s Fire set value 0s
effect clear @a

# 3. Clear all game items, gliders, and hotbar gear
clear @a[gamemode=!creative]
item replace entity @a armor.chest with air
clear @a minecraft:elytra
clear @a minecraft:firework_rocket

# 4. Remove active game/cutscene/death/deco/test tags
tag @a remove cs_viewer
tag @a remove cs_player
tag @a remove dead
tag @a remove gg_dead
tag @a remove talker
tag @a remove gg_talking
tag @a remove gg_npc_deco
tag @a remove gourd_test

# 5. Reset player dialogue and flight hold states
scoreboard players set @a fly_hold 0
function gourd_guard:fly/disable
function chatbox:reset
scoreboard players reset @a chatbox.session
scoreboard players reset @a chatbox.page

# 6. Re-enable skip trigger for all players
scoreboard players enable @a gg_skip

# 7. Teleport ALL players to post-game lobby location
execute in minecraft:overworld as @a run tp @s 2271.49 -1.00 -64.54 178.65 -3.75

# 8. Set player spawnpoint to default lobby spawn
execute in minecraft:overworld as @a run spawnpoint @s 2270.47 -2.00 5.34 181.2 -6.90
