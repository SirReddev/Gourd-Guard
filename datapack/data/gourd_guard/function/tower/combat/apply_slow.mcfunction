# Apply 50% slowness for 5s to this mob
# Executed as the wave mob (@s)
scoreboard players operation @s gg.slow_timer = #slow_dur gg.calc
scoreboard players set @s gg.slow_immune_timer 200
tag @s add gg_slowed
tag @s add gg_slow_50
tag @s add gg_slow_immune
effect give @s minecraft:slowness 5 0 true
