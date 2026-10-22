# Clear slowness from a mob
# Executed as the mob (@s)
tag @s remove gg_slowed
tag @s remove gg_slow_50
tag @s remove gg_slow_25
tag @s remove gg_slow_75
scoreboard players reset @s gg.slow_timer
