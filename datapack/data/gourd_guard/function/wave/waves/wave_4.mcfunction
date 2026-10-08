# Wave 4 Spawning Sequence
# Total spawns: 20 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 4","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 19 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 37 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 55 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/runner {path:1}
execute if score .wave spawn_timer matches 73 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 76 run function gourd_guard:wave/spawn/runner {path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 92 run function gourd_guard:wave/spawn/runner {path:1}
execute if score .wave spawn_timer matches 108 run function gourd_guard:wave/spawn/runner {path:2}
execute if score .wave spawn_timer matches 109 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 124 run function gourd_guard:wave/spawn/runner {path:1}
execute if score .wave spawn_timer matches 127 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/runner {path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 156 run function gourd_guard:wave/spawn/runner {path:1}
execute if score .wave spawn_timer matches 163 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 172 run function gourd_guard:wave/spawn/runner {path:2}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/husk {path:1}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/husk {path:2}
execute if score .wave spawn_timer matches 200 run scoreboard players set .wave spawn_done 1
