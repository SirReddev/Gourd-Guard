# Wave 37 Spawning Sequence
# Total spawns: 22 mobs across Castle Path & Graveyard Path
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 37","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/boss_elder {map:1,path:1}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 1 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Leviathan of the Depths ","color":"yellow","bold":true},{"text":"has spawned on the Castle Path!","color":"gray"}]
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 36 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 52 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/boss_titan {map:1,path:2}
execute if score .wave spawn_timer matches 60 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 60 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Nether Titan ","color":"yellow","bold":true},{"text":"has spawned on the Graveyard Path!","color":"gray"}]
execute if score .wave spawn_timer matches 68 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 84 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 116 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 132 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 141 run function gourd_guard:wave/spawn/boss_elder {map:1,path:1}
execute if score .wave spawn_timer matches 141 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 141 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Leviathan of the Depths ","color":"yellow","bold":true},{"text":"has spawned on the Castle Path!","color":"gray"}]
execute if score .wave spawn_timer matches 148 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 196 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/boss_titan {map:1,path:2}
execute if score .wave spawn_timer matches 200 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 200 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Nether Titan ","color":"yellow","bold":true},{"text":"has spawned on the Graveyard Path!","color":"gray"}]
execute if score .wave spawn_timer matches 212 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 228 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 244 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 260 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 276 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:1}
execute if score .wave spawn_timer matches 292 run function gourd_guard:wave/spawn/camo_phantom {map:1,path:2}
execute if score .wave spawn_timer matches 293 run scoreboard players set .wave spawn_done 1
