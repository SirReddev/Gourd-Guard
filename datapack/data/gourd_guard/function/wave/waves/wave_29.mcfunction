# Wave 29 Spawning Sequence
# Total spawns: 26 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 29","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 45 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 46 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 60 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 70 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 82 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 91 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 95 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 104 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 120 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 126 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 136 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 145 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 148 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 170 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 181 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 192 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 195 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 214 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 220 run function gourd_guard:wave/spawn/evoker {map:1,path:1}
execute if score .wave spawn_timer matches 226 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 245 run function gourd_guard:wave/spawn/evoker {map:1,path:2}
execute if score .wave spawn_timer matches 271 run function gourd_guard:wave/spawn/ravager {map:1,path:1}
execute if score .wave spawn_timer matches 316 run function gourd_guard:wave/spawn/ravager {map:1,path:2}
execute if score .wave spawn_timer matches 317 run scoreboard players set .wave spawn_done 1
