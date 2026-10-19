# gourd_guard:wave/transition/teleport_lobby
# Full multiplayer post-game reset: restores gamemodes, health, hunger, clears items/effects, resets dialogue sessions and teleports to lobby

# 1. Teleport ALL players to lobby spawn location immediately (Center of Lobby)
execute in minecraft:overworld run tp @a 2271.55 -1.00 -64.43 -180.15 -6.90
execute in minecraft:overworld run spawnpoint @a 2272 -1 -64 -180.15

# 2. Restore Gamemode to adventure for any non-creative player
gamemode adventure @a[gamemode=!creative]

# 3. Fully heal, feed, and clear status effects
effect give @a minecraft:instant_health 1 255 true
effect give @a minecraft:saturation 1 255 true
effect clear @a

# 4. Disable flight engine & clear all game items, gliders, and hotbar gear
scoreboard players set #game_active gg_stats 0
scoreboard players set .global cs.state 0
scoreboard players set .global fly_active 0
scoreboard players set @a fly_status 0
scoreboard players set @a fly_hold 0
function gourd_guard:fly/disable
item replace entity @a armor.chest with air
clear @a minecraft:elytra
clear @a minecraft:firework_rocket
clear @a[gamemode=!creative]

# 5. Remove active game/cutscene/death/deco/test tags
tag @a remove cs_viewer
tag @a remove cs_player
tag @a remove dead
tag @a remove gg_dead
tag @a remove talker
tag @a remove gg_talking
tag @a remove gg_npc_deco
tag @a remove gourd_test
posteffect remove @a gourd_guard:fade_black
posteffect remove @a gourd_guard:cutscene_fade

# 6. Reset player dialogue and sessions
function chatbox:reset
scoreboard players set @a chatbox.session 0
scoreboard players reset @a chatbox.page

# 7. Reset candy
function gourd_guard:hud/reset_candy

# 8. Reset per-player NPC first-interaction states for next playthrough
scoreboard objectives add gg.talked_witch dummy
scoreboard objectives add gg.talked_archer dummy
scoreboard objectives add gg.talked_blacksmith dummy
scoreboard objectives add gg.talked_gravedigger dummy
scoreboard players reset @a gg.talked_witch
scoreboard players reset @a gg.talked_archer
scoreboard players reset @a gg.talked_blacksmith
scoreboard players reset @a gg.talked_gravedigger

# 9. Re-enable skip trigger for all players
scoreboard objectives add gg_skip trigger
scoreboard players enable @a gg_skip
