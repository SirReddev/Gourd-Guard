# Boss hit by scarecrow: deal 500 damage but prevent killing (leave at 1 HP min)
# Executed as the boss mob (@s)
execute store result score #boss_hp gg.calc run data get entity @s Health 1
scoreboard players set #boss_hit_dmg gg.calc 500
# If boss HP > 500, deal 500 damage freely
execute if score #boss_hp gg.calc > #boss_hit_dmg gg.calc run damage @s 500 minecraft:out_of_world
# If boss HP <= 500, deal (HP - 1) damage so it survives with 1 HP
scoreboard players operation #boss_safe_dmg gg.calc = #boss_hp gg.calc
scoreboard players remove #boss_safe_dmg gg.calc 1
execute if score #boss_hp gg.calc <= #boss_hit_dmg gg.calc if score #boss_safe_dmg gg.calc matches 1.. run damage @s 1 minecraft:out_of_world
