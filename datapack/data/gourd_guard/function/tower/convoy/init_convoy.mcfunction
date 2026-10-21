# Initialize newly spawned Pillager Convoy
# Macro arguments: $(map), $(path)

tag @s remove gg_new_convoy
team join team_convoy @s
execute as @s on passengers run team join team_convoy @s
execute unless score @s gg.convoy_dmg matches 1.. run scoreboard players set @s gg.convoy_dmg 65

# Assign to pathfinding network on active map & route
$function gourd_guard:path/route/assign {map:$(map),path:$(path)}

# Randomize split choice (Option 1 vs Option 2) so convoys take dynamic paths
execute store result score #rnd gg.calc run random value 1..2
scoreboard players operation @s path.option = #rnd gg.calc

# Audio & visual feedback at route spawn entrance
playsound minecraft:entity.ravager.celebrate master @a[distance=..24] ~ ~ ~ 0.9 1.0
particle minecraft:raid_omen ~ ~1.5 ~ 0.4 0.4 0.4 0.0 15
