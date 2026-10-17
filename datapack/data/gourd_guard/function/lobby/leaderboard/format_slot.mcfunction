# gourd_guard:lobby/leaderboard/format_slot
# Macro args: {id: "m1", target: "#m1"}

# Default to --:-- if no record has been set yet
$execute unless score $(target) gg_rc_tot matches 1.. run data modify storage gourd_guard:leaderboard macro.$(id)_str set value "--:--"
$execute unless score $(target) gg_rc_tot matches 1.. return 1

# Extract minutes and seconds into storage
$execute store result storage gourd_guard:leaderboard temp.min int 1 run scoreboard players get $(target) gg_rc_min
$execute store result storage gourd_guard:leaderboard temp.sec int 1 run scoreboard players get $(target) gg_rc_sec
$data modify storage gourd_guard:leaderboard temp.id set value "$(id)"

# Call apply macro with extracted values
function gourd_guard:lobby/leaderboard/format_slot_apply with storage gourd_guard:leaderboard temp
