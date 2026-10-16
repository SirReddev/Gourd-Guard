# Adventure Mode Flying Engine - Tick Loop (Called every 3 ticks)

# If flight is NOT active (.global fly_active != 1), ensure effects & status are turned off
execute unless score .global fly_active matches 1 as @a[scores={fly_status=1..}] run scoreboard players set @s fly_status 0
execute unless score .global fly_active matches 1 run effect clear @a[gamemode=!spectator,gamemode=!creative] minecraft:levitation
execute unless score .global fly_active matches 1 run effect clear @a[gamemode=!spectator,gamemode=!creative] minecraft:slow_falling
execute unless score .global fly_active matches 1 run return 0

# Ensure newly joined or respawned players have flight enabled while match is running
execute as @a[scores={fly_status=..0},gamemode=!spectator,gamemode=!creative] run scoreboard players set @s fly_status 3

# 1. Rising edge / Active Sneak Flight (Mode 3: Free Fly)
effect give @a[scores={fly_start=1..,fly_status=3},gamemode=!spectator,gamemode=!creative] minecraft:levitation 2 3 true
execute as @a[scores={fly_status=3},gamemode=!spectator,gamemode=!creative] at @s if block ~ ~-2 ~ air run effect give @s minecraft:slow_falling 1 1 true
execute at @a[scores={fly_start=1..,fly_status=3},gamemode=!spectator,gamemode=!creative] run particle minecraft:cloud ~ ~ ~ 0.1 0.1 0.1 0 1

# 2. Mode 2: Lock Y (Fixed Altitude Hover)
effect give @a[scores={fly_status=2},gamemode=!spectator,gamemode=!creative] minecraft:levitation 1 255 true
execute as @a[scores={fly_status=2},gamemode=!spectator,gamemode=!creative] at @s if block ~ ~-2 ~ air run effect give @s minecraft:slow_falling 1 1 true

# 3. Stop rising when Shift released
effect clear @a[scores={fly_start=0,fly_status=3},gamemode=!spectator,gamemode=!creative] minecraft:levitation

# 4. Trigger menu output (only if player typed /trigger fly)
tellraw @a[scores={fly=1..}] [{"text":"[Flight] ","color":"gold","bold":true},{"color":"green","text":"[Free Fly]","clickEvent":{"action":"run_command","value":"/trigger fly_status set 3"}},{"text":"  ","color":"gray"},{"color":"yellow","text":"[Lock Altitude]","clickEvent":{"action":"run_command","value":"/trigger fly_status set 2"}},{"text":"  ","color":"gray"},{"color":"red","text":"[Disable]","clickEvent":{"action":"run_command","value":"/trigger fly_status set 0"}}]

# 5. Reset scoreboard counters & re-enable triggers
scoreboard players set @a[scores={fly_start=1..}] fly_start 0
scoreboard players reset @a[scores={fly=1..}] fly
scoreboard players enable @a fly
scoreboard players enable @a fly_status
