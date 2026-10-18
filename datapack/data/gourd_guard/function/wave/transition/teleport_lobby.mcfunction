# gourd_guard:wave/transition/teleport_lobby
# Full multiplayer post-game reset: restores gamemodes, health, hunger, clears items/effects, resets dialogue sessions and teleports to lobby

# 1. Restore Gamemode to adventure for any non-creative player (alive, dead, or spectator)
gamemode adventure @a[gamemode=!creative]

# 2. Fully heal, feed, and clear status effects
effect give @a minecraft:instant_health 1 255 true
effect give @a minecraft:saturation 1 255 true
effect clear @a

# 3. Disable flight engine & clear all game items, gliders, and hotbar gear
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

# 4. Remove active game/cutscene/death/deco/test tags
tag @a remove cs_viewer
tag @a remove cs_player
tag @a remove dead
tag @a remove gg_dead
tag @a remove talker
tag @a remove gg_talking
tag @a remove gg_npc_deco
tag @a remove gourd_test

# 5. Reset player dialogue and sessions
function chatbox:reset
scoreboard players reset @a chatbox.session
scoreboard players reset @a chatbox.page

# 6. Reset per-player NPC first-interaction states for next playthrough
scoreboard players reset * gg.talked_witch
scoreboard players reset * gg.talked_archer
scoreboard players reset * gg.talked_blacksmith
scoreboard players reset * gg.talked_gravedigger
scoreboard players reset @a gg.talked_witch
scoreboard players reset @a gg.talked_archer
scoreboard players reset @a gg.talked_blacksmith
scoreboard players reset @a gg.talked_gravedigger

# 7. Re-enable skip trigger for all players
scoreboard players enable @a gg_skip

# 8. Teleport ALL players to lobby spawn location
execute in minecraft:overworld as @a run tp @s 2270.47 -2.00 5.34 181.2 -6.90

# 9. Set player spawnpoint to default lobby spawn
execute in minecraft:overworld as @a run spawnpoint @s 2270.47 -2.00 5.34 181.2
