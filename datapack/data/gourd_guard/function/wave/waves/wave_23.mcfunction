# Wave 23 Spawning Sequence
# Total spawns: 32 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 23","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 24 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 38 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 52 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 66 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 94 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 108 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 122 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 178 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 192 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 206 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 234 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 248 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 262 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 271 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 276 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 290 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 304 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 305 run scoreboard players set .wave spawn_done 1
