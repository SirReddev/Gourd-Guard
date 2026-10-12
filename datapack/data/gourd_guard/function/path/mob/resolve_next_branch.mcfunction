# Pathfinding - Transition mob between route sections:
#   Branch 0 (Shared Start) -> Branch 1 or 2 (Split Option 1 / Option 2) -> Branch 3 (Common End)
# Called only when no path_target was found for the mob's current branch & node index.

# 1. If currently on Shared Start (branch 0), transition to the mob's assigned Split Option (branch 1 or 2)
execute if score MobBranch path.cmp matches 0 run scoreboard players operation TryBranch path.cmp = @s path.option
execute if score MobBranch path.cmp matches 0 unless score TryBranch path.cmp matches 1..2 run scoreboard players set TryBranch path.cmp 1
execute if score MobBranch path.cmp matches 0 as @e[tag=path_node,scores={path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.branch = TryBranch path.cmp run tag @s add path_target

# Fallback if only one of the two split options has nodes placed on this route
execute if score MobBranch path.cmp matches 0 unless entity @e[tag=path_target] if score TryBranch path.cmp matches 1 as @e[tag=path_node,scores={path.branch=2,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run scoreboard players set TryBranch path.cmp 2
execute if score MobBranch path.cmp matches 0 unless entity @e[tag=path_target] if score TryBranch path.cmp matches 2 as @e[tag=path_node,scores={path.branch=1,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run scoreboard players set TryBranch path.cmp 1
execute if score MobBranch path.cmp matches 0 unless entity @e[tag=path_target] as @e[tag=path_node,scores={path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.branch = TryBranch path.cmp run tag @s add path_target

# Apply transition to Split Option (1 or 2) if found
execute if score MobBranch path.cmp matches 0 if entity @e[tag=path_target] run scoreboard players operation @s path.branch = TryBranch path.cmp
execute if score MobBranch path.cmp matches 0 if entity @e[tag=path_target] run scoreboard players set @s path.node 1
execute if score MobBranch path.cmp matches 0 if entity @e[tag=path_target] run scoreboard players set MobNode path.cmp 1
execute if score MobBranch path.cmp matches 0 if entity @e[tag=path_target] run scoreboard players operation MobBranch path.cmp = TryBranch path.cmp

# 2. If on Split Option (branch 1 or 2) — or on branch 0 with no split options — transition to Common End (branch 3)
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 0..2 as @e[tag=path_node,scores={path.branch=3,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_target
execute if score MobBranch path.cmp matches 0..2 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 3 run scoreboard players set @s path.branch 3
execute if score MobBranch path.cmp matches 0..2 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 3 run scoreboard players set @s path.node 1
execute if score MobBranch path.cmp matches 0..2 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 3 run scoreboard players set MobNode path.cmp 1
execute if score MobBranch path.cmp matches 0..2 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 3 run scoreboard players set MobBranch path.cmp 3
