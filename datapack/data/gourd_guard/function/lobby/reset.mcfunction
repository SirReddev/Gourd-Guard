# gourd_guard:lobby/reset
# Completely wipes and resets all lobby metrics:
# 1. Leaderboard records (Best map times, global record, last game time)
# 2. Statistics (Total playthroughs, victories, fails, win rate)
# 3. Refreshes all active Leaderboard and Statistics text displays to default empty states

# --- 1. Clear Leaderboard Records & Storage ---
data remove storage gourd_guard:leaderboard records
data remove storage gourd_guard:leaderboard best_global
data remove storage gourd_guard:leaderboard last_game
data remove storage gourd_guard:leaderboard macro

scoreboard players reset * gg_rc_tot
scoreboard players reset * gg_rc_min
scoreboard players reset * gg_rc_sec
scoreboard players reset * gg_rc_map

# Refresh leaderboard displays
function gourd_guard:lobby/leaderboard/update

# --- 2. Clear Statistics ---
scoreboard players set #stats_plays gg_stats 0
scoreboard players set #stats_wins gg_stats 0
scoreboard players set #stats_fails gg_stats 0
scoreboard players set #stats_rate gg_stats 0
scoreboard players set #game_active gg_stats 0

# Refresh statistics displays
function gourd_guard:lobby/stats/update

# Clear posteffects, flight, and accidental player deco tags
posteffect remove @a gourd_guard:cutscene_fade
posteffect remove @a gourd_guard:fade_black
tag @a remove gg_npc_deco
function gourd_guard:fly/disable

# --- 3. Announcement ---
tellraw @a [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"All lobby leaderboard records and game statistics have been reset!","color":"green","bold":true}]
