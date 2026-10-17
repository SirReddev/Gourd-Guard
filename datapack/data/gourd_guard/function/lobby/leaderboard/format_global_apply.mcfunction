# gourd_guard:lobby/leaderboard/format_global_apply
# Macro args: {min: 4, sec: 8, map: 1}

execute store result score #sec_chk dummy run data get storage gourd_guard:leaderboard temp_gl.sec

$execute if score #sec_chk dummy matches 0..9 run data modify storage gourd_guard:leaderboard macro.gl_str set value "$(min):0$(sec) (Map $(map))"
$execute if score #sec_chk dummy matches 10.. run data modify storage gourd_guard:leaderboard macro.gl_str set value "$(min):$(sec) (Map $(map))"
