# Executed as placed scarecrow root (@s) each tick
# Show intimidation particles at the locator marker
execute as @e[type=marker,tag=aj.gourdguard_tower_scarecrow.locator.locator,distance=..3,limit=1] at @s run particle minecraft:smoke ~ ~0.5 ~ 0.15 0.15 0.15 0.02 3
execute as @e[type=marker,tag=aj.gourdguard_tower_scarecrow.locator.locator,distance=..3,limit=1] at @s run particle minecraft:angry_villager ~ ~0.8 ~ 0.1 0.1 0.1 0.01 1

# Check if any wave mob is within 2.5 blocks of this scarecrow
execute if entity @e[tag=gg_mob,distance=..2.5] run function gourd_guard:tower/scarecrow/trigger
