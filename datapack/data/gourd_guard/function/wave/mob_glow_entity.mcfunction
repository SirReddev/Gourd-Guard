# Apply glowing outline and color-themed team to individual mob
tag @s add gg_glow_init
data modify entity @s Glowing set value 1b
effect give @s minecraft:glowing infinite 0 true

# 1. Bosses (Red outline)
execute if entity @s[tag=gg_boss] run return run team join team_red @s

# 2. Camouflage / Stealth Variants (Black shadow outline)
execute if entity @s[tag=gg_camo] run return run team join team_black @s

# 3. Flying & Aerial Mobs
execute if entity @s[type=vex] run return run team join team_aqua @s
execute if entity @s[type=phantom] run return run team join team_purple @s
execute if entity @s[type=ghast] run return run team join team_white @s
execute if entity @s[type=blaze] run return run team join team_gold @s

# 4. Undead & Fast Runners
execute if entity @s[type=zombie,tag=gg_fast] run return run team join team_yellow @s
execute if entity @s[type=zombie] run return run team join team_lime @s
execute if entity @s[type=drowned] run return run team join team_blue @s
execute if entity @s[type=husk] run return run team join team_orange @s
execute if entity @s[type=skeleton] run return run team join team_white @s
execute if entity @s[type=stray] run return run team join team_light_blue @s
execute if entity @s[type=bogged] run return run team join team_green @s

# 5. Creepers, Spiders & Swarms
execute if entity @s[type=creeper] run return run team join team_green @s
execute if entity @s[type=spider] run return run team join team_red @s
execute if entity @s[type=cave_spider] run return run team join team_red @s
execute if entity @s[type=silverfish] run return run team join team_gray @s

# 6. Heavy Mobs, Illagers & Nether
execute if entity @s[type=witch] run return run team join team_magenta @s
execute if entity @s[type=evoker] run return run team join team_cyan @s
execute if entity @s[type=vindicator] run return run team join team_brown @s
execute if entity @s[type=piglin_brute] run return run team join team_gold @s
execute if entity @s[type=zombified_piglin] run return run team join team_gold @s
execute if entity @s[type=ravager] run return run team join team_gray @s
execute if entity @s[type=magma_cube] run return run team join team_orange @s
execute if entity @s[type=slime] run return run team join team_lime @s
execute if entity @s[type=guardian] run return run team join team_cyan @s
execute if entity @s[type=warden] run return run team join team_cyan @s
execute if entity @s[type=iron_golem] run return run team join team_light_gray @s

# Fallback default for any other mob
team join team_white @s
