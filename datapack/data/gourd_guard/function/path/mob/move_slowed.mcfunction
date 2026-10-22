# Slowed mob movement step forward
# Visual indicator: soul particles while slowed
particle minecraft:soul ~ ~0.3 ~ 0.15 0.15 0.15 0.01 1

# Standard 50% Slowness (default: tag=gg_slow_50 or fallback)
execute unless entity @s[tag=gg_slow_25] unless entity @s[tag=gg_slow_75] if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.15
execute unless entity @s[tag=gg_slow_25] unless entity @s[tag=gg_slow_75] if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.14
execute unless entity @s[tag=gg_slow_25] unless entity @s[tag=gg_slow_75] if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.05
execute unless entity @s[tag=gg_slow_25] unless entity @s[tag=gg_slow_75] unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.07

# 25% Slowness tier (tag=gg_slow_25)
execute if entity @s[tag=gg_slow_25] if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.28
execute if entity @s[tag=gg_slow_25] if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.21
execute if entity @s[tag=gg_slow_25] if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.08
execute if entity @s[tag=gg_slow_25] unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.11

# 75% Slowness tier (tag=gg_slow_75)
execute if entity @s[tag=gg_slow_75] if entity @s[tag=gg_runner] run tp @s ^ ^ ^0.10
execute if entity @s[tag=gg_slow_75] if entity @s[tag=gg_fast,tag=!gg_runner] run tp @s ^ ^ ^0.07
execute if entity @s[tag=gg_slow_75] if entity @s[tag=gg_slow] run tp @s ^ ^ ^0.03
execute if entity @s[tag=gg_slow_75] unless entity @s[tag=gg_fast] unless entity @s[tag=gg_runner] unless entity @s[tag=gg_slow] run tp @s ^ ^ ^0.04
