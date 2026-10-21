# Wave 6 Spawning Sequence
# Total spawns: 24 mobs across Castle Path & Graveyard Path
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 6","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/phantom {map:1,path:1}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/phantom {map:1,path:2}
execute if score .wave spawn_timer matches 36 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 52 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/phantom {map:1,path:1}
execute if score .wave spawn_timer matches 68 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 84 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/phantom {map:1,path:2}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 116 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/phantom {map:1,path:1}
execute if score .wave spawn_timer matches 132 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 148 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/phantom {map:1,path:2}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/phantom {map:1,path:1}
execute if score .wave spawn_timer matches 196 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/phantom {map:1,path:2}
execute if score .wave spawn_timer matches 212 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 228 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 244 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 260 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 261 run scoreboard players set .wave spawn_done 1
