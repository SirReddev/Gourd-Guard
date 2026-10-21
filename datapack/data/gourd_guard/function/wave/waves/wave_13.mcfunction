# Wave 13 Spawning Sequence
# Total spawns: 30 mobs across Castle Path & Graveyard Path
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 13","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 10 run function gourd_guard:wave/spawn/stray {map:1,path:1}
execute if score .wave spawn_timer matches 19 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 26 run function gourd_guard:wave/spawn/stray {map:1,path:2}
execute if score .wave spawn_timer matches 37 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 42 run function gourd_guard:wave/spawn/stray {map:1,path:1}
execute if score .wave spawn_timer matches 55 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 58 run function gourd_guard:wave/spawn/stray {map:1,path:2}
execute if score .wave spawn_timer matches 73 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/stray {map:1,path:1}
execute if score .wave spawn_timer matches 90 run function gourd_guard:wave/spawn/stray {map:1,path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 100 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 106 run function gourd_guard:wave/spawn/stray {map:1,path:1}
execute if score .wave spawn_timer matches 109 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 122 run function gourd_guard:wave/spawn/stray {map:1,path:2}
execute if score .wave spawn_timer matches 127 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 130 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 138 run function gourd_guard:wave/spawn/stray {map:1,path:1}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 154 run function gourd_guard:wave/spawn/stray {map:1,path:2}
execute if score .wave spawn_timer matches 160 run function gourd_guard:wave/spawn/ghost {map:1,path:1}
execute if score .wave spawn_timer matches 163 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/stray {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/camo_spider {map:1,path:1}
execute if score .wave spawn_timer matches 186 run function gourd_guard:wave/spawn/stray {map:1,path:2}
execute if score .wave spawn_timer matches 190 run function gourd_guard:wave/spawn/ghost {map:1,path:2}
execute if score .wave spawn_timer matches 199 run function gourd_guard:wave/spawn/camo_spider {map:1,path:2}
execute if score .wave spawn_timer matches 202 run function gourd_guard:wave/spawn/stray {map:1,path:1}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/stray {map:1,path:2}
execute if score .wave spawn_timer matches 219 run scoreboard players set .wave spawn_done 1
