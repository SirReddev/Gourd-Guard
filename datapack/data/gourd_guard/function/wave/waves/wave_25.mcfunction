# Wave 25 Spawning Sequence
# Total spawns: 30 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 25","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 26 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 42 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 58 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 122 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 138 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 154 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 186 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 202 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 234 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 266 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 271 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 282 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 298 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 314 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 315 run scoreboard players set .wave spawn_done 1
