# Wave 39 Spawning Sequence
# Total spawns: 72 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 39","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 12 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 15 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 23 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 34 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 36 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 45 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 45 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 52 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 56 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 67 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 68 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 75 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 78 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 84 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 89 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 105 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 111 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 116 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 122 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 132 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 133 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 135 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 144 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 148 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 155 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 165 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 166 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 188 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 195 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 196 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 212 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 221 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 228 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 232 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 240 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 243 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 244 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 254 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 255 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 260 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 265 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 270 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 276 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 276 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 285 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 287 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 292 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 298 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 300 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 309 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 320 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 320 run function gourd_guard:wave/spawn/boss_warden {map:1,path:1}
execute if score .wave spawn_timer matches 320 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 320 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Harbinger of the Void ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 331 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 342 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 350 run function gourd_guard:wave/spawn/boss_elder {map:1,path:2}
execute if score .wave spawn_timer matches 350 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 350 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Leviathan of the Depths ","color":"yellow","bold":true},{"text":"has spawned on Path 2!","color":"gray"}]
execute if score .wave spawn_timer matches 351 run scoreboard players set .wave spawn_done 1
