# Wave 17 Spawning Sequence
# Total spawns: 42 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 17","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 17 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 33 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 40 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 50 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 65 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 70 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 113 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 129 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 130 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 190 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 209 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 230 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 240 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 257 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 273 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 274 run scoreboard players set .wave spawn_done 1
