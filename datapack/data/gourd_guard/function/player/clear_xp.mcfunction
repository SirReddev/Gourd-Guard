# gourd_guard:player/clear_xp
# Automatically detects and clears experience from players and removes dropped XP orbs

# 1. Instantly kill all dropped experience orbs in the world
kill @e[type=minecraft:experience_orb]

# 2. Clear experience for players with levels
execute as @a[level=1..] run experience set @s 0 points
execute as @a[level=1..] run experience set @s 0 levels

# 3. Detect and clear experience points (partial bar progress)
execute as @a store result score @s gg.xp_pts run experience query @s points
execute as @a[scores={gg.xp_pts=1..}] run experience set @s 0 points
execute as @a[scores={gg.xp_pts=1..}] run experience set @s 0 levels
scoreboard players set @a[scores={gg.xp_pts=1..}] gg.xp_pts 0

# 4. If executed directly as a player, ensure unconditional clear
execute if entity @s[type=player] run experience set @s 0 points
execute if entity @s[type=player] run experience set @s 0 levels
