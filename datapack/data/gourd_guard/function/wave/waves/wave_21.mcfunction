# Wave 21 Spawning Sequence
# Total spawns: 18 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 21","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 19 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 37 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 55 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 73 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 109 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 127 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 163 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 217 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 235 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 253 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 271 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 289 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 307 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 308 run scoreboard players set .wave spawn_done 1
