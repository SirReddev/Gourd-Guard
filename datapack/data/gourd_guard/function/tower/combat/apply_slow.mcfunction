# Apply 50% slowness for 5s to this mob
# Executed as the wave mob (@s)
# Only apply if NOT immune (score unset/0, not negative)
execute unless score @s gg.slow_timer matches ..-1 run scoreboard players set @s gg.slow_timer 100
execute unless score @s gg.slow_timer matches ..-1 run tag @s add gg_slowed
execute unless score @s gg.slow_timer matches ..-1 run tag @s add gg_slow_50
