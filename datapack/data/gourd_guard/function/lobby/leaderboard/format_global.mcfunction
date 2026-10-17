# gourd_guard:lobby/leaderboard/format_global
# Formats global best run record

execute unless score #global gg_rc_tot matches 1.. run data modify storage gourd_guard:leaderboard macro.gl_str set value "--:--"
execute unless score #global gg_rc_tot matches 1.. return 1

execute store result storage gourd_guard:leaderboard temp_gl.min int 1 run scoreboard players get #global gg_rc_min
execute store result storage gourd_guard:leaderboard temp_gl.sec int 1 run scoreboard players get #global gg_rc_sec
execute store result storage gourd_guard:leaderboard temp_gl.map int 1 run scoreboard players get #global gg_rc_map

function gourd_guard:lobby/leaderboard/format_global_apply with storage gourd_guard:leaderboard temp_gl
