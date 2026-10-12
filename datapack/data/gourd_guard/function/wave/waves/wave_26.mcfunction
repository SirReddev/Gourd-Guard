# Wave 26 Spawning Sequence
# Total spawns: 46 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 26","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/guardian {map:1,path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 21 run function gourd_guard:wave/spawn/guardian {map:1,path:2}
execute if score .wave spawn_timer matches 25 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 40 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 41 run function gourd_guard:wave/spawn/guardian {map:1,path:1}
execute if score .wave spawn_timer matches 55 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/guardian {map:1,path:2}
execute if score .wave spawn_timer matches 70 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 76 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/guardian {map:1,path:1}
execute if score .wave spawn_timer matches 85 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 92 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 101 run function gourd_guard:wave/spawn/guardian {map:1,path:2}
execute if score .wave spawn_timer matches 108 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 115 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/guardian {map:1,path:1}
execute if score .wave spawn_timer matches 124 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 130 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 141 run function gourd_guard:wave/spawn/guardian {map:1,path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 156 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/guardian {map:1,path:1}
execute if score .wave spawn_timer matches 172 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 175 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/guardian {map:1,path:2}
execute if score .wave spawn_timer matches 188 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 190 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 201 run function gourd_guard:wave/spawn/guardian {map:1,path:1}
execute if score .wave spawn_timer matches 204 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 205 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 221 run function gourd_guard:wave/spawn/guardian {map:1,path:2}
execute if score .wave spawn_timer matches 235 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/guardian {map:1,path:1}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 261 run function gourd_guard:wave/spawn/guardian {map:1,path:2}
execute if score .wave spawn_timer matches 265 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 280 run function gourd_guard:wave/spawn/drowned {map:1,path:1}
execute if score .wave spawn_timer matches 281 run function gourd_guard:wave/spawn/guardian {map:1,path:1}
execute if score .wave spawn_timer matches 295 run function gourd_guard:wave/spawn/drowned {map:1,path:2}
execute if score .wave spawn_timer matches 301 run function gourd_guard:wave/spawn/guardian {map:1,path:2}
execute if score .wave spawn_timer matches 302 run scoreboard players set .wave spawn_done 1
