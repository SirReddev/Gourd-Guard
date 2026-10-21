# Wave 12 Spawning Sequence
# Total spawns: 24 mobs across Castle Path & Graveyard Path
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 12","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 17 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 33 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 40 run function gourd_guard:wave/spawn/runner {map:1,path:1}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 58 run function gourd_guard:wave/spawn/runner {map:1,path:2}
execute if score .wave spawn_timer matches 65 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 76 run function gourd_guard:wave/spawn/runner {map:1,path:1}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 94 run function gourd_guard:wave/spawn/runner {map:1,path:2}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 112 run function gourd_guard:wave/spawn/runner {map:1,path:1}
execute if score .wave spawn_timer matches 113 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 129 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 130 run function gourd_guard:wave/spawn/runner {map:1,path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 148 run function gourd_guard:wave/spawn/runner {map:1,path:1}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 166 run function gourd_guard:wave/spawn/runner {map:1,path:2}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 209 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 242 run scoreboard players set .wave spawn_done 1
