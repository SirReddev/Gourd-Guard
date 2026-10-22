# Pillager Convoy Dispatch Engine
# Executed as & at the placed tower root (@s)

# 1. Reset tower cooldown to max
scoreboard players operation @s gg.tower_cd = @s gg.tower_max_cd

# 2. Watchtower raid horn sound & red skull particles at locator
playsound minecraft:event.raid.horn master @a[distance=..32] ~ ~3.2 ~ 1.0 1.0
function aj:gourdguard_tower_pillager_convoy/at_locator {name:'locator',command:'particle minecraft:raid_omen ~ ~ ~ 0.35 0.35 0.35 0.0 25'}

# 3. Prepare parameters for route dispatch
data merge storage gourd_guard:tower {macro:{map:1,lvl:1,dmg:30,hp:400}}
execute store result storage gourd_guard:tower macro.map int 1 run scoreboard players get .global map
execute store result storage gourd_guard:tower macro.lvl int 1 run scoreboard players get @s gg.tower_lvl
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.tower_dmg
scoreboard players set #convoy_tank_hp gg.calc 300
execute if score @s gg.tower_lvl matches 2 run scoreboard players set #convoy_tank_hp gg.calc 450
execute if score @s gg.tower_lvl matches 3 run scoreboard players set #convoy_tank_hp gg.calc 650
execute if score @s gg.tower_lvl matches 4 run scoreboard players set #convoy_tank_hp gg.calc 900
execute if score @s gg.tower_lvl matches 5 run scoreboard players set #convoy_tank_hp gg.calc 1250
execute store result storage gourd_guard:tower macro.hp int 1 run scoreboard players get #convoy_tank_hp gg.calc

# 4. Dispatch one convoy for each active main route on the current map
function gourd_guard:tower/convoy/dispatch_map with storage gourd_guard:tower macro
