# Executed at the top of Cauldron Damage (^0 ^1.5 ^0.3 facing target)
playsound minecraft:entity.splash_potion.throw master @a[distance=..24] ~ ~ ~ 1.0 0.9
playsound minecraft:block.brewing_stand.brew master @a[distance=..24] ~ ~ ~ 0.8 1.4
particle minecraft:witch ~ ~ ~ 0.15 0.15 0.15 0.05 10
particle minecraft:instant_effect ~ ~ ~ 0.1 0.1 0.1 0.05 8

# Summon the Splash Potion item_display projectile
summon minecraft:item_display ~ ~ ~ {Tags:["gg_fw_proj","gg_potion_proj","gg_fw_new"],teleport_duration:1,interpolation_duration:1,item:{id:"minecraft:splash_potion",count:1,components:{"minecraft:potion_contents":{potion:"minecraft:strong_harming"}}},transformation:{translation:[0f,0f,0f],scale:[1.4f,1.4f,1.4f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]}}

execute as @n[type=item_display,tag=gg_fw_new,distance=..1] run function gourd_guard:tower/combat/init_projectile
