# Wave 20 Spawning Sequence
# Total spawns: 37 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 20","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"BOSS WAVE!","color":"red"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.wither.spawn hostile @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 16 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 46 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 48 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 66 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 76 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 84 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 102 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 138 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 156 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 166 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 196 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:1}
execute if score .wave spawn_timer matches 226 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 240 run function gourd_guard:wave/spawn/camo_grunt {map:1,path:2}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/piglin {map:1,path:1}
execute if score .wave spawn_timer matches 256 run function gourd_guard:wave/spawn/piglin {map:1,path:2}
execute if score .wave spawn_timer matches 300 run function gourd_guard:wave/spawn/boss_ravager {map:1,path:2}
execute if score .wave spawn_timer matches 300 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 300 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Beast of the Mire ","color":"yellow","bold":true},{"text":"has spawned on Path 2!","color":"gray"}]
execute if score .wave spawn_timer matches 301 run scoreboard players set .wave spawn_done 1
