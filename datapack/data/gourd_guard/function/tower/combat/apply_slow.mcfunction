# Apply slowness for 5 seconds (100 ticks) to wave mob (@s)
# Executed as the wave mob (@s)

# Guard: Ignore if currently slowed or under recent slow cooldown
execute if score @s gg.slow_ticks matches 1.. run return 0
execute if score @s gg.slow_cd matches 1.. run return 0

# Apply 50% slow for 5 seconds (100 ticks) and 8 seconds cooldown (160 ticks)
scoreboard players set @s gg.slow_pct 50
scoreboard players set @s gg.slow_ticks 100
scoreboard players set @s gg.slow_cd 160
