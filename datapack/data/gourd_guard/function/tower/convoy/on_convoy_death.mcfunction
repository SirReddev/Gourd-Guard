# Convoy destroyed in combat
# Executed as the dying ravager entity (@s)
playsound minecraft:entity.ravager.death master @a[distance=..24] ~ ~ ~ 0.9 1.0
particle minecraft:poof ~ ~1 ~ 0.5 0.5 0.5 0.05 20

# Kill pillager passenger immediately so no orphaned rider remains
execute on passengers run kill @s

# Silent clean removal
tp @s ~ -500 ~
kill @s
