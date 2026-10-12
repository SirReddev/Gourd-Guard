# Executed at the cannon barrel muzzle (^0 ^2.0 ^0.55 facing target)
playsound minecraft:entity.firework_rocket.launch master @a[distance=..24] ~ ~ ~ 1.0 1.0
playsound minecraft:entity.generic.explode master @a[distance=..24] ~ ~ ~ 0.25 1.8
particle minecraft:campfire_cosy_smoke ~ ~ ~ 0.08 0.08 0.08 0.02 4
particle minecraft:firework ~ ~ ~ 0.08 0.08 0.08 0.04 6

# Summon the 3D Firework Rocket item_display projectile (rotated +90 deg X so rocket nose points forward along look vector)
summon minecraft:item_display ~ ~ ~ {Tags:["gg_fw_proj","gg_fw_new"],teleport_duration:1,interpolation_duration:1,item:{id:"minecraft:firework_rocket",count:1},transformation:{translation:[0f,0f,0f],left_rotation:[0.7071f,0f,0f,0.7071f],scale:[1.6f,1.6f,1.6f],right_rotation:[0f,0f,0f,1f]}}

execute as @n[type=item_display,tag=gg_fw_new,distance=..1] run function gourd_guard:tower/combat/init_projectile
