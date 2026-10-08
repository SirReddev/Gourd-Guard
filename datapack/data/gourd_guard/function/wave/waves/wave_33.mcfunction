# Wave 33 Spawning Sequence
# Total spawns: 42 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 33","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 17 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 25 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 33 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 40 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 55 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 65 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 70 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 85 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 113 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 115 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 129 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 130 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 175 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 190 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 205 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 209 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 235 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 257 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 265 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 273 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 280 run function gourd_guard:wave/spawn/vindicator {map:1,path:1}
execute if score .wave spawn_timer matches 289 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 295 run function gourd_guard:wave/spawn/vindicator {map:1,path:2}
execute if score .wave spawn_timer matches 300 run function gourd_guard:wave/spawn/boss_ravager {map:1,path:1}
execute if score .wave spawn_timer matches 300 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 300 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Beast of the Mire ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 305 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 320 run function gourd_guard:wave/spawn/boss_ravager {map:1,path:2}
execute if score .wave spawn_timer matches 320 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 320 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Beast of the Mire ","color":"yellow","bold":true},{"text":"has spawned on Path 2!","color":"gray"}]
execute if score .wave spawn_timer matches 321 run scoreboard players set .wave spawn_done 1
