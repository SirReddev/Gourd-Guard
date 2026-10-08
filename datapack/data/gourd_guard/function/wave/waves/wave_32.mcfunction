# Wave 32 Spawning Sequence
# Total spawns: 28 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 32","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/boss_ravager {map:1,path:1}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 1 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Beast of the Mire ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 38 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 56 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 75 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 92 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 105 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 128 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 135 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 141 run function gourd_guard:wave/spawn/boss_ravager {map:1,path:2}
execute if score .wave spawn_timer matches 141 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 141 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Beast of the Mire ","color":"yellow","bold":true},{"text":"has spawned on Path 2!","color":"gray"}]
execute if score .wave spawn_timer matches 146 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 165 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 182 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 195 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/camo_runner {map:1,path:1}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/camo_runner {map:1,path:2}
execute if score .wave spawn_timer matches 236 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 254 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 255 run scoreboard players set .wave spawn_done 1
