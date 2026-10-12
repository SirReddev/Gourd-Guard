# Wave 24 Spawning Sequence
# Total spawns: 42 mobs across Path 1 & Path 2
execute if score .wave spawn_timer matches 1 run title @a times 5 30 10
execute if score .wave spawn_timer matches 1 run title @a title {"text":"WAVE 24","color":"gold","bold":true}
execute if score .wave spawn_timer matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0 1
execute if score .wave spawn_timer matches 1 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 15 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 20 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 29 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 38 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 43 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 56 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 57 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 71 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 74 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 80 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 85 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 92 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 99 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 105 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 110 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 113 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 127 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 128 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 130 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 141 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 146 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 155 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 155 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 164 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 169 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 180 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:1}
execute if score .wave spawn_timer matches 182 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 183 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 197 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 200 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 205 run function gourd_guard:wave/spawn/camo_assassin {map:1,path:2}
execute if score .wave spawn_timer matches 211 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 218 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 225 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 236 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 239 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 253 run function gourd_guard:wave/spawn/magma_cube {map:1,path:1}
execute if score .wave spawn_timer matches 254 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 267 run function gourd_guard:wave/spawn/magma_cube {map:1,path:2}
execute if score .wave spawn_timer matches 272 run function gourd_guard:wave/spawn/blaze {map:1,path:1}
execute if score .wave spawn_timer matches 290 run function gourd_guard:wave/spawn/blaze {map:1,path:2}
execute if score .wave spawn_timer matches 291 run scoreboard players set .wave spawn_done 1
