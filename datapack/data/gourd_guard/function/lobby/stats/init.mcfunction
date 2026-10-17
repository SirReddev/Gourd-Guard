# gourd_guard:lobby/stats/init
# Initializes scoreboard objectives for statistics tracking

scoreboard objectives add gg_stats dummy
execute unless score #stats_plays gg_stats matches 0.. run scoreboard players set #stats_plays gg_stats 0
execute unless score #stats_wins gg_stats matches 0.. run scoreboard players set #stats_wins gg_stats 0
execute unless score #stats_fails gg_stats matches 0.. run scoreboard players set #stats_fails gg_stats 0
execute unless score #stats_rate gg_stats matches 0.. run scoreboard players set #stats_rate gg_stats 0
execute unless score #game_active gg_stats matches 0.. run scoreboard players set #game_active gg_stats 0
