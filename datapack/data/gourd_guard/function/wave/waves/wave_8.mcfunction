# Wave 8 Spawning Sequence
# Total spawns: 28 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 8","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/creeper {path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/spider {path:1}
execute if score .wave spawn_timer matches 23 run function gourd_guard:wave/spawn/creeper {path:2}
execute if score .wave spawn_timer matches 24 run function gourd_guard:wave/spawn/spider {path:2}
execute if score .wave spawn_timer matches 38 run function gourd_guard:wave/spawn/spider {path:1}
execute if score .wave spawn_timer matches 45 run function gourd_guard:wave/spawn/creeper {path:1}
execute if score .wave spawn_timer matches 52 run function gourd_guard:wave/spawn/spider {path:2}
execute if score .wave spawn_timer matches 66 run function gourd_guard:wave/spawn/spider {path:1}
execute if score .wave spawn_timer matches 67 run function gourd_guard:wave/spawn/creeper {path:2}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/spider {path:2}
execute if score .wave spawn_timer matches 89 run function gourd_guard:wave/spawn/creeper {path:1}
execute if score .wave spawn_timer matches 94 run function gourd_guard:wave/spawn/spider {path:1}
execute if score .wave spawn_timer matches 108 run function gourd_guard:wave/spawn/spider {path:2}
execute if score .wave spawn_timer matches 111 run function gourd_guard:wave/spawn/creeper {path:2}
execute if score .wave spawn_timer matches 122 run function gourd_guard:wave/spawn/spider {path:1}
execute if score .wave spawn_timer matches 133 run function gourd_guard:wave/spawn/creeper {path:1}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/spider {path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/spider {path:1}
execute if score .wave spawn_timer matches 155 run function gourd_guard:wave/spawn/creeper {path:2}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/spider {path:2}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/creeper {path:1}
execute if score .wave spawn_timer matches 178 run function gourd_guard:wave/spawn/spider {path:1}
execute if score .wave spawn_timer matches 192 run function gourd_guard:wave/spawn/spider {path:2}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/creeper {path:2}
execute if score .wave spawn_timer matches 206 run function gourd_guard:wave/spawn/spider {path:1}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/spider {path:2}
execute if score .wave spawn_timer matches 221 run function gourd_guard:wave/spawn/creeper {path:1}
execute if score .wave spawn_timer matches 243 run function gourd_guard:wave/spawn/creeper {path:2}
execute if score .wave spawn_timer matches 244 run scoreboard players set .wave spawn_done 1
