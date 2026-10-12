# Wave 7 Spawning Sequence
# Total spawns: 20 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 7","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 16 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 46 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 76 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 166 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 196 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 226 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 256 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 271 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 286 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 287 run scoreboard players set .wave spawn_done 1
