# Pathfinding - Transition mob between route sections (supports nested splits & unmerged subpaths!):
#   0  = Shared Start
#   1  = Option 1        -> can split into 11 (Option 1A) & 12 (Option 1B) -> optional 13 (Sub-Merge 1)
#   2  = Option 2        -> can split into 21 (Option 2A) & 22 (Option 2B) -> optional 23 (Sub-Merge 2)
#   3  = Common End (final shared merge)

# Snapshot the mob's branch before any transition so only one transition step runs
scoreboard players operation StartBranch path.cmp = @s path.branch

# 1. From Shared Start (branch 0) -> Split 50/50 into Option 1 side or Option 2 side
execute if score StartBranch path.cmp matches 0 run return run function gourd_guard:path/mob/branch_from_0

# 2. From Option 1 (branch 1) -> Sub-Split 50/50 into Option 1A (11) or Option 1B (12), else Common End / Goal
execute if score StartBranch path.cmp matches 1 run function gourd_guard:path/mob/subsplit_1
execute if score StartBranch path.cmp matches 1 if entity @e[tag=path_target] run return 1
execute if score StartBranch path.cmp matches 1 run return run function gourd_guard:path/mob/branch_to_end

# 3. From Option 2 (branch 2) -> Sub-Split 50/50 into Option 2A (21) or Option 2B (22), else Common End / Goal
execute if score StartBranch path.cmp matches 2 run function gourd_guard:path/mob/subsplit_2
execute if score StartBranch path.cmp matches 2 if entity @e[tag=path_target] run return 1
execute if score StartBranch path.cmp matches 2 run return run function gourd_guard:path/mob/branch_to_end

# 4. From Sub-Options 1A / 1B (11..12) -> Optional Sub-Merge 1 (branch 13) if not already at Gourd, else Common End / Option 2 / Goal
execute if score StartBranch path.cmp matches 11..12 at @s unless entity @e[tag=aj.gourdguard_pumpkin.root,distance=..6.0] as @e[tag=path_node,scores={path.branch=13,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_target
execute if score StartBranch path.cmp matches 11..12 if entity @e[tag=path_target] run scoreboard players set @s path.branch 13
execute if score StartBranch path.cmp matches 11..12 if entity @e[tag=path_target] run scoreboard players set @s path.node 1
execute if score StartBranch path.cmp matches 11..12 if entity @e[tag=path_target] run scoreboard players set MobBranch path.cmp 13
execute if score StartBranch path.cmp matches 11..12 if entity @e[tag=path_target] run scoreboard players set MobNode path.cmp 1
execute if score StartBranch path.cmp matches 11..12 if entity @e[tag=path_target] run return 1
execute if score StartBranch path.cmp matches 11..12 run return run function gourd_guard:path/mob/branch_to_end

# 5. From Sub-Options 2A / 2B (21..22) -> Optional Sub-Merge 2 (branch 23) if not already at Gourd, else Common End / Option 1 / Goal
execute if score StartBranch path.cmp matches 21..22 at @s unless entity @e[tag=aj.gourdguard_pumpkin.root,distance=..6.0] as @e[tag=path_node,scores={path.branch=23,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_target
execute if score StartBranch path.cmp matches 21..22 if entity @e[tag=path_target] run scoreboard players set @s path.branch 23
execute if score StartBranch path.cmp matches 21..22 if entity @e[tag=path_target] run scoreboard players set @s path.node 1
execute if score StartBranch path.cmp matches 21..22 if entity @e[tag=path_target] run scoreboard players set MobBranch path.cmp 23
execute if score StartBranch path.cmp matches 21..22 if entity @e[tag=path_target] run scoreboard players set MobNode path.cmp 1
execute if score StartBranch path.cmp matches 21..22 if entity @e[tag=path_target] run return 1
execute if score StartBranch path.cmp matches 21..22 run return run function gourd_guard:path/mob/branch_to_end

# 6. From Sub-Merge 1/2 (13, 23) or Common End (3) -> Common End / Goal
function gourd_guard:path/mob/branch_to_end
