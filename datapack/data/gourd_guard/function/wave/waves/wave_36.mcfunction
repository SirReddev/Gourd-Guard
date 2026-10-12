# Wave 36 Spawning Sequence
# Total spawns: 20 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 36","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/boss_titan {map:1,path:1}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 1 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Nether Titan ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 85 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 135 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/boss_titan {map:1,path:2}
execute if score .wave spawn_timer matches 151 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 151 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Nether Titan ","color":"yellow","bold":true},{"text":"has spawned on Path 2!","color":"gray"}]
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 185 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 235 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 240 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 270 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 300 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 301 run scoreboard players set .wave spawn_done 1
