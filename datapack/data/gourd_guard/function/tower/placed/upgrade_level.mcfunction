# Call as a placed tower root entity (@s) to increment its level and refresh its text display
scoreboard players add @s gg.tower_lvl 1
scoreboard players add @s gg.tower_sell 5
function gourd_guard:tower/placed/update_text
playsound minecraft:block.anvil.use master @a[distance=..16] ~ ~ ~ 0.6 1.5
