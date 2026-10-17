# gourd_guard:lobby/stats/update
# Refreshes and updates all active statistics text displays in the world

function gourd_guard:lobby/stats/init

# Compute Win Rate %: (wins * 100) / plays (or 0 if plays == 0)
scoreboard players set #100 gg_stats 100
scoreboard players operation #stats_rate gg_stats = #stats_wins gg_stats
scoreboard players operation #stats_rate gg_stats *= #100 gg_stats
execute if score #stats_plays gg_stats matches 1.. run scoreboard players operation #stats_rate gg_stats /= #stats_plays gg_stats
execute unless score #stats_plays gg_stats matches 1.. run scoreboard players set #stats_rate gg_stats 0

# Store values into macro storage
execute store result storage gourd_guard:stats macro.plays int 1 run scoreboard players get #stats_plays gg_stats
execute store result storage gourd_guard:stats macro.wins int 1 run scoreboard players get #stats_wins gg_stats
execute store result storage gourd_guard:stats macro.fails int 1 run scoreboard players get #stats_fails gg_stats
execute store result storage gourd_guard:stats macro.rate int 1 run scoreboard players get #stats_rate gg_stats

# Apply display
function gourd_guard:lobby/stats/apply_display with storage gourd_guard:stats macro
