# Adventure Mode Flying Engine - Main Tick Loop
# Runs every tick

# 1. Clean up gliders and return if flight is not active
execute unless score .global fly_active matches 1 as @a if data entity @s Inventory[{Slot:102b,components:{"minecraft:custom_data":{gg_glider:1b}}}] run function gourd_guard:fly/disable
execute unless score .global fly_active matches 1 run return 0

# 2. Reset flight hold & clear levitation for any player currently engaged in chatbox dialogue/shop
execute as @a[scores={chatbox.session=1..}] at @s run scoreboard players set @s fly_hold 0
execute as @a[scores={chatbox.session=1..}] at @s run effect clear @s minecraft:levitation

# 3. Ensure all players have the locked Elytra equipped while flight is active
execute as @a[gamemode=adventure] unless data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] run item replace entity @s armor.chest with minecraft:elytra[minecraft:item_name={text:"Gourd Glider",color:"gold",bold:true},minecraft:custom_data={gg_glider:1b},minecraft:unbreakable={}]

# 4. Track continuous Sneak duration (in ticks) - only for players not in chatbox sessions
execute as @a[gamemode=adventure] unless score @s chatbox.session matches 1.. if predicate chatbox:is_sneaking run scoreboard players add @s fly_hold 1
execute as @a[gamemode=adventure] unless predicate chatbox:is_sneaking run scoreboard players set @s fly_hold 0

# 5. Clear levitation immediately when Shift is released
execute as @a[scores={fly_hold=0},gamemode=!spectator] run effect clear @s minecraft:levitation

# 6. Ground Launch & Mid-Air Elevation Assist
# AIRBORNE (>= 2 blocks in the air):
# - Sneak pumps altitude up so you can re-deploy wings or gain height anytime
execute as @a[scores={fly_hold=1..},gamemode=!spectator] at @s if block ~ ~-2 ~ air run effect give @s minecraft:levitation 1 12 true
execute as @a[scores={fly_hold=1..},gamemode=!spectator] at @s if block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.1 0.1 0.1 0 2

# GROUND LAUNCH (Requires holding Shift for >= 8 ticks = 0.4s to shoot up into the air):
# - Charge indicator particles during hold (ticks 4 to 7)
execute as @a[scores={fly_hold=4..7},gamemode=!spectator] at @s unless block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.05 0.05 0.05 0.01 1
# - Launch high into the air once held for 8 ticks (Level 16 Levitation for fast snappy air launch)
execute as @a[scores={fly_hold=8..},gamemode=!spectator] at @s unless block ~ ~-2 ~ air run effect give @s minecraft:levitation 1 15 true
execute as @a[scores={fly_hold=8..},gamemode=!spectator] at @s unless block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.05 4

# 7. Clean up stray dropped gliders
execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data".gg_glider run kill @s

# 8. Re-enable trigger
scoreboard players enable @a fly_status
