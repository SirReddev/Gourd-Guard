# Play denial sound and show chat warning with required price and player's current balance
playsound minecraft:entity.villager.no master @s ~ ~ ~ 0.6 1.0
tellraw @s [{"text":"[Shop] ","color":"red","bold":true},{"text":"Cannot afford item.","color":"yellow"}]
