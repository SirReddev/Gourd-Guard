# Apply 50% slowness for 5s (or tower slow duration) to this mob
# Executed as the wave mob (@s)
scoreboard players operation @s gg.slow_timer = #slow_dur gg.calc
execute unless score @s gg.slow_timer matches 20.. run scoreboard players set @s gg.slow_timer 100
tag @s add gg_slowed
tag @s add gg_slow_50
