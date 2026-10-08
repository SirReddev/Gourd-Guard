# Wave 28 Spawning Sequence
# Total spawns: 48 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 28","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 17 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 33 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 50 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 65 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 70 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 76 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 92 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 108 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 113 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 124 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 129 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 130 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 156 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 172 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 188 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 190 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 204 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 209 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 230 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 236 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 252 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 257 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 268 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 270 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 273 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 289 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 290 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 305 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 306 run scoreboard players set .wave spawn_done 1
