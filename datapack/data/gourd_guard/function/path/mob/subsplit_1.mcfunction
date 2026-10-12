# Pathfinding - Sub-Split 1: Alternate 50/50 between Option 1A (branch 11) and Option 1B (branch 12)
# Uses per-route toggle stored on the route's Option 1A/1B Node 1 marker

tag @e[tag=path_node] remove path_sub1_opt
execute as @e[tag=path_node,scores={path.branch=11..12,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_sub1_opt

# If neither Option 1A nor Option 1B exists on this route, exit immediately
execute unless entity @e[tag=path_sub1_opt] run return 0

# Read & initialize per-route 1A/1B toggle (11 or 12) stored on the sub-option nodes
execute as @e[tag=path_sub1_opt,limit=1] unless score @s path.option matches 11..12 run scoreboard players set @s path.option 11
scoreboard players operation TrySub path.cmp = @e[tag=path_sub1_opt,limit=1] path.option

# Flip the per-route toggle on ALL sub-option nodes for the next mob (11 <-> 12)
execute if score TrySub path.cmp matches 11 as @e[tag=path_sub1_opt] run scoreboard players set @s path.option 12
execute if score TrySub path.cmp matches 12 as @e[tag=path_sub1_opt] run scoreboard players set @s path.option 11

# Tag the chosen sub-branch Node 1 (or fallback to whichever of 11/12 exists)
execute as @e[tag=path_sub1_opt] if score @s path.branch = TrySub path.cmp run tag @s add path_target
execute unless entity @e[tag=path_target] as @e[tag=path_sub1_opt,limit=1] run tag @s add path_target

tag @e[tag=path_sub1_opt] remove path_sub1_opt

# Update mob branch & node to the matched sub-branch
scoreboard players operation @s path.branch = @e[tag=path_target,limit=1] path.branch
scoreboard players set @s path.node 1
scoreboard players set MobNode path.cmp 1
scoreboard players operation MobBranch path.cmp = @s path.branch
return 1
