# Wave 19 Spawning Sequence
# Total spawns: 46 mobs across Castle Path & Graveyard Path
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 19","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 19 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 37 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 38 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 40 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 55 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 56 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 73 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 92 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 109 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 127 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 128 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 146 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 163 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 182 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 217 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 235 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 236 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 240 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 253 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 254 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 260 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 271 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 272 run function gourd_guard:wave/spawn/husk {map:1,path:1}
execute if score .wave spawn_timer matches 289 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 290 run function gourd_guard:wave/spawn/husk {map:1,path:2}
execute if score .wave spawn_timer matches 307 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 308 run scoreboard players set .wave spawn_done 1
