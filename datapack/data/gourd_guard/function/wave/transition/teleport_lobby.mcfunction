# gourd_guard:wave/transition/teleport_lobby
# Full multiplayer post-game reset: restores gamemodes, health, hunger, clears items/effects, resets dialogue sessions and teleports to lobby

# 1. Teleport ALL players to post-game lobby location immediately
execute in minecraft:overworld run tp @a 2271.53 -1.00 -64.57 177.75 -6.90
execute in minecraft:overworld run spawnpoint @a 2272 -1 -65 177.75

# 2. Restore Gamemode to adventure for any non-creative player (alive, dead, or spectator)
gamemode adventure @a[gamemode=!creative]

# 3. Fully heal, feed, extinguish, and clear status effects
effect give @a minecraft:instant_health 1 255 true
effect give @a minecraft:saturation 1 255 true
effect give @a minecraft:fire_resistance 2 0 true
effect clear @a

# 4. Clear all game items, gliders, and hotbar gear
clear @a[gamemode=!creative]
item replace entity @a armor.chest with air

# 5. Remove active game/cutscene/death/deco/test tags and cutscene posteffect
tag @a remove cs_viewer
tag @a remove cs_player
tag @a remove dead
tag @a remove gg_dead
tag @a remove talker
tag @a remove gg_talking
tag @a remove gg_npc_deco
tag @a remove gourd_test
posteffect remove @a gourd_guard:cutscene_fade

# 6. Reset player dialogue and flight hold states
scoreboard players set @a fly_hold 0
function gourd_guard:fly/disable
function chatbox:reset
scoreboard players reset @a chatbox.session
scoreboard players reset @a chatbox.page

# 7. Re-enable skip trigger for all players
scoreboard players enable @a gg_skip

# 8. Reset transition timer
scoreboard players set .wave reset_timer -1
