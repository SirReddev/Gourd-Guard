# Play denial sound and show chat warning
playsound minecraft:entity.villager.no master @s ~ ~ ~ 0.6 1.0
$tellraw @s [{"text":"[Shop] Cannot Afford! Need ","color":"#FF5252"},{"text":"$(Price)","color":"#FFD54F"}]
