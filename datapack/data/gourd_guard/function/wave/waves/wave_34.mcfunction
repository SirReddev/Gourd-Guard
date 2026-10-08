# Wave 34 Spawning Sequence
# Total spawns: 49 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 34","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"Defend the Gourd!","color":"gray"}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 13 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 25 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 34 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 37 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 48 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 62 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 73 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 76 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 85 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 104 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 109 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 118 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 132 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 133 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 146 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 157 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 169 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 174 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 188 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 202 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 205 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 216 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 217 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 229 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 230 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 241 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 244 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 253 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 258 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 265 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 272 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 277 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 286 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 289 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 301 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 310 run function gourd_guard:wave/spawn/boss_elder {map:1,path:2}
execute if score .wave spawn_timer matches 310 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 310 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Leviathan of the Depths ","color":"yellow","bold":true},{"text":"has spawned on Path 2!","color":"gray"}]
execute if score .wave spawn_timer matches 313 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 325 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 326 run scoreboard players set .wave spawn_done 1
