# Pathfinding - Main Split from Shared Start (branch 0) -> Option 1 side or Option 2 side (50/50 at fork)
# Uses per-route toggle stored on the route's first split node so each route alternates independently when mobs arrive at the fork

tag @e[tag=path_node] remove path_fork_opt
execute as @e[tag=path_node,scores={path.branch=1..22,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_fork_opt

# If no split branches exist on this route, fall through to Common End / Goal check
execute unless entity @e[tag=path_fork_opt] run return run function gourd_guard:path/mob/branch_to_end

# Read & initialize per-route 1/2 toggle stored on the fork nodes
execute as @e[tag=path_fork_opt,limit=1] unless score @s path.edit matches 1..2 run scoreboard players set @s path.edit 1
scoreboard players operation TryBranch path.cmp = @e[tag=path_fork_opt,limit=1] path.edit

# Flip the per-route toggle on ALL fork nodes of this route for the next mob (1 <-> 2)
execute if score TryBranch path.cmp matches 1 as @e[tag=path_fork_opt] run scoreboard players set @s path.edit 2
execute if score TryBranch path.cmp matches 2 as @e[tag=path_fork_opt] run scoreboard players set @s path.edit 1

# 1. If chosen side is Option 1 (TryBranch = 1): try branch 1 first, then subsplit_1 (11/12) if branch 1 has no nodes
execute if score TryBranch path.cmp matches 1 as @e[tag=path_fork_opt,scores={path.branch=1}] run tag @s add path_target
execute if score TryBranch path.cmp matches 1 unless entity @e[tag=path_target] run function gourd_guard:path/mob/subsplit_1

# 2. If chosen side is Option 2 (TryBranch = 2): try branch 2 first, then subsplit_2 (21/22) if branch 2 has no nodes
execute if score TryBranch path.cmp matches 2 as @e[tag=path_fork_opt,scores={path.branch=2}] run tag @s add path_target
execute if score TryBranch path.cmp matches 2 unless entity @e[tag=path_target] run function gourd_guard:path/mob/subsplit_2

# 3. Fallback if only one side of the split exists on this route
execute unless entity @e[tag=path_target] as @e[tag=path_fork_opt,scores={path.branch=1}] run tag @s add path_target
execute unless entity @e[tag=path_target] as @e[tag=path_fork_opt,scores={path.branch=2}] run tag @s add path_target
execute unless entity @e[tag=path_target] run function gourd_guard:path/mob/subsplit_1
execute unless entity @e[tag=path_target] run function gourd_guard:path/mob/subsplit_2

tag @e[tag=path_fork_opt] remove path_fork_opt

# Update mob branch & node if a split target was found
execute if entity @e[tag=path_target] run scoreboard players operation @s path.branch = @e[tag=path_target,limit=1] path.branch
execute if entity @e[tag=path_target] run scoreboard players set @s path.node 1
execute if entity @e[tag=path_target] run scoreboard players set MobNode path.cmp 1
execute if entity @e[tag=path_target] run scoreboard players operation MobBranch path.cmp = @s path.branch
execute if entity @e[tag=path_target] run return 1

# Otherwise check Common End / Goal
function gourd_guard:path/mob/branch_to_end
