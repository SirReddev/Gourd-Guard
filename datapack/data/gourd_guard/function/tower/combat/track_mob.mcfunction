# Executed as each @e[tag=gg_mob] every tick
# Assign unique mob ID if new
execute unless score @s gg.mob_id matches 1.. run function gourd_guard:tower/combat/assign_mob_id

# Track sub-node ticks (resets when path.node advances, increments each tick otherwise)
execute unless score @s path.node = @s gg.mob_node_prev run scoreboard players set @s gg.mob_sub 0
execute unless score @s path.node = @s gg.mob_node_prev run scoreboard players operation @s gg.mob_node_prev = @s path.node
scoreboard players add @s gg.mob_sub 1

# Compute overall wave progression score: gg.mob_prog = path.branch * 100000 + path.node * 1000 + gg.mob_sub
# The mob with the highest gg.mob_prog is ALWAYS the first mob in the wave!
scoreboard players set #c100k math 100000
scoreboard players set #c1k math 1000
scoreboard players operation @s gg.mob_prog = @s path.branch
scoreboard players operation @s gg.mob_prog *= #c100k math
scoreboard players operation #node_part math = @s path.node
scoreboard players operation #node_part math *= #c1k math
scoreboard players operation @s gg.mob_prog += #node_part math
scoreboard players operation @s gg.mob_prog += @s gg.mob_sub
