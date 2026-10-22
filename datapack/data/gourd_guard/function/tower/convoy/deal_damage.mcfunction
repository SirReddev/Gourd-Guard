# Macro: dynamic damage application from ravager convoy
# Executed as the wave mob (@s)
data modify entity @s HurtTime set value 0s
$damage @s $(dmg) minecraft:out_of_world
