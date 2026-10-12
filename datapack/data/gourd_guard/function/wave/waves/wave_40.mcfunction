# Wave 40 Spawning Sequence
# Total spawns: 25 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 40","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.ender_dragon.growl hostile @a ~ ~ ~ 1.0 0.6 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/boss_final {map:1,path:1}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 1 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"THE GOURD COLOSSUS ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 35 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 50 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 65 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 95 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/boss_titan {map:1,path:2}
execute if score .wave spawn_timer matches 100 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 100 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Nether Titan ","color":"yellow","bold":true},{"text":"has spawned on Path 2!","color":"gray"}]
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 125 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 140 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 155 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 185 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/boss_warden {map:1,path:1}
execute if score .wave spawn_timer matches 200 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 200 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Harbinger of the Void ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 215 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/boss_titan {map:1,path:2}
execute if score .wave spawn_timer matches 220 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 220 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Nether Titan ","color":"yellow","bold":true},{"text":"has spawned on Path 2!","color":"gray"}]
execute if score .wave spawn_timer matches 230 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 245 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 260 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 275 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 290 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 305 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 340 run function gourd_guard:wave/spawn/boss_warden {map:1,path:1}
execute if score .wave spawn_timer matches 340 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 340 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Harbinger of the Void ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 341 run scoreboard players set .wave spawn_done 1
