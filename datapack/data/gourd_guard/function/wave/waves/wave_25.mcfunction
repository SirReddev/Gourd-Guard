# Wave 25 Spawning Sequence
# Total spawns: 24 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 25","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 15 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 33 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 46 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 51 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 69 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 87 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 105 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 123 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 141 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 159 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 195 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 213 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 226 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 231 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 249 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 267 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 285 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 303 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 321 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 322 run scoreboard players set .wave spawn_done 1
