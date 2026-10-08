# Wave 10 Spawning Sequence
# Total spawns: 33 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 10","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run title @a subtitle {"text":"BOSS WAVE INCOMING!","color":"red","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.wither.spawn hostile @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 17 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 30 run function gourd_guard:wave/spawn/runner {map:1,path:1}
execute if score .wave spawn_timer matches 33 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 46 run function gourd_guard:wave/spawn/runner {map:1,path:2}
execute if score .wave spawn_timer matches 49 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 62 run function gourd_guard:wave/spawn/runner {map:1,path:1}
execute if score .wave spawn_timer matches 65 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 78 run function gourd_guard:wave/spawn/runner {map:1,path:2}
execute if score .wave spawn_timer matches 78 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 94 run function gourd_guard:wave/spawn/runner {map:1,path:1}
execute if score .wave spawn_timer matches 96 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 97 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/runner {map:1,path:2}
execute if score .wave spawn_timer matches 113 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 114 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 126 run function gourd_guard:wave/spawn/runner {map:1,path:1}
execute if score .wave spawn_timer matches 129 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 132 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 142 run function gourd_guard:wave/spawn/runner {map:1,path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 150 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 168 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 177 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 186 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 193 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 204 run function gourd_guard:wave/spawn/spider {map:1,path:1}
execute if score .wave spawn_timer matches 209 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 222 run function gourd_guard:wave/spawn/spider {map:1,path:2}
execute if score .wave spawn_timer matches 280 run function gourd_guard:wave/spawn/boss_warlord {map:1,path:1}
execute if score .wave spawn_timer matches 280 run playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.0 0.7 1
execute if score .wave spawn_timer matches 280 run tellraw @a [{"text":"[!] ","color":"dark_red"},{"text":"BOSS INCOMING: ","color":"red","bold":true},{"text":"Warlord Malakor ","color":"yellow","bold":true},{"text":"has spawned on Path 1!","color":"gray"}]
execute if score .wave spawn_timer matches 281 run scoreboard players set .wave spawn_done 1
