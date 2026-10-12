# Executed as the newly spawned firework projectile (@s) at the muzzle
tag @s remove gg_fw_new
scoreboard players operation @s gg.fw_tid = #shot_tid gg.fw_tid
scoreboard players operation @s gg.fw_dmg = #shot_dmg gg.fw_dmg
scoreboard players operation @s gg.fw_splash = #shot_splash gg.fw_splash
scoreboard players set @s gg.fw_step 0

# Store starting muzzle coordinates in hundredths of a block (scale 100)
execute store result score @s gg.fw_bx run data get entity @s Pos[0] 100
execute store result score @s gg.fw_by run data get entity @s Pos[1] 100
execute store result score @s gg.fw_bz run data get entity @s Pos[2] 100

# Initialize target coordinates from the target mob
execute as @e[tag=gg_mob] if score @s gg.mob_id = #shot_tid gg.fw_tid run tag @s add gg_fw_lock
execute if entity @e[tag=gg_fw_lock] store result score @s gg.fw_tx run data get entity @n[tag=gg_fw_lock] Pos[0] 100
execute if entity @e[tag=gg_fw_lock] store result score @s gg.fw_ty run data get entity @n[tag=gg_fw_lock] Pos[1] 100
execute if entity @e[tag=gg_fw_lock] run scoreboard players add @s gg.fw_ty 80
execute if entity @e[tag=gg_fw_lock] store result score @s gg.fw_tz run data get entity @n[tag=gg_fw_lock] Pos[2] 100
tag @e remove gg_fw_lock

# Point steeply upward initially along launch angle
tp @s ~ ~ ~ ~ -55
