# Wave 26 Spawning Sequence
# Total spawns: 38 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 26","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/camo_spider {path:1}
execute if score .wave spawn_timer matches 15 run function gourd_guard:wave/spawn/camo_spider {path:2}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 29 run function gourd_guard:wave/spawn/camo_spider {path:1}
execute if score .wave spawn_timer matches 32 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 43 run function gourd_guard:wave/spawn/camo_spider {path:2}
execute if score .wave spawn_timer matches 44 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 56 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 57 run function gourd_guard:wave/spawn/camo_spider {path:1}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/ghost {path:1}
execute if score .wave spawn_timer matches 68 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 71 run function gourd_guard:wave/spawn/camo_spider {path:2}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 85 run function gourd_guard:wave/spawn/camo_spider {path:1}
execute if score .wave spawn_timer matches 85 run function gourd_guard:wave/spawn/ghost {path:2}
execute if score .wave spawn_timer matches 92 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 99 run function gourd_guard:wave/spawn/camo_spider {path:2}
execute if score .wave spawn_timer matches 104 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/ghost {path:1}
execute if score .wave spawn_timer matches 113 run function gourd_guard:wave/spawn/camo_spider {path:1}
execute if score .wave spawn_timer matches 116 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 127 run function gourd_guard:wave/spawn/camo_spider {path:2}
execute if score .wave spawn_timer matches 128 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 135 run function gourd_guard:wave/spawn/ghost {path:2}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 141 run function gourd_guard:wave/spawn/camo_spider {path:1}
execute if score .wave spawn_timer matches 152 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 155 run function gourd_guard:wave/spawn/camo_spider {path:2}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/ghost {path:1}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 169 run function gourd_guard:wave/spawn/camo_spider {path:1}
execute if score .wave spawn_timer matches 176 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 183 run function gourd_guard:wave/spawn/camo_spider {path:2}
execute if score .wave spawn_timer matches 185 run function gourd_guard:wave/spawn/ghost {path:2}
execute if score .wave spawn_timer matches 197 run function gourd_guard:wave/spawn/camo_spider {path:1}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/camo_spider {path:2}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/camo_spider {path:1}
execute if score .wave spawn_timer matches 239 run function gourd_guard:wave/spawn/camo_spider {path:2}
execute if score .wave spawn_timer matches 240 run scoreboard players set .wave spawn_done 1
