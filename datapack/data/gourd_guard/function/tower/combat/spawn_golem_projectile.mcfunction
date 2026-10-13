# Executed at the top of the Copper Golem Launcher (^0 ^1.6 ^0 facing target)
playsound minecraft:block.copper.place master @a[distance=..24] ~ ~ ~ 1.0 1.2
playsound minecraft:entity.iron_golem.attack master @a[distance=..24] ~ ~ ~ 0.8 1.4
particle minecraft:wax_off ~ ~ ~ 0.1 0.1 0.1 0.05 6
particle minecraft:scrape ~ ~ ~ 0.1 0.1 0.1 0.05 4

# Summon the Copper Golem Statue block_display riding an item_display projectile (double size: scale 1.0, centered: translation -0.5)
summon minecraft:item_display ~ ~ ~ {Tags:["gg_fw_proj","gg_cg_proj","gg_fw_new"],teleport_duration:1,interpolation_duration:1,Passengers:[{id:"minecraft:block_display",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-0.5f,-0.5f],scale:[1.0f,1.0f,1.0f]},block_state:{id:"minecraft:waxed_copper_golem_statue",properties:{copper_golem_pose:"star",waterlogged:"false"}}}]}

execute as @n[type=item_display,tag=gg_fw_new,distance=..1] run function gourd_guard:tower/combat/init_projectile
