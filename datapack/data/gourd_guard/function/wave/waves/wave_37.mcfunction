# Wave 37 Spawning Sequence
# Total spawns: 63 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 37","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 16 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 24 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 38 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 38 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 46 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 52 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 56 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 66 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 76 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 92 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 94 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 108 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 122 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 128 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 146 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 166 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 178 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 182 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 192 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 196 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 206 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 226 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 234 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 236 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 248 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 254 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 256 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 262 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 271 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 272 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 276 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 286 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 290 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 290 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 301 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 304 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 316 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 318 run function gourd_guard:wave/spawn/brute {map:1,path:1}
execute if score .wave spawn_timer matches 332 run function gourd_guard:wave/spawn/brute {map:1,path:2}
execute if score .wave spawn_timer matches 350 run function gourd_guard:wave/spawn/boss_warden {map:1,path:2}
execute if score .wave spawn_timer matches 350 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 350 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Harbinger of the Void ","color":"yellow","bold":true},{"text":"has spawned on Path 2!","color":"gray"}]
execute if score .wave spawn_timer matches 351 run scoreboard players set .wave spawn_done 1
