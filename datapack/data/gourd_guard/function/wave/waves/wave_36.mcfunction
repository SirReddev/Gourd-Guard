# Wave 36 Spawning Sequence
# Total spawns: 33 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 36","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/guardian {path:1}
execute if score .wave spawn_timer matches 17 run function gourd_guard:wave/spawn/guardian {path:2}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/ghast {path:1}
execute if score .wave spawn_timer matches 33 run function gourd_guard:wave/spawn/guardian {path:1}
execute if score .wave spawn_timer matches 45 run function gourd_guard:wave/spawn/ghast {path:2}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/guardian {path:2}
execute if score .wave spawn_timer matches 65 run function gourd_guard:wave/spawn/guardian {path:1}
execute if score .wave spawn_timer matches 70 run function gourd_guard:wave/spawn/ghast {path:1}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/guardian {path:2}
execute if score .wave spawn_timer matches 95 run function gourd_guard:wave/spawn/ghast {path:2}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/guardian {path:1}
execute if score .wave spawn_timer matches 113 run function gourd_guard:wave/spawn/guardian {path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/ghast {path:1}
execute if score .wave spawn_timer matches 129 run function gourd_guard:wave/spawn/guardian {path:1}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/guardian {path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/ghast {path:2}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/guardian {path:1}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/ghast {path:1}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/guardian {path:2}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/guardian {path:1}
execute if score .wave spawn_timer matches 195 run function gourd_guard:wave/spawn/ghast {path:2}
execute if score .wave spawn_timer matches 209 run function gourd_guard:wave/spawn/guardian {path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/ghast {path:1}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/guardian {path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/guardian {path:2}
execute if score .wave spawn_timer matches 245 run function gourd_guard:wave/spawn/ghast {path:2}
execute if score .wave spawn_timer matches 257 run function gourd_guard:wave/spawn/guardian {path:1}
execute if score .wave spawn_timer matches 270 run function gourd_guard:wave/spawn/ghast {path:1}
execute if score .wave spawn_timer matches 273 run function gourd_guard:wave/spawn/guardian {path:2}
execute if score .wave spawn_timer matches 289 run function gourd_guard:wave/spawn/guardian {path:1}
execute if score .wave spawn_timer matches 295 run function gourd_guard:wave/spawn/ghast {path:2}
execute if score .wave spawn_timer matches 305 run function gourd_guard:wave/spawn/guardian {path:2}
execute if score .wave spawn_timer matches 330 run function gourd_guard:wave/spawn/boss_warden {path:1}
execute if score .wave spawn_timer matches 330 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 330 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Harbinger of the Void ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 331 run scoreboard players set .wave spawn_done 1
