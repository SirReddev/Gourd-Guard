# Adventure Mode Flying Engine - Main Tick Loop
# Runs every tick

# 1. Global match check
execute unless score .global fly_active matches 1 run return 0

# 2. Complete immunity during cutscenes, dialogues, and chatbox shop sessions
execute if score .global cs.state matches 1.. run return run effect clear @a minecraft:levitation
execute as @a[scores={chatbox.session=1..}] at @s run scoreboard players set @s fly_hold 0
execute as @a[scores={chatbox.session=1..}] at @s run effect clear @s minecraft:levitation
execute as @a[scores={chatbox.session=1..}] run return 0

# 3. Ensure all players have the locked Elytra equipped while match is running
execute as @a[gamemode=!spectator] unless data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] run item replace entity @s armor.chest with minecraft:elytra[minecraft:item_name={text:"Gourd Glider",color:"gold",bold:true},minecraft:custom_data={gg_glider:1b},minecraft:unbreakable={}]

# 4. Track continuous Sneak duration (in ticks)
execute as @a[gamemode=!spectator] if predicate chatbox:is_sneaking run scoreboard players add @s fly_hold 1
execute as @a[gamemode=!spectator] unless predicate chatbox:is_sneaking run scoreboard players set @s fly_hold 0

# 5. Clear levitation immediately when Shift is released
execute as @a[scores={fly_hold=0},gamemode=!spectator] run effect clear @s minecraft:levitation

# 6. Ground Launch & Mid-Air Elevation Assist
# AIRBORNE (>= 2 blocks in the air):
# - Sneak pumps altitude up so you can re-deploy wings or gain height anytime
execute as @a[scores={fly_hold=1..},gamemode=!spectator] at @s if block ~ ~-2 ~ air run effect give @s minecraft:levitation 1 6 true
execute as @a[scores={fly_hold=1..},gamemode=!spectator] at @s if block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.1 0.1 0.1 0 2

# GROUND LAUNCH (Requires holding Shift for >= 8 ticks = 0.4s to shoot up into the air):
# - Charge indicator particles during hold (ticks 4 to 7)
execute as @a[scores={fly_hold=4..7},gamemode=!spectator] at @s unless block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.05 0.05 0.05 0.01 1
# - Launch high into the air once held for 8 ticks (Level 8 Levitation for quick air entry)
execute as @a[scores={fly_hold=8..},gamemode=!spectator] at @s unless block ~ ~-2 ~ air run effect give @s minecraft:levitation 1 7 true
execute as @a[scores={fly_hold=8..},gamemode=!spectator] at @s unless block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.05 4

# 7. Clean up stray dropped gliders
execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data".gg_glider run kill @s

# 8. Re-enable trigger
scoreboard players enable @a fly_status
