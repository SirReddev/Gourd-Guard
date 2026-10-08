# Wave 14 Spawning Sequence
# Total spawns: 32 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 14","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 17 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 33 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 40 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 62 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 65 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 84 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 98 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 113 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 116 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 128 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 129 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 134 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 152 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 172 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 194 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 209 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 216 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 238 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 242 run scoreboard players set .wave spawn_done 1
