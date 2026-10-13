# Executed as & at the copper golem projectile upon hitting the target point
# 1. Copper smash impact sounds & particle burst
playsound minecraft:block.copper.hit master @a[distance=..24] ~ ~ ~ 1.0 0.8
playsound minecraft:entity.iron_golem.damage master @a[distance=..24] ~ ~ ~ 0.9 1.1
playsound minecraft:block.anvil.land master @a[distance=..24] ~ ~ ~ 0.5 1.5
particle minecraft:scrape ~ ~ ~ 0.3 0.3 0.3 0.1 16
particle minecraft:wax_off ~ ~ ~ 0.4 0.4 0.4 0.1 20
particle minecraft:copper_firework ~ ~ ~ 0.25 0.25 0.25 0.08 12

# 2. Deal direct hit damage to the locked target mob (if alive) or closest mob at impact
execute store result storage gourd_guard:tower macro.dmg int 1 run scoreboard players get @s gg.fw_dmg
execute store result storage gourd_guard:tower macro.splash int 1 run scoreboard players get @s gg.fw_splash

execute unless entity @e[tag=gg_fw_lock,distance=..2.5] as @n[tag=gg_mob,distance=..2.0] run tag @s add gg_fw_lock
execute as @e[tag=gg_fw_lock,limit=1] run function gourd_guard:tower/combat/deal_direct_dmg with storage gourd_guard:tower macro

# 3. Deal splash damage to other wave mobs within 1.8 blocks of impact
execute as @e[tag=gg_mob,tag=!gg_fw_lock,distance=..1.8] run function gourd_guard:tower/combat/deal_splash_dmg with storage gourd_guard:tower macro

# 4. Remove the projectile entity and its block_display passenger
execute on passengers run kill @s
kill @s
