# Wave 17 Spawning Sequence
# Total spawns: 46 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 17","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 19 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/swarm {map:1,path:1}
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/swarm {map:1,path:2}
execute if score .wave spawn_timer matches 37 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 40 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 40 run function gourd_guard:wave/spawn/swarm {map:1,path:1}
execute if score .wave spawn_timer matches 50 run function gourd_guard:wave/spawn/swarm {map:1,path:2}
execute if score .wave spawn_timer matches 55 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 56 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/swarm {map:1,path:1}
execute if score .wave spawn_timer matches 70 run function gourd_guard:wave/spawn/swarm {map:1,path:2}
execute if score .wave spawn_timer matches 72 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 73 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/swarm {map:1,path:1}
execute if score .wave spawn_timer matches 88 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/swarm {map:1,path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/swarm {map:1,path:1}
execute if score .wave spawn_timer matches 104 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 109 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/swarm {map:1,path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/swarm {map:1,path:1}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 127 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 130 run function gourd_guard:wave/spawn/swarm {map:1,path:2}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/swarm {map:1,path:1}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/swarm {map:1,path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 152 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/swarm {map:1,path:1}
execute if score .wave spawn_timer matches 163 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/swarm {map:1,path:2}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/swarm {map:1,path:1}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 190 run function gourd_guard:wave/spawn/swarm {map:1,path:2}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/swarm {map:1,path:1}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/swarm {map:1,path:2}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 217 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 235 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 236 run scoreboard players set .wave spawn_done 1
