# Wave 38 Spawning Sequence
# Total spawns: 52 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 38","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 13 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 15 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 25 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 37 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 47 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 63 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 73 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 79 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 85 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 95 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 109 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 111 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 127 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 133 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 143 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 157 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 159 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 169 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 175 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 191 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 205 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 207 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 217 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 223 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 229 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 239 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 253 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 255 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 265 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 271 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 277 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 287 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 289 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 301 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 303 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 310 run function gourd_guard:wave/spawn/boss_titan {path:1}
execute if score .wave spawn_timer matches 310 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 310 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Nether Titan ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 313 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 319 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 325 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 330 run function gourd_guard:wave/spawn/boss_titan {path:2}
execute if score .wave spawn_timer matches 330 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 330 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Nether Titan ","color":"yellow","bold":true},{"text":"has spawned on Path 2!","color":"gray"}]
execute if score .wave spawn_timer matches 337 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 349 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 350 run scoreboard players set .wave spawn_done 1
