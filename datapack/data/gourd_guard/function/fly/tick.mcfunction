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

# 3. Suppress flight while in dialogue, shop, or selection menus (PER-PLAYER)
execute as @a[scores={chatbox.session=1..4}] run scoreboard players set @s fly_hold 0
execute as @a[scores={chatbox.session=1..4}] run effect clear @s minecraft:levitation

# 4. Guarantee active game players wearing non-elytra or missing elytra get re-equipped with locked Gourd Glider
execute as @a[gamemode=adventure,tag=!gourd_test,scores={chatbox.session=0}] unless items entity @s armor.chest elytra run item replace entity @s armor.chest with minecraft:elytra[minecraft:item_name={text:"Gourd Glider",color:"gold",bold:true},minecraft:custom_data={gg_glider:1b},minecraft:unbreakable={},minecraft:enchantments={levels:{"minecraft:binding_curse":1}}]

# 5. Detect Sneak input (supports fly_start sneak_time, chatbox.was_sneaking, and predicate)
tag @a remove gg_is_sneaking
execute as @a[scores={fly_start=1..}] run tag @s add gg_is_sneaking
execute as @a[scores={chatbox.was_sneaking=1}] run tag @s add gg_is_sneaking
execute as @a[predicate=chatbox:is_sneaking] run tag @s add gg_is_sneaking

# 6. Track continuous Sneak duration (in ticks) - only for players with glider equipped and not in dialogue/shop
execute as @a[tag=gg_is_sneaking,scores={chatbox.session=0},gamemode=adventure,tag=!gourd_test] if items entity @s armor.chest elytra run scoreboard players add @s fly_hold 1
execute as @a[tag=!gg_is_sneaking] run scoreboard players set @s fly_hold 0
execute as @a[scores={chatbox.session=1..4}] run scoreboard players set @s fly_hold 0

# 7. Reset sneak_time counter for next tick
scoreboard players set @a[scores={fly_start=1..}] fly_start 0

# 8. Clear levitation immediately when Shift is released
execute as @a[scores={fly_hold=0}] run effect clear @s minecraft:levitation

# 9. Ground Launch & Elevation Boost while holding Shift:
# Instant lift + cloud particles on sneak hold
execute as @a[scores={fly_hold=1..},gamemode=adventure] if items entity @s armor.chest elytra run effect give @s minecraft:levitation 1 18 true
execute as @a[scores={fly_hold=1..},gamemode=adventure] if items entity @s armor.chest elytra run effect give @s minecraft:slow_falling 2 1 true
execute as @a[scores={fly_hold=1..},gamemode=adventure] at @s run particle minecraft:cloud ~ ~ ~ 0.15 0.1 0.15 0.05 3

# 10. Clean up stray dropped gliders
execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data".gg_glider run kill @s

# 11. Re-enable trigger
scoreboard players enable @a fly_status
