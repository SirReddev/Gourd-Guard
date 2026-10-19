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

# 4. Remove active game/cutscene/death/deco/test tags and cutscene posteffect
tag @a remove cs_viewer
tag @a remove cs_player
tag @a remove dead
tag @a remove gg_dead
tag @a remove talker
tag @a remove gg_talking
tag @a remove gg_npc_deco
tag @a remove gourd_test
posteffect remove @a gourd_guard:cutscene_fade

# 5. Reset player dialogue and flight hold states
scoreboard players set @a fly_hold 0
function gourd_guard:fly/disable
function chatbox:reset
scoreboard players reset @a chatbox.session
scoreboard players reset @a chatbox.page

# 6. Re-enable skip trigger for all players
scoreboard players enable @a gg_skip

# 7. Teleport ALL players to post-game lobby location
execute in minecraft:overworld as @a run tp @s 2271.53 -1.00 -64.57 177.75 -6.90

# 8. Set player spawnpoint to default lobby spawn
execute in minecraft:overworld as @a run spawnpoint @s 2272 -1 -65 177.75
scoreboard players set .wave reset_timer -1
