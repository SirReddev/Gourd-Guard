# Pillager Convoy Dispatch Engine
# Executed as & at the placed tower root (@s)

# 1. Reset tower cooldown to max
scoreboard players operation @s gg.tower_cd = @s gg.tower_max_cd

# 2. Watchtower raid horn sound & visual horn/spawning particles
playsound minecraft:event.raid.horn master @a[distance=..32] ~ ~3.2 ~ 1.0 1.0
function aj:gourdguard_tower_pillager_convoy/at_locator {name:'locator',command:'particle minecraft:ominous_spawning ~ ~ ~ 0.5 0.5 0.5 0.05 30'}
function aj:gourdguard_tower_pillager_convoy/at_locator {name:'locator',command:'particle minecraft:raid_omen ~ ~ ~ 0.3 0.3 0.3 0.0 15'}
particle minecraft:ominous_spawning ~ ~3.2 ~ 0.5 0.5 0.5 0.05 30
particle minecraft:raid_omen ~ ~3.2 ~ 0.3 0.3 0.3 0.0 15

# 3. Prepare parameters for route dispatch
execute store result storage gourd_guard:tower macro.map int 1 run scoreboard players get .global map
execute store result storage gourd_guard:tower macro.lvl int 1 run scoreboard players get @s gg.tower_lvl
execute store result storage gourd_guard:tower macro.hp float 1 run scoreboard players get @s gg.tower_dmg

# 4. Dispatch one convoy for each active main route on the current map
function gourd_guard:tower/convoy/dispatch_map with storage gourd_guard:tower macro
