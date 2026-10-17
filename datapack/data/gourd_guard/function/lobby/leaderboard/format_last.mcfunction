# gourd_guard:lobby/leaderboard/format_last
# Formats last completed run

execute unless score #last gg_rc_tot matches 1.. run data modify storage gourd_guard:leaderboard macro.last_str set value "--:--"
execute unless score #last gg_rc_tot matches 1.. return 1

execute store result storage gourd_guard:leaderboard temp_last.min int 1 run scoreboard players get #last gg_rc_min
execute store result storage gourd_guard:leaderboard temp_last.sec int 1 run scoreboard players get #last gg_rc_sec
execute store result storage gourd_guard:leaderboard temp_last.map int 1 run scoreboard players get #last gg_rc_map

function gourd_guard:lobby/leaderboard/format_last_apply with storage gourd_guard:leaderboard temp_last
