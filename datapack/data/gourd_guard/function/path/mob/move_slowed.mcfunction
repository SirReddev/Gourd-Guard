# Slowed mob movement step forward
# Visual indicator: soul particles while slowed
particle minecraft:soul ~ ~0.3 ~ 0.15 0.15 0.15 0.01 1

# Slowness Value Support:

# 75% Slowness tier (scores={gg.slow_val=66..100})
execute if score @s gg.slow_val matches 66..100 if entity @s[tag=gg_runner] run return run tp @s ^ ^ ^0.14
execute if score @s gg.slow_val matches 66..100 if entity @s[tag=gg_fast] run return run tp @s ^ ^ ^0.07
execute if score @s gg.slow_val matches 66..100 if entity @s[tag=gg_slow] run return run tp @s ^ ^ ^0.03
execute if score @s gg.slow_val matches 66..100 run return run tp @s ^ ^ ^0.04

# 25% Slowness tier (scores={gg.slow_val=1..35})
execute if score @s gg.slow_val matches 1..35 if entity @s[tag=gg_runner] run return run tp @s ^ ^ ^0.41
execute if score @s gg.slow_val matches 1..35 if entity @s[tag=gg_fast] run return run tp @s ^ ^ ^0.21
execute if score @s gg.slow_val matches 1..35 if entity @s[tag=gg_slow] run return run tp @s ^ ^ ^0.08
execute if score @s gg.slow_val matches 1..35 run return run tp @s ^ ^ ^0.11

# Standard 50% Slowness tier (default: scores={gg.slow_val=36..65} or any fallback)
execute if entity @s[tag=gg_runner] run return run tp @s ^ ^ ^0.27
execute if entity @s[tag=gg_fast] run return run tp @s ^ ^ ^0.14
execute if entity @s[tag=gg_slow] run return run tp @s ^ ^ ^0.05
tp @s ^ ^ ^0.07
