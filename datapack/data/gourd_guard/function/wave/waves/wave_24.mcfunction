# Wave 24 Spawning Sequence
# Total spawns: 44 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 24","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/evoker {path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/vindicator {path:1}
execute if score .wave spawn_timer matches 25 run function gourd_guard:wave/spawn/evoker {path:2}
execute if score .wave spawn_timer matches 26 run function gourd_guard:wave/spawn/vindicator {path:2}
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 42 run function gourd_guard:wave/spawn/vindicator {path:1}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/evoker {path:1}
execute if score .wave spawn_timer matches 52 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 58 run function gourd_guard:wave/spawn/vindicator {path:2}
execute if score .wave spawn_timer matches 73 run function gourd_guard:wave/spawn/evoker {path:2}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/vindicator {path:1}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/vindicator {path:2}
execute if score .wave spawn_timer matches 96 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/evoker {path:1}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/vindicator {path:1}
execute if score .wave spawn_timer matches 118 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/evoker {path:2}
execute if score .wave spawn_timer matches 122 run function gourd_guard:wave/spawn/vindicator {path:2}
execute if score .wave spawn_timer matches 138 run function gourd_guard:wave/spawn/vindicator {path:1}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/evoker {path:1}
execute if score .wave spawn_timer matches 154 run function gourd_guard:wave/spawn/vindicator {path:2}
execute if score .wave spawn_timer matches 162 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 169 run function gourd_guard:wave/spawn/evoker {path:2}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/vindicator {path:1}
execute if score .wave spawn_timer matches 184 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 186 run function gourd_guard:wave/spawn/vindicator {path:2}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/evoker {path:1}
execute if score .wave spawn_timer matches 202 run function gourd_guard:wave/spawn/vindicator {path:1}
execute if score .wave spawn_timer matches 206 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 217 run function gourd_guard:wave/spawn/evoker {path:2}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/vindicator {path:2}
execute if score .wave spawn_timer matches 228 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 234 run function gourd_guard:wave/spawn/vindicator {path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/evoker {path:1}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/vindicator {path:2}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/camo_grunt {path:1}
execute if score .wave spawn_timer matches 265 run function gourd_guard:wave/spawn/evoker {path:2}
execute if score .wave spawn_timer matches 266 run function gourd_guard:wave/spawn/vindicator {path:1}
execute if score .wave spawn_timer matches 272 run function gourd_guard:wave/spawn/camo_grunt {path:2}
execute if score .wave spawn_timer matches 282 run function gourd_guard:wave/spawn/vindicator {path:2}
execute if score .wave spawn_timer matches 289 run function gourd_guard:wave/spawn/evoker {path:1}
execute if score .wave spawn_timer matches 313 run function gourd_guard:wave/spawn/evoker {path:2}
execute if score .wave spawn_timer matches 314 run scoreboard players set .wave spawn_done 1
