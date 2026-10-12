# Executed as & at the firing tower root (@s)
# Reset tower cooldown to its level's max cooldown
scoreboard players operation @s gg.tower_cd = @s gg.tower_max_cd

# Cache projectile stats & target mob ID
scoreboard players operation #shot_dmg gg.fw_dmg = @s gg.tower_dmg
scoreboard players operation #shot_splash gg.fw_splash = @s gg.tower_splash
scoreboard players operation #shot_tid gg.fw_tid = @n[tag=gg_tower_target] gg.mob_id

# Launch audio & muzzle effects oriented toward the target
execute facing entity @n[tag=gg_tower_target] eyes rotated ~ 0 positioned ^0 ^2.0 ^0.55 run function gourd_guard:tower/combat/spawn_projectile
