# Apply 50% slowness for 5s (100 ticks) to this mob
# Executed as the wave mob (@s)

# Guard: Do not re-slow if already slowed or currently slow immune!
execute if entity @s[tag=gg_slowed] run return 0
execute if entity @s[tag=gg_slow_immune] run return 0

# Apply slowness tags & 5s timer (100 ticks)
tag @s add gg_slowed
tag @s add gg_slow_50
tag @s add gg_slow_immune
scoreboard players operation @s gg.slow_timer = #slow_dur gg.calc
execute unless score @s gg.slow_timer matches 20.. run scoreboard players set @s gg.slow_timer 100

# Set 10-second total immunity timer (200 ticks = 5s slow + 5s cooldown before re-slowable)
scoreboard players set @s gg.slow_immune_timer 200
