# Wave 30 Spawning Sequence
# Total spawns: 37 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 30","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"BOSS WAVE!","color":"red"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.wither.spawn hostile @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 16 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 31 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 46 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 50 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 70 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 76 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 130 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 151 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 166 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 190 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 196 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 210 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 226 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 230 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 250 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 256 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 270 run function gourd_guard:wave/spawn/camo_assassin {path:1}
execute if score .wave spawn_timer matches 271 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 286 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 290 run function gourd_guard:wave/spawn/camo_assassin {path:2}
execute if score .wave spawn_timer matches 301 run function gourd_guard:wave/spawn/brute {path:1}
execute if score .wave spawn_timer matches 316 run function gourd_guard:wave/spawn/brute {path:2}
execute if score .wave spawn_timer matches 320 run function gourd_guard:wave/spawn/boss_elder {path:1}
execute if score .wave spawn_timer matches 320 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 320 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Leviathan of the Depths ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 321 run scoreboard players set .wave spawn_done 1
