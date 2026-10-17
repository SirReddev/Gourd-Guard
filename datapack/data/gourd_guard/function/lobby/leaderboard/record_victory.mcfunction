# gourd_guard:lobby/leaderboard/record_victory
# Records the completion time when players win the game

function gourd_guard:lobby/leaderboard/init

# Compute total seconds of current victory run
scoreboard players operation #curr_tot gg_rc_tot = .global timer_min
scoreboard players set #c60 dummy 60
scoreboard players operation #curr_tot gg_rc_tot *= #c60 dummy
scoreboard players operation #curr_tot gg_rc_tot += .global timer_sec

# Store as last run
scoreboard players operation #last gg_rc_min = .global timer_min
scoreboard players operation #last gg_rc_sec = .global timer_sec
scoreboard players operation #last gg_rc_tot = #curr_tot gg_rc_tot
scoreboard players operation #last gg_rc_map = .global map

# Check map records (Map 1..5)
execute if score .global map matches 1 run function gourd_guard:lobby/leaderboard/check_map {target:"#m1",map:1}
execute if score .global map matches 2 run function gourd_guard:lobby/leaderboard/check_map {target:"#m2",map:2}
execute if score .global map matches 3 run function gourd_guard:lobby/leaderboard/check_map {target:"#m3",map:3}
execute if score .global map matches 4 run function gourd_guard:lobby/leaderboard/check_map {target:"#m4",map:4}
execute if score .global map matches 5 run function gourd_guard:lobby/leaderboard/check_map {target:"#m5",map:5}

# Check global best run record
execute if score #curr_tot gg_rc_tot matches 1.. if score #curr_tot gg_rc_tot < #global gg_rc_tot run function gourd_guard:lobby/leaderboard/set_global
execute if score #curr_tot gg_rc_tot matches 1.. unless score #global gg_rc_tot matches 1.. run function gourd_guard:lobby/leaderboard/set_global

# Refresh all leaderboard displays
function gourd_guard:lobby/leaderboard/update
