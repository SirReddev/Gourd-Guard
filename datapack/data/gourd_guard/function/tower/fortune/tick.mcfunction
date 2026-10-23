# Fortune Pillar aura tick - executed as placed fortune pillar root (@s)
# Tag all wave mobs within aura radius with gg_fortune_aura
# Radius scales with level: Lvl1=8b, Lvl2=10b, Lvl3=12b, Lvl4=14b, Lvl5=16b

# First remove aura from mobs not within range (clean re-apply each tick)
# Only remove aura from mobs that were tagged by THIS pillar's range on a previous tick
# We use a simple approach: re-apply aura each tick; mobs out of ALL fortune pillar ranges lose it in fortune/clear_aura

# Apply aura based on level
execute if score @s gg.tower_lvl matches 1 run tag @e[tag=gg_mob,distance=..8.0] add gg_fortune_aura
execute if score @s gg.tower_lvl matches 2 run tag @e[tag=gg_mob,distance=..10.0] add gg_fortune_aura
execute if score @s gg.tower_lvl matches 3 run tag @e[tag=gg_mob,distance=..12.0] add gg_fortune_aura
execute if score @s gg.tower_lvl matches 4 run tag @e[tag=gg_mob,distance=..14.0] add gg_fortune_aura
execute if score @s gg.tower_lvl matches 5 run tag @e[tag=gg_mob,distance=..16.0] add gg_fortune_aura

# Ambient gold particles to show aura range
execute as @e[type=marker,tag=aj.gourdguard_tower_fortune_pillar.locator.locator,distance=..3,limit=1] at @s run particle minecraft:happy_villager ~ ~0.5 ~ 0.2 0.2 0.2 0.05 2
execute if score @s gg.tower_lvl matches 1.. at @s particle minecraft:glow ~ ~1 ~ 0.3 0.3 0.3 0.1 1
