# Call as a placed tower root entity (@s) to increment its level (up to Lvl 5) and refresh stats & text display
execute if score @s gg.tower_lvl matches ..4 run scoreboard players add @s gg.tower_lvl 1
function gourd_guard:tower/placed/update_stats
# Audio & visual level-up feedback (happy_villager for cannon, wax_off for copper golem launcher)
execute if score @s gg.tower_type matches 1 run playsound minecraft:block.anvil.use master @a[distance=..16] ~ ~ ~ 0.6 1.5
execute if score @s gg.tower_type matches 1 run particle minecraft:happy_villager ~ ~1.2 ~ 0.4 0.4 0.4 0.05 15
execute if score @s gg.tower_type matches 2 run playsound minecraft:block.copper.place master @a[distance=..16] ~ ~ ~ 1.0 1.4
execute if score @s gg.tower_type matches 2 run particle minecraft:wax_off ~ ~1.2 ~ 0.4 0.4 0.4 0.05 20
execute if score @s gg.tower_type matches 3 run playsound minecraft:event.raid.horn master @a[distance=..16] ~ ~ ~ 0.8 1.0
execute if score @s gg.tower_type matches 3 run particle minecraft:raid_omen ~ ~1.2 ~ 0.4 0.4 0.4 0.0 20
execute if score @s gg.tower_type matches 4 run playsound minecraft:block.brewing_stand.brew master @a[distance=..16] ~ ~ ~ 1.0 1.2
execute if score @s gg.tower_type matches 4 run particle minecraft:witch ~ ~1.2 ~ 0.4 0.4 0.4 0.05 20
execute if score @s gg.tower_type matches 5 run playsound minecraft:item.trident.thunder master @a[distance=..16] ~ ~ ~ 1.0 1.5
execute if score @s gg.tower_type matches 5 run particle minecraft:electric_spark ~ ~1.2 ~ 0.4 0.4 0.4 0.1 25
