# Executed at the top of the Copper Golem Launcher (^0 ^1.6 ^0 facing target)
playsound minecraft:block.copper.place master @a[distance=..24] ~ ~ ~ 1.0 1.2
playsound minecraft:entity.iron_golem.attack master @a[distance=..24] ~ ~ ~ 0.8 1.4
particle minecraft:wax_off ~ ~ ~ 0.1 0.1 0.1 0.05 6
particle minecraft:scrape ~ ~ ~ 0.1 0.1 0.1 0.05 4

# Summon the Copper Golem Statue item_display projectile
summon minecraft:item_display ~ ~ ~ {Tags:["gg_fw_proj","gg_cg_proj","gg_fw_new"],teleport_duration:1,interpolation_duration:1,item:{id:"minecraft:copper_golem_statue",count:1},transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],scale:[0.85f,0.85f,0.85f],right_rotation:[0f,0f,0f,1f]}}

execute as @n[type=item_display,tag=gg_fw_new,distance=..1] run function gourd_guard:tower/combat/init_projectile
