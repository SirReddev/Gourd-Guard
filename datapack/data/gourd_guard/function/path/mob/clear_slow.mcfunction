# Clear slowness from a mob when its timer expires - starts 10s immunity window
# Executed as the mob (@s)
tag @s remove gg_slowed
tag @s remove gg_slow_50
tag @s remove gg_slow_25
tag @s remove gg_slow_75
scoreboard players set @s gg.slow_timer -200
