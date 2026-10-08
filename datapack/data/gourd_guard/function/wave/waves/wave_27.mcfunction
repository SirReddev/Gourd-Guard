# Wave 27 Spawning Sequence
# Total spawns: 52 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 27","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 17 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 33 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 42 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 48 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 64 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 65 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 66 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 84 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 86 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 102 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 108 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 113 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 129 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 130 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 138 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 152 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 156 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 174 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 174 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 192 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 196 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 209 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 228 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 240 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 246 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 257 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 262 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 264 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 273 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 282 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 284 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 289 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 300 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 305 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 306 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 321 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 337 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 338 run scoreboard players set .wave spawn_done 1
