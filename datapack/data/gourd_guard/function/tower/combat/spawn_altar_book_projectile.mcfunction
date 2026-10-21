# Executed at the Magic Altar locator above the book facing the target mob
playsound minecraft:block.enchantment_table.use master @a[distance=..24] ~ ~ ~ 1.2 1.3
playsound minecraft:entity.illusioner.cast_spell master @a[distance=..24] ~ ~ ~ 0.9 1.4
particle minecraft:enchant ~ ~ ~ 0.25 0.25 0.25 0.8 20
particle minecraft:portal ~ ~ ~ 0.15 0.15 0.15 0.05 10

# Summon the 3D Enchanted Book item_display projectile (scaled larger: 2.2f)
summon minecraft:item_display ~ ~ ~ {Tags:["gg_fw_proj","gg_altar_proj","gg_fw_new"],teleport_duration:1,interpolation_duration:1,item:{id:"minecraft:enchanted_book",count:1},transformation:{translation:[0f,-0.3f,0f],scale:[2.2f,2.2f,2.2f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]}}

execute as @n[type=item_display,tag=gg_fw_new,distance=..1] run function gourd_guard:tower/combat/init_projectile
