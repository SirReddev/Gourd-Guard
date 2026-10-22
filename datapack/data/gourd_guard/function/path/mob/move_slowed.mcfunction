# Slowed mob movement step forward
# Visual indicator: soul particles while slowed
particle minecraft:soul ~ ~0.3 ~ 0.15 0.15 0.15 0.01 1

# 75% Slowness tier (tag=gg_slow_75)
execute if entity @s[tag=gg_slow_75] if entity @s[tag=gg_runner] run return run tp @s ^ ^ ^0.14
execute if entity @s[tag=gg_slow_75] if entity @s[tag=gg_fast,tag=!gg_runner] run return run tp @s ^ ^ ^0.07
execute if entity @s[tag=gg_slow_75] if entity @s[tag=gg_slow] run return run tp @s ^ ^ ^0.03
execute if entity @s[tag=gg_slow_75] unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run return run tp @s ^ ^ ^0.04

# 25% Slowness tier (tag=gg_slow_25)
execute if entity @s[tag=gg_slow_25] if entity @s[tag=gg_runner] run return run tp @s ^ ^ ^0.41
execute if entity @s[tag=gg_slow_25] if entity @s[tag=gg_fast,tag=!gg_runner] run return run tp @s ^ ^ ^0.21
execute if entity @s[tag=gg_slow_25] if entity @s[tag=gg_slow] run return run tp @s ^ ^ ^0.08
execute if entity @s[tag=gg_slow_25] unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run return run tp @s ^ ^ ^0.11

# Standard 50% Slowness tier (default: tag=gg_slow_50 or any other mob with gg_slowed)
execute if entity @s[tag=gg_runner] run return run tp @s ^ ^ ^0.27
execute if entity @s[tag=gg_fast,tag=!gg_runner] run return run tp @s ^ ^ ^0.14
execute if entity @s[tag=gg_slow] run return run tp @s ^ ^ ^0.05
tp @s ^ ^ ^0.07
