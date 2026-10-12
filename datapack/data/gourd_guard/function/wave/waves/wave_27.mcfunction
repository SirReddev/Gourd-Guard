# Wave 27 Spawning Sequence
# Total spawns: 28 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 27","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 38 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 51 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 56 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 92 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 101 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 128 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 146 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 182 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 201 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 230 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 236 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 251 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 254 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 272 run function gourd_guard:wave/spawn/witch {map:1,path:1}
execute if score .wave spawn_timer matches 290 run function gourd_guard:wave/spawn/witch {map:1,path:2}
execute if score .wave spawn_timer matches 291 run scoreboard players set .wave spawn_done 1
