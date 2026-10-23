# Scarecrow triggered! Deal one-shot 500 damage to the nearest mob, then vanish.
# Executed as & at the scarecrow root entity

# Play dramatic effect
playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..24] ~ ~ ~ 0.8 1.5
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1
particle minecraft:smoke ~ ~1 ~ 0.5 0.5 0.5 0.1 30

# Deal 500 damage to all mobs within 2.5 blocks (but cap it so bosses cannot be killed)
tag @e[tag=gg_mob,distance=..2.5] add gg_scarecrow_hit
execute as @e[tag=gg_scarecrow_hit,tag=!gg_boss] at @s run damage @s 500 minecraft:out_of_world
execute as @e[tag=gg_scarecrow_hit,tag=gg_boss] at @s run function gourd_guard:tower/scarecrow/boss_hit
tag @e remove gg_scarecrow_hit

# Remove this scarecrow (it's single-use)
function gourd_guard:tower/action/cleanup_target_tower
kill @s
