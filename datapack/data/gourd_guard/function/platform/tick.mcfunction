# gourd_guard:platform/tick
# Platform particle marker engine - Runs every tick

# 1. Advance particle cycle timer
scoreboard players add #platform_cycle gg.timer 1
execute if score #platform_cycle gg.timer matches 20.. run scoreboard players set #platform_cycle gg.timer 0

# 2. Check for Wand usage from players holding the platform wand
execute as @a[scores={gg_wand_use=1..}] if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[custom_data~{gg_platform_wand:1b}] at @s run function gourd_guard:platform/on_wand_use
execute as @a[scores={gg_wand_use=1..}] if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[custom_data~{gg_platform_wand:1b}] at @s run function gourd_guard:platform/on_wand_use
scoreboard players set @a gg_wand_use 0

# 3. Render particles on all active platform markers
execute as @e[type=marker,tag=gg_platform_marker] at @s run function gourd_guard:platform/particle_tick
