# Executed as each @e[tag=gg_mob] every tick
# Assign unique mob ID if new
execute unless score @s gg.mob_id matches 1.. run function gourd_guard:tower/combat/assign_mob_id

# Track sub-node ticks (resets when path.node advances, increments each tick otherwise)
execute unless score @s path.node = @s gg.mob_node_prev run scoreboard players set @s gg.mob_sub 0
execute unless score @s path.node = @s gg.mob_node_prev run scoreboard players operation @s gg.mob_node_prev = @s path.node
scoreboard players add @s gg.mob_sub 1

# Compute overall wave progression score:
# Stage 0: Branch 0 (Route entrance)
# Stage 1: Branch 1, 2, or sub-splits (Parallel route branches)
# Stage 2: Branch 3 (Common end route to Sacred Gourd)
scoreboard players set #mob_stage math 0
execute if score @s path.branch matches 1..2 run scoreboard players set #mob_stage math 1
execute if score @s path.branch matches 11..22 run scoreboard players set #mob_stage math 1
execute if score @s path.branch matches 3 run scoreboard players set #mob_stage math 2

scoreboard players set #c100k math 100000
scoreboard players set #c1k math 1000
scoreboard players operation @s gg.mob_prog = #mob_stage math
scoreboard players operation @s gg.mob_prog *= #c100k math
scoreboard players operation #node_part math = @s path.node
scoreboard players operation #node_part math *= #c1k math
scoreboard players operation @s gg.mob_prog += #node_part math
scoreboard players operation @s gg.mob_prog += @s gg.mob_sub
