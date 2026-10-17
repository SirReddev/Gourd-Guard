# gourd_guard:lobby/leaderboard/check_map
# Macro args: {target: "#m1", map: 1}

$execute if score #curr_tot gg_rc_tot matches 1.. if score #curr_tot gg_rc_tot < $(target) gg_rc_tot run function gourd_guard:lobby/leaderboard/set_map_record {target:"$(target)",map:$(map)}
$execute if score #curr_tot gg_rc_tot matches 1.. unless score $(target) gg_rc_tot matches 1.. run function gourd_guard:lobby/leaderboard/set_map_record {target:"$(target)",map:$(map)}
