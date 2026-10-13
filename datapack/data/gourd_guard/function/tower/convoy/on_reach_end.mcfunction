# Pillager Convoy safely reached the pumpkin objective!
# Defended the base successfully; safely despawns without dealing damage to the pumpkin

scoreboard players set @s path.state 0
tag @s remove path_mob

particle minecraft:poof ~ ~1 ~ 0.5 0.5 0.5 0.05 20
playsound minecraft:entity.ravager.ambient master @a[distance=..16] ~ ~ ~ 0.8 1.2

# Safely remove passenger and ravager
execute on passengers run kill @s
tp @s ~ -500 ~
kill @s
