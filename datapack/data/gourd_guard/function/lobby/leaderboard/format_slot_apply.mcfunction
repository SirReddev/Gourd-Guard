# gourd_guard:lobby/leaderboard/format_slot_apply
# Macro args: {id: "m1", min: 4, sec: 8}

execute store result score #sec_chk dummy run data get storage gourd_guard:leaderboard temp.sec

# If sec < 10, pad with a leading zero
$execute if score #sec_chk dummy matches 0..9 run data modify storage gourd_guard:leaderboard macro.$(id)_str set value "$(min):0$(sec)"

# If sec >= 10, no padding needed
$execute if score #sec_chk dummy matches 10.. run data modify storage gourd_guard:leaderboard macro.$(id)_str set value "$(min):$(sec)"
