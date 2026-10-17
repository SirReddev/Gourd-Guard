# Play denial sound and show chat warning with required price and player's current balance
playsound minecraft:entity.villager.no master @s ~ ~ ~ 0.6 1.0
execute unless score @s coins matches 0.. run scoreboard players set @s coins 0
$tellraw @s [{"text":"[Shop] ","color":"red","bold":true},{"text":"You don't have enough Candy! ","color":"yellow"},{"text":"Requires ","color":"gray"},{"text":"$(Price)","color":"gold","bold":true},{"text":" (You have: ","color":"gray"},{"score":{"name":"@s","objective":"coins"},"color":"gold"},{"text":" Candy)","color":"gray"}]
