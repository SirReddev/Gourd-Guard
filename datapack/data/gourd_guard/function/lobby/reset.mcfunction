# gourd_guard:lobby/reset
# Reset tracked lobby statistics.
scoreboard players set #stats_plays gg_stats 0
scoreboard players set #stats_wins gg_stats 0
scoreboard players set #stats_fails gg_stats 0
scoreboard players set #stats_rate gg_stats 0
scoreboard players set #game_active gg_stats 0

function gourd_guard:lobby/stats/update

# Clear posteffects, flight, and accidental player deco tags
posteffect remove @a gourd_guard:cutscene_fade
posteffect remove @a gourd_guard:fade_black
tag @a remove gg_npc_deco
function gourd_guard:fly/disable

# --- 3. Announcement ---
tellraw @a [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Lobby game statistics have been reset!","color":"green","bold":true}]
