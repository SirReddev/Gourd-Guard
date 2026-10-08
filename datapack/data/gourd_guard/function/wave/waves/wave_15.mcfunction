# Wave 15 Spawning Sequence
# Total spawns: 28 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 15","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 21 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/phantom {map:1,path:1}
execute if score .wave spawn_timer matches 41 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 52 run function gourd_guard:wave/spawn/phantom {map:1,path:2}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/phantom {map:1,path:1}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 96 run function gourd_guard:wave/spawn/phantom {map:1,path:2}
execute if score .wave spawn_timer matches 101 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 118 run function gourd_guard:wave/spawn/phantom {map:1,path:1}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/phantom {map:1,path:2}
execute if score .wave spawn_timer matches 141 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 162 run function gourd_guard:wave/spawn/phantom {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 184 run function gourd_guard:wave/spawn/phantom {map:1,path:2}
execute if score .wave spawn_timer matches 201 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 206 run function gourd_guard:wave/spawn/phantom {map:1,path:1}
execute if score .wave spawn_timer matches 221 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 228 run function gourd_guard:wave/spawn/phantom {map:1,path:2}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/phantom {map:1,path:1}
execute if score .wave spawn_timer matches 261 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 272 run function gourd_guard:wave/spawn/phantom {map:1,path:2}
execute if score .wave spawn_timer matches 281 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 301 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 302 run scoreboard players set .wave spawn_done 1
