# Wave 11 Spawning Sequence
# Total spawns: 30 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 11","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"WARNING: Camo Stealth Mobs Detected!","color":"light_purple"}
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/grunt {path:1}
execute if score .wave spawn_timer matches 23 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 26 run function gourd_guard:wave/spawn/grunt {path:2}
execute if score .wave spawn_timer matches 42 run function gourd_guard:wave/spawn/grunt {path:1}
execute if score .wave spawn_timer matches 45 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 58 run function gourd_guard:wave/spawn/grunt {path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 67 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/grunt {path:1}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 89 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/grunt {path:2}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/grunt {path:1}
execute if score .wave spawn_timer matches 111 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 122 run function gourd_guard:wave/spawn/grunt {path:2}
execute if score .wave spawn_timer matches 133 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 138 run function gourd_guard:wave/spawn/grunt {path:1}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/camo_runner {path:1}
execute if score .wave spawn_timer matches 154 run function gourd_guard:wave/spawn/grunt {path:2}
execute if score .wave spawn_timer matches 155 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/camo_runner {path:2}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/grunt {path:1}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 186 run function gourd_guard:wave/spawn/grunt {path:2}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 202 run function gourd_guard:wave/spawn/grunt {path:1}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/grunt {path:2}
execute if score .wave spawn_timer matches 219 run scoreboard players set .wave spawn_done 1
