# Call as a placed tower root entity (@s) to increment its level (up to Lvl 5) and refresh stats & text display
execute if score @s gg.tower_lvl matches ..4 run scoreboard players add @s gg.tower_lvl 1
function gourd_guard:tower/placed/update_stats
playsound minecraft:block.anvil.use master @a[distance=..16] ~ ~ ~ 0.6 1.5
particle minecraft:happy_villager ~ ~1.2 ~ 0.4 0.4 0.4 0.05 15
