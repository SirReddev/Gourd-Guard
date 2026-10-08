# Wave 9 Spawning Sequence
# Total spawns: 40 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 9","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 11 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 21 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 40 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 41 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 51 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 71 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 101 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 111 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 131 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 141 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 171 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 191 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 201 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 221 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 231 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 240 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/swarm {path:1}
execute if score .wave spawn_timer matches 251 run function gourd_guard:wave/spawn/swarm {path:2}
execute if score .wave spawn_timer matches 260 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 280 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 300 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 301 run scoreboard players set .wave spawn_done 1
