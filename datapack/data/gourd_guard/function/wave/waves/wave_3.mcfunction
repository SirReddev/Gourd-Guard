# Wave 3 Spawning Sequence
# Total spawns: 22 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 3","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 16 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 46 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 76 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 166 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 195 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 196 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 226 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 245 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 246 run scoreboard players set .wave spawn_done 1
