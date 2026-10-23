# Ballista arrow fired from locator position toward target mob
# Executed at the locator marker position, facing the target
# Uses the existing fw projectile system adapted for arrow

playsound minecraft:entity.arrow.shoot master @a[distance=..24] ~ ~ ~ 0.9 1.1
particle minecraft:crit ~ ~ ~ 0.1 0.1 0.1 0.1 5

# Summon a straight-flying arrow projectile
summon minecraft:item_display ~ ~ ~ {Tags:["gg_fw_proj","gg_fw_new","gg_ballista_proj"],teleport_duration:1,interpolation_duration:1,item:{id:"minecraft:arrow",count:1},transformation:{translation:[0f,0f,0f],left_rotation:[0.7071f,0f,0f,0.7071f],scale:[1.2f,1.2f,1.2f],right_rotation:[0f,0f,0f,1f]}}

execute as @n[type=item_display,tag=gg_fw_new,distance=..1] run function gourd_guard:tower/combat/init_projectile
