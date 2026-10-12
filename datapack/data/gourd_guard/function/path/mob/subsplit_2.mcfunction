# Pathfinding - Sub-Split 2: Alternate 50/50 between Option 2A (branch 21) and Option 2B (branch 22)
# Uses per-route toggle stored on the route's Option 2A/2B Node 1 marker

tag @e[tag=path_node] remove path_sub2_opt
execute as @e[tag=path_node,scores={path.branch=21..22,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_sub2_opt

# If neither Option 2A nor Option 2B exists on this route, exit immediately
execute unless entity @e[tag=path_sub2_opt] run return 0

# Read & initialize per-route 2A/2B toggle (21 or 22) stored on the first sub-option node
execute as @e[tag=path_sub2_opt,limit=1] unless score @s path.option matches 21..22 run scoreboard players set @s path.option 21
scoreboard players operation TrySub path.cmp = @e[tag=path_sub2_opt,limit=1] path.option

# Flip the per-route toggle for the next mob (21 <-> 22)
execute if score TrySub path.cmp matches 21 as @e[tag=path_sub2_opt,limit=1] run scoreboard players set @s path.option 22
execute if score TrySub path.cmp matches 22 as @e[tag=path_sub2_opt,limit=1] run scoreboard players set @s path.option 21

# Tag the chosen sub-branch Node 1 (or fallback to whichever of 21/22 exists)
execute as @e[tag=path_sub2_opt] if score @s path.branch = TrySub path.cmp run tag @s add path_target
execute unless entity @e[tag=path_target] as @e[tag=path_sub2_opt,limit=1] run tag @s add path_target

tag @e[tag=path_sub2_opt] remove path_sub2_opt

# Update mob branch & node to the matched sub-branch
scoreboard players operation @s path.branch = @e[tag=path_target,limit=1] path.branch
scoreboard players set @s path.node 1
scoreboard players set MobNode path.cmp 1
scoreboard players operation MobBranch path.cmp = @s path.branch
return 1
