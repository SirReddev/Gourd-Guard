# Pillager Convoy Main Tick Loop
# Executed as each active ravager convoy entity (@s) at @s

# 1. Death check: if ravager HP dropped to 0 or below, kill rider and despawn
execute store result score #convoy_hp gg.calc run data get entity @s Health 1
execute if score #convoy_hp gg.calc matches ..0 run return run function gourd_guard:tower/convoy/on_convoy_death

# 2. Collision detection against living wave mobs (within 2.2 blocks)
tag @e remove gg_convoy_target
tag @e[tag=gg_mob,distance=..2.2,limit=1,sort=nearest] add gg_convoy_target
execute if entity @e[tag=gg_convoy_target] run function gourd_guard:tower/convoy/exchange_damage

# 3. Clean up orphaned pillager riders (any rider whose ravager was killed)
tag @e[tag=gg_convoy_rider] add gg_orphan
execute as @e[tag=gg_convoy] on passengers if entity @s[tag=gg_convoy_rider] run tag @s remove gg_orphan
kill @e[type=pillager,tag=gg_orphan]
tag @e remove gg_orphan
