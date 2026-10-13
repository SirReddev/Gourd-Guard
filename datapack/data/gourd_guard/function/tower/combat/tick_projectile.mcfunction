# Executed as & at each active firework projectile (@s)
scoreboard players add @s gg.fw_step 1

# Update target position from locked mob if still alive; if it died mid-flight, retarget to nearest gg_mob within 6b (or keep last known impact point)
scoreboard players operation #seek_tid gg.fw_tid = @s gg.fw_tid
tag @e remove gg_fw_lock
execute as @e[tag=gg_mob] if score @s gg.mob_id = #seek_tid gg.fw_tid run tag @s add gg_fw_lock
execute unless entity @e[tag=gg_fw_lock] as @n[tag=gg_mob,distance=..6] run tag @s add gg_fw_lock

execute if entity @e[tag=gg_fw_lock] store result score @s gg.fw_tx run data get entity @n[tag=gg_fw_lock] Pos[0] 100
execute if entity @e[tag=gg_fw_lock] store result score @s gg.fw_ty run data get entity @n[tag=gg_fw_lock] Pos[1] 100
execute if entity @e[tag=gg_fw_lock] run scoreboard players add @s gg.fw_ty 80
execute if entity @e[tag=gg_fw_lock] store result score @s gg.fw_tz run data get entity @n[tag=gg_fw_lock] Pos[2] 100

# Remaining ticks in the 14-tick arc: rem = 15 - step
scoreboard players set #rem math 15
scoreboard players operation #rem math -= @s gg.fw_step
execute if score #rem math matches ..0 run scoreboard players set #rem math 1

# Step linear base position (bx, by, bz) by 1 / rem toward (tx, ty, tz)
scoreboard players operation #dx math = @s gg.fw_tx
scoreboard players operation #dx math -= @s gg.fw_bx
scoreboard players operation #dx math /= #rem math
scoreboard players operation @s gg.fw_bx += #dx math

scoreboard players operation #dy math = @s gg.fw_ty
scoreboard players operation #dy math -= @s gg.fw_by
scoreboard players operation #dy math /= #rem math
scoreboard players operation @s gg.fw_by += #dy math

scoreboard players operation #dz math = @s gg.fw_tz
scoreboard players operation #dz math -= @s gg.fw_bz
scoreboard players operation #dz math /= #rem math
scoreboard players operation @s gg.fw_bz += #dz math

# Compute parabolic arc height (in hundredths of a block): arc_y = 6 * step * (14 - step)
# Peak at step=7 is +294 (+2.94 blocks high!), launching steeply upward and curving down into the target at step=14!
scoreboard players set #arc_inv math 14
scoreboard players operation #arc_inv math -= @s gg.fw_step
scoreboard players operation #arc_y math = @s gg.fw_step
scoreboard players operation #arc_y math *= #arc_inv math
scoreboard players set #c6 math 6
scoreboard players operation #arc_y math *= #c6 math

scoreboard players operation #world_y math = @s gg.fw_by
scoreboard players operation #world_y math += #arc_y math

# Use a temporary marker to orient the 3D firework rocket along its exact 3D curve tangent and move it there
summon minecraft:marker ~ ~ ~ {Tags:["gg_fw_helper"]}
execute store result entity @n[type=marker,tag=gg_fw_helper] Pos[0] double 0.01 run scoreboard players get @s gg.fw_bx
execute store result entity @n[type=marker,tag=gg_fw_helper] Pos[1] double 0.01 run scoreboard players get #world_y math
execute store result entity @n[type=marker,tag=gg_fw_helper] Pos[2] double 0.01 run scoreboard players get @s gg.fw_bz

# Face the next point on the curve so the rocket nose tilts up on launch, levels out at the apex, and dives nose-down!
execute at @s facing entity @n[type=marker,tag=gg_fw_helper] feet run tp @s ~ ~ ~ ~ ~
execute rotated as @s at @n[type=marker,tag=gg_fw_helper] run tp @s ~ ~ ~ ~ ~
kill @e[type=marker,tag=gg_fw_helper]

# Spawn trail along the arc (firework sparks for fireworks, copper scrape & wax for golem statues)
execute if entity @s[tag=!gg_cg_proj] at @s run particle minecraft:firework ~ ~ ~ 0.04 0.04 0.04 0.01 2
execute if entity @s[tag=!gg_cg_proj] at @s run particle minecraft:flame ~ ~ ~ 0.02 0.02 0.02 0.005 1
execute if entity @s[tag=gg_cg_proj] at @s run particle minecraft:wax_off ~ ~ ~ 0.05 0.05 0.05 0.02 3

# Mid-flight mob collision detection (steps 2..13):
# If the heavy projectile collides with any wave mob along its flight path, trigger impact immediately!
execute if score @s gg.fw_step matches 2..13 at @s if entity @e[tag=gg_mob,distance=..1.6] run scoreboard players set @s gg.fw_step 14

# On step 14 (impact!), detonate and damage the target + nearby splash mobs
execute if score @s gg.fw_step matches 14.. if entity @s[tag=!gg_cg_proj] at @s run function gourd_guard:tower/combat/on_impact
execute if score @s gg.fw_step matches 14.. if entity @s[tag=gg_cg_proj] at @s run function gourd_guard:tower/combat/on_golem_impact
tag @e remove gg_fw_lock
