# Wave 22 Spawning Sequence
# Total spawns: 34 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 22","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/camo_phantom {path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 21 run function gourd_guard:wave/spawn/camo_phantom {path:2}
execute if score .wave spawn_timer matches 26 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 41 run function gourd_guard:wave/spawn/camo_phantom {path:1}
execute if score .wave spawn_timer matches 42 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 58 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/camo_phantom {path:2}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/camo_phantom {path:1}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 101 run function gourd_guard:wave/spawn/camo_phantom {path:2}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/camo_phantom {path:1}
execute if score .wave spawn_timer matches 122 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 138 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 141 run function gourd_guard:wave/spawn/camo_phantom {path:2}
execute if score .wave spawn_timer matches 154 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/camo_phantom {path:1}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/camo_phantom {path:2}
execute if score .wave spawn_timer matches 186 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 201 run function gourd_guard:wave/spawn/camo_phantom {path:1}
execute if score .wave spawn_timer matches 202 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 221 run function gourd_guard:wave/spawn/camo_phantom {path:2}
execute if score .wave spawn_timer matches 234 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/camo_phantom {path:1}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 261 run function gourd_guard:wave/spawn/camo_phantom {path:2}
execute if score .wave spawn_timer matches 266 run function gourd_guard:wave/spawn/bogged {path:1}
execute if score .wave spawn_timer matches 281 run function gourd_guard:wave/spawn/camo_phantom {path:1}
execute if score .wave spawn_timer matches 282 run function gourd_guard:wave/spawn/bogged {path:2}
execute if score .wave spawn_timer matches 301 run function gourd_guard:wave/spawn/camo_phantom {path:2}
execute if score .wave spawn_timer matches 302 run scoreboard players set .wave spawn_done 1
