# gourd_guard:lobby/leaderboard/set_global
# Sets new overall global record

scoreboard players operation #global gg_rc_min = .global timer_min
scoreboard players operation #global gg_rc_sec = .global timer_sec
scoreboard players operation #global gg_rc_tot = #curr_tot gg_rc_tot
scoreboard players operation #global gg_rc_map = .global map

tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"★ NEW ALL-TIME GLOBAL RECORD CLEARED! ★","color":"green","bold":true}]
