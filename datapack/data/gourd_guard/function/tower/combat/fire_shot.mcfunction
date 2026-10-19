# Executed as & at the firing tower root (@s)
# Reset tower cooldown to its level's max cooldown
scoreboard players operation @s gg.tower_cd = @s gg.tower_max_cd

# Cache projectile stats & target mob ID
scoreboard players operation #shot_dmg gg.fw_dmg = @s gg.tower_dmg
scoreboard players operation #shot_splash gg.fw_splash = @s gg.tower_splash
scoreboard players operation #shot_tid gg.fw_tid = @n[tag=gg_tower_target] gg.mob_id

# Launch audio & projectile oriented toward the target
execute if score @s gg.tower_type matches 1 facing entity @n[tag=gg_tower_target] eyes rotated ~ 0 positioned ^0 ^2.0 ^0.55 run function gourd_guard:tower/combat/spawn_projectile
execute if score @s gg.tower_type matches 2 facing entity @n[tag=gg_tower_target] eyes rotated ~ 0 positioned ^0 ^1.6 ^0 run function gourd_guard:tower/combat/spawn_golem_projectile
execute if score @s gg.tower_type matches 4 facing entity @n[tag=gg_tower_target] eyes rotated ~ 0 positioned ^0 ^1.5 ^0.3 run function gourd_guard:tower/combat/spawn_potion_projectile
execute if score @s gg.tower_type matches 5 facing entity @n[tag=gg_tower_target] eyes rotated ~ 0 run function gourd_guard:tower/combat/fire_tesla
