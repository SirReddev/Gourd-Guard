# Wave 18 Spawning Sequence
# Total spawns: 32 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 18","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 23 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 26 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 42 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 45 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 58 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 67 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 89 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 111 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 122 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 133 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 138 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 154 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 155 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 186 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 202 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 221 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 234 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 243 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 265 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 266 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 282 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 287 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 288 run scoreboard players set .wave spawn_done 1
