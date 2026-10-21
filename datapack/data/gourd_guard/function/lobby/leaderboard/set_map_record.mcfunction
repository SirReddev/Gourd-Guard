# gourd_guard:lobby/leaderboard/set_map_record
# Macro args: {target: "#m1", map: 1}

$scoreboard players operation $(target) gg_rc_min = .global timer_min
$scoreboard players operation $(target) gg_rc_sec = .global timer_sec
$scoreboard players operation $(target) gg_rc_tot = #curr_tot gg_rc_tot

tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"★ NEW RECORD SET! ★","color":"yellow","bold":true}]
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.0 1.0
