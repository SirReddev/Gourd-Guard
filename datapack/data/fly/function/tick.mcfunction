# Adventure Mode Flying Engine - Main Tick Loop
# Runs every tick

# 1. Global match check
execute unless score .global fly_active matches 1 run return 0

# 2. Complete immunity during cutscenes, dialogues, and chatbox shop sessions
execute if score .global cs.state matches 1.. run return run effect clear @a minecraft:levitation
execute as @a[scores={chatbox.session=1..}] at @s run scoreboard players set @s fly_hold 0
execute as @a[scores={chatbox.session=1..}] at @s run effect clear @s minecraft:levitation
execute as @a[scores={chatbox.session=1..}] run return 0

# 3. Ensure newly joined players have flight status set to 3 (Free Fly)
execute as @a[scores={fly_status=..0},gamemode=!spectator,gamemode=!creative] run scoreboard players set @s fly_status 3

# 4. Track continuous Sneak duration (in ticks)
execute as @a[gamemode=!spectator,gamemode=!creative] if predicate chatbox:is_sneaking run scoreboard players add @s fly_hold 1
execute as @a[gamemode=!spectator,gamemode=!creative] unless predicate chatbox:is_sneaking run scoreboard players set @s fly_hold 0

# 5. Clear levitation immediately when Shift is released in Mode 3
execute as @a[scores={fly_status=3,fly_hold=0},gamemode=!spectator,gamemode=!creative] run effect clear @s minecraft:levitation

# 6. Mode 3 (Free Fly): Airborne vs Ground Handling
# AIRBORNE (>= 2 blocks in the air):
# - Directional Shift Flight: Fly fast in crosshair direction (~11 blocks/sec) with zero camera jitter (~ ~ relative rotation)
execute as @a[scores={fly_status=3,fly_hold=1..},gamemode=!spectator,gamemode=!creative] at @s if block ~ ~-2 ~ air run tp @s ^ ^ ^0.55 ~ ~
execute as @a[scores={fly_status=3,fly_hold=1..},gamemode=!spectator,gamemode=!creative] at @s if block ~ ~-2 ~ air run particle minecraft:cloud ^ ^ ^-0.7 0.1 0.1 0.1 0.02 2
# - Release sneak provides smooth hover / glide parachute
execute as @a[scores={fly_status=2..3},gamemode=!spectator,gamemode=!creative] at @s if block ~ ~-2 ~ air run effect give @s minecraft:slow_falling 1 1 true

# GROUND LAUNCH (Requires holding Shift for >= 8 ticks = 0.4s to take off):
# - Charge indicator particles during hold (ticks 4 to 7)
execute as @a[scores={fly_status=3,fly_hold=4..7},gamemode=!spectator,gamemode=!creative] at @s unless block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.05 0.05 0.05 0.01 1
# - Launch upward into the air once held for 8 ticks
execute as @a[scores={fly_status=3,fly_hold=8..},gamemode=!spectator,gamemode=!creative] at @s unless block ~ ~-2 ~ air run effect give @s minecraft:levitation 1 5 true
execute as @a[scores={fly_status=3,fly_hold=8..},gamemode=!spectator,gamemode=!creative] at @s unless block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.05 4

# 7. Mode 2: Lock Y (Fixed Altitude Hover)
execute as @a[scores={fly_status=2},gamemode=!spectator,gamemode=!creative] at @s if block ~ ~-2 ~ air run effect give @s minecraft:levitation 1 255 true

# 8. Clean up air effects instantly upon touching ground so walking is 100% normal
execute as @a[scores={fly_status=2..3},gamemode=!spectator,gamemode=!creative] at @s unless block ~ ~-0.8 ~ air run effect clear @s minecraft:slow_falling

# 9. Re-enable trigger
scoreboard players enable @a fly_status
