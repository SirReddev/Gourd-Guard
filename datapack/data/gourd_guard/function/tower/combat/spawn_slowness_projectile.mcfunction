# Executed at top of Cauldron Slowness (^0 ^1.5 ^0.3 facing target)
playsound minecraft:entity.splash_potion.throw master @a[distance=..24] ~ ~ ~ 1.0 1.1
playsound minecraft:block.soul_sand.step master @a[distance=..24] ~ ~ ~ 0.9 0.8
particle minecraft:soul ~ ~ ~ 0.15 0.15 0.15 0.05 10

# Summon the Splash Potion of Slowness item_display projectile
summon minecraft:item_display ~ ~ ~ {Tags:["gg_fw_proj","gg_slowness_proj","gg_fw_new"],teleport_duration:1,interpolation_duration:1,item:{id:"minecraft:splash_potion",count:1,components:{"minecraft:potion_contents":{potion:"minecraft:slowness"}}},transformation:{translation:[0f,0f,0f],scale:[1.4f,1.4f,1.4f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]}}

execute as @n[type=item_display,tag=gg_fw_new,distance=..1] run function gourd_guard:tower/combat/init_projectile
