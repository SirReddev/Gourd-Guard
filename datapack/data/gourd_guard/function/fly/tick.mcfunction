# Adventure Mode Flying Engine - Main Tick Loop
# Runs every tick

# 0. Strict Game-State Verification:
# Flight is ONLY allowed if a match is active (#game_active gg_stats 1) AND (waves running .wave state 1..2 OR in post-intro grace period .global cs.state 4)
execute unless score #game_active gg_stats matches 1 run scoreboard players set .global fly_active 0
execute unless score .wave state matches 1..2 unless score .global cs.state matches 4 run scoreboard players set .global fly_active 0

# 1. Clean up gliders and return if flight is not active anywhere
execute unless score .global fly_active matches 1 run function gourd_guard:fly/disable
execute unless score .global fly_active matches 1 run return 0

# 2. Guarantee players in lobby coords (X: 2200..2350, Z: -100..60) NEVER have flight active or gliders equipped
execute in minecraft:overworld as @a[x=2200,y=-64,z=-100,dx=150,dy=120,dz=170] run item replace entity @s armor.chest with air
execute in minecraft:overworld as @a[x=2200,y=-64,z=-100,dx=150,dy=120,dz=170] run clear @s minecraft:elytra
execute in minecraft:overworld as @a[x=2200,y=-64,z=-100,dx=150,dy=120,dz=170] run effect clear @s minecraft:levitation
execute in minecraft:overworld as @a[x=2200,y=-64,z=-100,dx=150,dy=120,dz=170] run effect clear @s minecraft:slow_falling
execute in minecraft:overworld as @a[x=2200,y=-64,z=-100,dx=150,dy=120,dz=170] run scoreboard players set @s fly_hold 0

# 3. Suppress flight while in dialogue, shop, or selection menus
execute if data storage chatbox:main {SequenceActive:1b} as @a run scoreboard players set @s fly_hold 0
execute if data storage chatbox:main {SequenceActive:1b} as @a run effect clear @s minecraft:levitation
execute if data storage chatbox:shop {Active:1b} as @a run scoreboard players set @s fly_hold 0
execute if data storage chatbox:shop {Active:1b} as @a run effect clear @s minecraft:levitation
execute if data storage chatbox:selection {Active:1b} as @a run scoreboard players set @s fly_hold 0
execute if data storage chatbox:selection {Active:1b} as @a run effect clear @s minecraft:levitation

# If no chatbox UI is open, guarantee session is 0
execute unless data storage chatbox:main {SequenceActive:1b} unless data storage chatbox:shop {Active:1b} unless data storage chatbox:selection {Active:1b} run scoreboard players set @a chatbox.session 0

# 4. Clear flight hold and effects for any player NOT wearing an Elytra
execute as @a[gamemode=adventure] unless data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] run scoreboard players set @s fly_hold 0
execute as @a[gamemode=adventure] unless data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] run effect clear @s minecraft:levitation

# 5. Ensure players on the active game map (X >= 2400) have the locked Elytra equipped while flight is active
execute in minecraft:overworld as @a[x=2400,y=-64,z=-500,dx=600,dy=200,dz=1000,gamemode=adventure,tag=!gourd_test] unless data storage chatbox:main {SequenceActive:1b} unless data storage chatbox:shop {Active:1b} unless data storage chatbox:selection {Active:1b} unless data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] run item replace entity @s armor.chest with minecraft:elytra[minecraft:item_name={text:"Gourd Glider",color:"gold",bold:true},minecraft:custom_data={gg_glider:1b},minecraft:unbreakable={}]

# 6. Track continuous Sneak duration (in ticks) - only for players with glider equipped and not in dialogue/shop
execute in minecraft:overworld as @a[x=2400,y=-64,z=-500,dx=600,dy=200,dz=1000,gamemode=adventure,tag=!gourd_test] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] unless data storage chatbox:main {SequenceActive:1b} unless data storage chatbox:shop {Active:1b} unless data storage chatbox:selection {Active:1b} if predicate chatbox:is_sneaking run scoreboard players add @s fly_hold 1
execute as @a[gamemode=adventure] unless predicate chatbox:is_sneaking run scoreboard players set @s fly_hold 0

# 7. Clear levitation immediately when Shift is released
execute as @a[scores={fly_hold=0}] run effect clear @s minecraft:levitation

# 8. Ground Launch & Mid-Air Elevation Assist (Strictly requires Elytra equipped)
# AIRBORNE (>= 2 blocks in the air):
# - Sneak pumps altitude up so you can re-deploy wings or gain height anytime
execute as @a[scores={fly_hold=1..},gamemode=adventure] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] at @s if block ~ ~-2 ~ air run effect give @s minecraft:levitation 1 12 true
execute as @a[scores={fly_hold=1..},gamemode=adventure] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] at @s if block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.1 0.1 0.1 0 2

# GROUND LAUNCH (Requires holding Shift for >= 6 ticks = 0.3s to shoot up into the air):
# - Charge indicator particles during hold (ticks 3 to 5)
execute as @a[scores={fly_hold=3..5},gamemode=adventure] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] at @s unless block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.05 0.05 0.05 0.01 1
# - Launch high into the air once held for 6 ticks (Level 18 Levitation for snappy air launch)
execute as @a[scores={fly_hold=6..},gamemode=adventure] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] at @s unless block ~ ~-2 ~ air run effect give @s minecraft:levitation 1 18 true
execute as @a[scores={fly_hold=6..},gamemode=adventure] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] at @s unless block ~ ~-2 ~ air run particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.05 4

# 9. Clean up stray dropped gliders
execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data".gg_glider run kill @s

# 10. Re-enable trigger
scoreboard players enable @a fly_status
