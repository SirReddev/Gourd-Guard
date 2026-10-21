# Wave 1 Spawning Sequence
# Total spawns: 10 mobs across Castle Path & Graveyard Path
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 1","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 21 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 41 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 61 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 81 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 101 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 121 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 141 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 161 run function gourd_guard:wave/spawn/grunt {map:1,path:1}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/grunt {map:1,path:2}
execute if score .wave spawn_timer matches 182 run scoreboard players set .wave spawn_done 1
