# Pathfinding - Transition finished branch to Common End (branch 3), nearby main branch, or Goal!

# If already finished Common End (branch 3), mob has reached the final goal
execute if score StartBranch path.cmp matches 3 run return 0

# Tag all nodes belonging to this mob's Map & Route for fast spatial lookup
tag @e[tag=path_node] remove path_route_node
execute as @e[tag=path_node] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_route_node

# 1. Check if this branch already ended directly at the Gourd (within 6.0 blocks of Pumpkin root)
#    (Unless Common End Node 1 is right in front of the mob within 3.0 blocks)
scoreboard players set #already_at_goal path.cmp 0
execute at @s if entity @e[tag=aj.gourdguard_pumpkin.root,distance=..6.0] unless entity @e[tag=path_route_node,scores={path.branch=3,path.node=1},distance=..3.0] run scoreboard players set #already_at_goal path.cmp 1
execute if score #already_at_goal path.cmp matches 1 run tag @e[tag=path_route_node] remove path_route_node
execute if score #already_at_goal path.cmp matches 1 run return 0

# 2. If a sub-branch (11..13) ended where it meets Option 2 (branch 2) and Common End Node 1 isn't right here (..4.5),
#    hop onto the nearest Option 2 node within 5.5 blocks so it merges seamlessly into Option 2!
execute if score StartBranch path.cmp matches 11..13 at @s unless entity @e[tag=path_route_node,scores={path.branch=3,path.node=1},distance=..4.5] as @e[tag=path_route_node,scores={path.branch=2},distance=..5.5,sort=nearest,limit=1] run tag @s add path_target

# 3. Likewise, if a sub-branch (21..23) ended where it meets Option 1 (branch 1) and Common End Node 1 isn't right here (..4.5),
#    hop onto the nearest Option 1 node within 5.5 blocks!
execute unless entity @e[tag=path_target] if score StartBranch path.cmp matches 21..23 at @s unless entity @e[tag=path_route_node,scores={path.branch=3,path.node=1},distance=..4.5] as @e[tag=path_route_node,scores={path.branch=1},distance=..5.5,sort=nearest,limit=1] run tag @s add path_target

# 4. Otherwise, transition to Common End (branch 3, node 1) if it exists on this route
execute unless entity @e[tag=path_target] as @e[tag=path_route_node,scores={path.branch=3,path.node=1},limit=1] run tag @s add path_target

tag @e[tag=path_route_node] remove path_route_node

# Apply transition if target found
execute if entity @e[tag=path_target] run scoreboard players operation @s path.branch = @e[tag=path_target,limit=1] path.branch
execute if entity @e[tag=path_target] run scoreboard players operation @s path.node = @e[tag=path_target,limit=1] path.node
execute if entity @e[tag=path_target] run scoreboard players operation MobBranch path.cmp = @s path.branch
execute if entity @e[tag=path_target] run scoreboard players operation MobNode path.cmp = @s path.node
