# Pathfinding - Transition mob between route sections (supports nested splits!):
#   0  = Shared Start
#   1  = Option 1        -> can split into 11 (Option 1A) & 12 (Option 1B) -> optional 13 (Sub-Merge 1)
#   2  = Option 2        -> can split into 21 (Option 2A) & 22 (Option 2B) -> optional 23 (Sub-Merge 2)
#   3  = Common End (final shared merge)

# ==============================================================================
# 1. From Shared Start (branch 0) -> Split Option 1 (branch 1) or Option 2 (branch 2)
# ==============================================================================
execute if score MobBranch path.cmp matches 0 run scoreboard players operation TryBranch path.cmp = @s path.option
execute if score MobBranch path.cmp matches 0 unless score TryBranch path.cmp matches 1..2 run scoreboard players set TryBranch path.cmp 1
execute if score MobBranch path.cmp matches 0 as @e[tag=path_node,scores={path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.branch = TryBranch path.cmp run tag @s add path_target

# Fallback if only one of Option 1 / Option 2 exists
execute if score MobBranch path.cmp matches 0 unless entity @e[tag=path_target] if score TryBranch path.cmp matches 1 as @e[tag=path_node,scores={path.branch=2,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run scoreboard players set TryBranch path.cmp 2
execute if score MobBranch path.cmp matches 0 unless entity @e[tag=path_target] if score TryBranch path.cmp matches 2 as @e[tag=path_node,scores={path.branch=1,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run scoreboard players set TryBranch path.cmp 1
execute if score MobBranch path.cmp matches 0 unless entity @e[tag=path_target] as @e[tag=path_node,scores={path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.branch = TryBranch path.cmp run tag @s add path_target

execute if score MobBranch path.cmp matches 0 if entity @e[tag=path_target] run scoreboard players operation @s path.branch = TryBranch path.cmp
execute if score MobBranch path.cmp matches 0 if entity @e[tag=path_target] run scoreboard players set @s path.node 1
execute if score MobBranch path.cmp matches 0 if entity @e[tag=path_target] run scoreboard players set MobNode path.cmp 1
execute if score MobBranch path.cmp matches 0 if entity @e[tag=path_target] run scoreboard players operation MobBranch path.cmp = TryBranch path.cmp

# ==============================================================================
# 2. From Option 1 (branch 1) -> Sub-Split Option 1A (11) or Option 1B (12) (50/50 split)
# ==============================================================================
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 1 unless score #subsplit_1 path.cmp matches 11..12 run scoreboard players set #subsplit_1 path.cmp 11
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 1 run scoreboard players operation TryBranch path.cmp = #subsplit_1 path.cmp
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 1 as @e[tag=path_node,scores={path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.branch = TryBranch path.cmp run tag @s add path_target

# Fallback if only one of 1A / 1B exists
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 1 if score TryBranch path.cmp matches 11 as @e[tag=path_node,scores={path.branch=12,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run scoreboard players set TryBranch path.cmp 12
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 1 if score TryBranch path.cmp matches 12 as @e[tag=path_node,scores={path.branch=11,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run scoreboard players set TryBranch path.cmp 11
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 1 as @e[tag=path_node,scores={path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.branch = TryBranch path.cmp run tag @s add path_target

# Flip 1A/1B toggle and apply transition if sub-split found
execute if score MobBranch path.cmp matches 1 if entity @e[tag=path_target] if score #subsplit_1 path.cmp matches 11 run scoreboard players set #next_sub1 path.cmp 12
execute if score MobBranch path.cmp matches 1 if entity @e[tag=path_target] if score #subsplit_1 path.cmp matches 12 run scoreboard players set #next_sub1 path.cmp 11
execute if score MobBranch path.cmp matches 1 if entity @e[tag=path_target] run scoreboard players operation #subsplit_1 path.cmp = #next_sub1 path.cmp
execute if score MobBranch path.cmp matches 1 if entity @e[tag=path_target] run scoreboard players operation @s path.branch = TryBranch path.cmp
execute if score MobBranch path.cmp matches 1 if entity @e[tag=path_target] run scoreboard players set @s path.node 1
execute if score MobBranch path.cmp matches 1 if entity @e[tag=path_target] run scoreboard players set MobNode path.cmp 1
execute if score MobBranch path.cmp matches 1 if entity @e[tag=path_target] run scoreboard players operation MobBranch path.cmp = TryBranch path.cmp

# ==============================================================================
# 3. From Option 2 (branch 2) -> Sub-Split Option 2A (21) or Option 2B (22) (50/50 split)
# ==============================================================================
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 2 unless score #subsplit_2 path.cmp matches 21..22 run scoreboard players set #subsplit_2 path.cmp 21
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 2 run scoreboard players operation TryBranch path.cmp = #subsplit_2 path.cmp
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 2 as @e[tag=path_node,scores={path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.branch = TryBranch path.cmp run tag @s add path_target

# Fallback if only one of 2A / 2B exists
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 2 if score TryBranch path.cmp matches 21 as @e[tag=path_node,scores={path.branch=22,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run scoreboard players set TryBranch path.cmp 22
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 2 if score TryBranch path.cmp matches 22 as @e[tag=path_node,scores={path.branch=21,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run scoreboard players set TryBranch path.cmp 21
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 2 as @e[tag=path_node,scores={path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.branch = TryBranch path.cmp run tag @s add path_target

# Flip 2A/2B toggle and apply transition if sub-split found
execute if score MobBranch path.cmp matches 2 if entity @e[tag=path_target] if score #subsplit_2 path.cmp matches 21 run scoreboard players set #next_sub2 path.cmp 22
execute if score MobBranch path.cmp matches 2 if entity @e[tag=path_target] if score #subsplit_2 path.cmp matches 22 run scoreboard players set #next_sub2 path.cmp 21
execute if score MobBranch path.cmp matches 2 if entity @e[tag=path_target] run scoreboard players operation #subsplit_2 path.cmp = #next_sub2 path.cmp
execute if score MobBranch path.cmp matches 2 if entity @e[tag=path_target] run scoreboard players operation @s path.branch = TryBranch path.cmp
execute if score MobBranch path.cmp matches 2 if entity @e[tag=path_target] run scoreboard players set @s path.node 1
execute if score MobBranch path.cmp matches 2 if entity @e[tag=path_target] run scoreboard players set MobNode path.cmp 1
execute if score MobBranch path.cmp matches 2 if entity @e[tag=path_target] run scoreboard players operation MobBranch path.cmp = TryBranch path.cmp

# ==============================================================================
# 4. From Sub-Options 1A/1B (11..12) -> Optional Sub-Merge 1 (branch 13)
# ==============================================================================
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 11..12 as @e[tag=path_node,scores={path.branch=13,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_target
execute if score MobBranch path.cmp matches 11..12 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 13 run scoreboard players set @s path.branch 13
execute if score MobBranch path.cmp matches 11..12 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 13 run scoreboard players set @s path.node 1
execute if score MobBranch path.cmp matches 11..12 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 13 run scoreboard players set MobNode path.cmp 1
execute if score MobBranch path.cmp matches 11..12 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 13 run scoreboard players set MobBranch path.cmp 13

# ==============================================================================
# 5. From Sub-Options 2A/2B (21..22) -> Optional Sub-Merge 2 (branch 23)
# ==============================================================================
execute unless entity @e[tag=path_target] if score MobBranch path.cmp matches 21..22 as @e[tag=path_node,scores={path.branch=23,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_target
execute if score MobBranch path.cmp matches 21..22 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 23 run scoreboard players set @s path.branch 23
execute if score MobBranch path.cmp matches 21..22 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 23 run scoreboard players set @s path.node 1
execute if score MobBranch path.cmp matches 21..22 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 23 run scoreboard players set MobNode path.cmp 1
execute if score MobBranch path.cmp matches 21..22 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 23 run scoreboard players set MobBranch path.cmp 23

# ==============================================================================
# 6. From any branch (0, 1, 2, 11..13, 21..23) -> Common End (branch 3)
# ==============================================================================
execute unless entity @e[tag=path_target] unless score MobBranch path.cmp matches 3 as @e[tag=path_node,scores={path.branch=3,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_target
execute unless score MobBranch path.cmp matches 3 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 3 run scoreboard players set @s path.branch 3
execute unless score MobBranch path.cmp matches 3 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 3 run scoreboard players set @s path.node 1
execute unless score MobBranch path.cmp matches 3 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 3 run scoreboard players set MobNode path.cmp 1
execute unless score MobBranch path.cmp matches 3 if entity @e[tag=path_target] if score @e[tag=path_target,limit=1] path.branch matches 3 run scoreboard players set MobBranch path.cmp 3
