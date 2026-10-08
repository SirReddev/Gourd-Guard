# Wave 32 Spawning Sequence
# Total spawns: 33 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 32","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 15 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 23 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 45 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 47 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 63 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 67 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 79 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 89 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 95 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 111 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 111 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 127 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 133 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 143 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 155 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 159 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 175 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 191 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 207 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 221 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 223 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 239 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 243 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 255 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 265 run function gourd_guard:wave/spawn/ghast {map:1,path:1}
execute if score .wave spawn_timer matches 271 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 287 run function gourd_guard:wave/spawn/ghast {map:1,path:2}
execute if score .wave spawn_timer matches 287 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 320 run function gourd_guard:wave/spawn/boss_titan {map:1,path:1}
execute if score .wave spawn_timer matches 320 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 320 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Nether Titan ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 321 run scoreboard players set .wave spawn_done 1
