# Deal lethal/direct collision damage to wave mob
# Macro argument: $(dmg)
data modify entity @s HurtTime set value 0s
$damage @s $(dmg) minecraft:out_of_world
particle minecraft:damage_indicator ~ ~1 ~ 0.25 0.3 0.25 0.05 6
