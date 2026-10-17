# gourd_guard:reset
# Master Map & Game Session Reset
# Usage: /function gourd_guard:reset
# Fully resets the active match: clears mobs, towers, timers, coins, dialogue, posteffects, flight, and returns players to the lobby.

# 1. Stop Wave System & Reset Wave Data
scoreboard players set .wave state 0
scoreboard players set #game_active gg_stats 0
function gourd_guard:wave/reset_data

# 2. Reset Cutscene & Dialogue System
function gourd_guard:cutscene/reset

# 3. Disable Adventure Flight
function gourd_guard:fly/disable

# 4. Stop All Audio & Clear Screen Titles / Posteffects
stopsound @a record gourd_guard:game.over
stopsound @a record gourd_guard:game.won
stopsound @a record gourd_guard:hud.timer10s
stopsound @a record gourd_guard:npc.peeves.laugh
title @a clear
title @a reset
posteffect remove @a gourd_guard:cutscene_fade
posteffect remove @a gourd_guard:fade_black

# 5. Restore Players & Teleport to Lobby
function gourd_guard:wave/transition/teleport_lobby

# 6. Re-enable skip trigger for all players
scoreboard players enable @a gg_skip

# 7. Announce Master Reset Complete
tellraw @a [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Map and game session have been fully reset! Ready for next playthrough.","color":"green","bold":true}]
