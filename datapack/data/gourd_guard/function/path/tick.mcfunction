# Pathfinding System - Main Tick

# 0. Ensure chunk areas around path nodes and pumpkins are force-loaded
execute as @e[tag=aj.gourdguard_pumpkin.root,tag=!gg_forceloaded_5x5] at @s run forceload add ~-32 ~-32 ~32 ~32
execute as @e[tag=aj.gourdguard_pumpkin.root,tag=!gg_forceloaded_5x5] run tag @s add gg_forceloaded_5x5
execute as @e[tag=path_node,tag=!gg_forceloaded_5x5] at @s run forceload add ~-32 ~-32 ~32 ~32
execute as @e[tag=path_node,tag=!gg_forceloaded_5x5] run tag @s add gg_forceloaded_5x5

# 1. Auto-detect any newly spawned mobs with route tags
function gourd_guard:path/mob/auto_init

# 1.5. Remove path/wave tags from dead mobs
execute as @e[tag=path_mob] if data entity @s {Health:0.0f} run tag @s remove path_mob
execute as @e[tag=gg_mob] if data entity @s {Health:0.0f} run tag @s remove gg_mob

# 1.8. Slowness countdown & expiration: exactly 1 decrement per tick
execute as @e[tag=gg_slowed] run scoreboard players remove @s gg.slow_timer 1
execute as @e[tag=gg_slowed,scores={gg.slow_timer=..0}] run tag @s remove gg_slowed
execute as @e[tag=gg_slow_50] unless entity @s[tag=gg_slowed] run tag @s remove gg_slow_50
execute as @e[tag=gg_slow_25] unless entity @s[tag=gg_slowed] run tag @s remove gg_slow_25
execute as @e[tag=gg_slow_75] unless entity @s[tag=gg_slowed] run tag @s remove gg_slow_75
execute as @e[tag=gg_mob] unless entity @s[tag=gg_slowed] if score @s gg.slow_timer matches ..0 run scoreboard players reset @s gg.slow_timer

# 1.9. Slowness immunity countdown
execute as @e[tag=gg_slow_immune] run scoreboard players remove @s gg.slow_immune_timer 1
execute as @e[tag=gg_slow_immune,scores={gg.slow_immune_timer=..0}] run tag @s remove gg_slow_immune
execute as @e[tag=gg_slow_immune,scores={gg.slow_immune_timer=..0}] run scoreboard players reset @s gg.slow_immune_timer

# 1.10. Ram cooldown countdown
execute as @e[tag=gg_rammed] run scoreboard players remove @s gg.ram_cd 1
execute as @e[tag=gg_rammed,scores={gg.ram_cd=..0}] run tag @s remove gg_rammed
execute as @e[tag=gg_rammed,scores={gg.ram_cd=..0}] run scoreboard players reset @s gg.ram_cd

# 2. Process all active path mobs
execute as @e[tag=path_mob,scores={path.state=1..}] at @s run function gourd_guard:path/mob/process

# 3. Apply color-themed glow to all wave mobs
function gourd_guard:wave/mob_glow
