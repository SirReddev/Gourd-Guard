# Wave 5 Spawning Sequence
# Total spawns: 24 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 5","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/skeleton {map:1,path:1}
execute if score .wave spawn_timer matches 19 run function gourd_guard:wave/spawn/skeleton {map:1,path:2}
execute if score .wave spawn_timer matches 37 run function gourd_guard:wave/spawn/skeleton {map:1,path:1}
execute if score .wave spawn_timer matches 55 run function gourd_guard:wave/spawn/skeleton {map:1,path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 73 run function gourd_guard:wave/spawn/skeleton {map:1,path:1}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/skeleton {map:1,path:2}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 109 run function gourd_guard:wave/spawn/skeleton {map:1,path:1}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 127 run function gourd_guard:wave/spawn/skeleton {map:1,path:2}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/skeleton {map:1,path:1}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 163 run function gourd_guard:wave/spawn/skeleton {map:1,path:2}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/skeleton {map:1,path:1}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/skeleton {map:1,path:2}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 217 run function gourd_guard:wave/spawn/skeleton {map:1,path:1}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 235 run function gourd_guard:wave/spawn/skeleton {map:1,path:2}
execute if score .wave spawn_timer matches 240 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 241 run scoreboard players set .wave spawn_done 1
