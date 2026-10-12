# Pathfinding - Support mid-branch splits where a main branch continues AND a split/sub-branch forks off the middle of it
# Called when a mob on branch 0, 1, or 2 reaches a node (path_advance)

# --- Case 0: Mob is on Shared Start (branch 0), and Option 1/2 forks off the middle while branch 0 also continues ---
execute if score MobBranch path.cmp matches 0 unless entity @s[tag=path_passed_sub0] as @e[tag=path_node,scores={path.branch=1..22,path.node=1},distance=..4.5] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_mid_sub0

scoreboard players operation #next_node path.cmp = @s path.node
scoreboard players add #next_node path.cmp 1
scoreboard players set #opt0_continues path.cmp 0
execute if entity @e[tag=path_mid_sub0] as @e[tag=path_node,scores={path.branch=0}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.node = #next_node path.cmp run scoreboard players set #opt0_continues path.cmp 1

# Also check if ONLY one main option exists (meaning branch 0 was used as the other option)
scoreboard players set #has_opt1 path.cmp 0
scoreboard players set #has_opt2 path.cmp 0
execute if score #opt0_continues path.cmp matches 1 as @e[tag=path_node,scores={path.branch=1,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run scoreboard players set #has_opt1 path.cmp 1
execute if score #opt0_continues path.cmp matches 1 as @e[tag=path_node,scores={path.branch=2,path.node=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run scoreboard players set #has_opt2 path.cmp 1

# If both Option 1 and Option 2 start here at this fork, always transition into branch_from_0
execute if score #opt0_continues path.cmp matches 1 if score #has_opt1 path.cmp matches 1 if score #has_opt2 path.cmp matches 1 run tag @e[tag=path_node] remove path_target
execute if score #opt0_continues path.cmp matches 1 if score #has_opt1 path.cmp matches 1 if score #has_opt2 path.cmp matches 1 run function gourd_guard:path/mob/branch_from_0
execute if score #opt0_continues path.cmp matches 1 if score #has_opt1 path.cmp matches 1 if score #has_opt2 path.cmp matches 1 run tag @s remove path_advance
execute if score #opt0_continues path.cmp matches 1 if score #has_opt1 path.cmp matches 1 if score #has_opt2 path.cmp matches 1 run tag @e[tag=path_mid_sub0] remove path_mid_sub0
execute if score #opt0_continues path.cmp matches 1 if score #has_opt1 path.cmp matches 1 if score #has_opt2 path.cmp matches 1 run return 1

# If only one branch forks off the middle of Shared Start while Shared Start continues, alternate 50/50
execute if score #opt0_continues path.cmp matches 1 run tag @s add path_passed_sub0
execute if score #opt0_continues path.cmp matches 1 as @e[tag=path_mid_sub0,limit=1] unless score @s path.edit matches 1..2 run scoreboard players set @s path.edit 1
execute if score #opt0_continues path.cmp matches 1 run scoreboard players operation #mid_choice path.cmp = @e[tag=path_mid_sub0,limit=1] path.edit
execute if score #opt0_continues path.cmp matches 1 if score #mid_choice path.cmp matches 1 as @e[tag=path_mid_sub0,limit=1] run scoreboard players set @s path.edit 2
execute if score #opt0_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 as @e[tag=path_mid_sub0,limit=1] run scoreboard players set @s path.edit 1
execute if score #opt0_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 run tag @e[tag=path_node] remove path_target
execute if score #opt0_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 run function gourd_guard:path/mob/branch_from_0
execute if score #opt0_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 run tag @s remove path_advance
tag @e[tag=path_mid_sub0] remove path_mid_sub0

# --- Case A: Mob is on Option 1 (branch 1) ---
execute if score MobBranch path.cmp matches 1 unless entity @s[tag=path_passed_sub1] as @e[tag=path_node,scores={path.branch=11..12,path.node=1},distance=..4.5] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_mid_sub1

scoreboard players operation #next_node path.cmp = @s path.node
scoreboard players add #next_node path.cmp 1
scoreboard players set #opt1_continues path.cmp 0
execute if entity @e[tag=path_mid_sub1] as @e[tag=path_node,scores={path.branch=1}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.node = #next_node path.cmp run scoreboard players set #opt1_continues path.cmp 1

execute if score #opt1_continues path.cmp matches 1 run tag @s add path_passed_sub1
execute if score #opt1_continues path.cmp matches 1 as @e[tag=path_mid_sub1,limit=1] unless score @s path.edit matches 1..2 run scoreboard players set @s path.edit 1
execute if score #opt1_continues path.cmp matches 1 run scoreboard players operation #mid_choice path.cmp = @e[tag=path_mid_sub1,limit=1] path.edit
execute if score #opt1_continues path.cmp matches 1 if score #mid_choice path.cmp matches 1 as @e[tag=path_mid_sub1,limit=1] run scoreboard players set @s path.edit 2
execute if score #opt1_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 as @e[tag=path_mid_sub1,limit=1] run scoreboard players set @s path.edit 1

execute if score #opt1_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 run tag @e[tag=path_node] remove path_target
execute if score #opt1_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 run function gourd_guard:path/mob/subsplit_1
execute if score #opt1_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 run tag @s remove path_advance
tag @e[tag=path_mid_sub1] remove path_mid_sub1

# --- Case B: Mob is on Option 2 (branch 2) ---
execute if score MobBranch path.cmp matches 2 unless entity @s[tag=path_passed_sub2] as @e[tag=path_node,scores={path.branch=21..22,path.node=1},distance=..4.5] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp run tag @s add path_mid_sub2

scoreboard players operation #next_node path.cmp = @s path.node
scoreboard players add #next_node path.cmp 1
scoreboard players set #opt2_continues path.cmp 0
execute if entity @e[tag=path_mid_sub2] as @e[tag=path_node,scores={path.branch=2}] if score @s path.map = MobMap path.cmp if score @s path.route = MobRoute path.cmp if score @s path.node = #next_node path.cmp run scoreboard players set #opt2_continues path.cmp 1

execute if score #opt2_continues path.cmp matches 1 run tag @s add path_passed_sub2
execute if score #opt2_continues path.cmp matches 1 as @e[tag=path_mid_sub2,limit=1] unless score @s path.edit matches 1..2 run scoreboard players set @s path.edit 1
execute if score #opt2_continues path.cmp matches 1 run scoreboard players operation #mid_choice path.cmp = @e[tag=path_mid_sub2,limit=1] path.edit
execute if score #opt2_continues path.cmp matches 1 if score #mid_choice path.cmp matches 1 as @e[tag=path_mid_sub2,limit=1] run scoreboard players set @s path.edit 2
execute if score #opt2_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 as @e[tag=path_mid_sub2,limit=1] run scoreboard players set @s path.edit 1

execute if score #opt2_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 run tag @e[tag=path_node] remove path_target
execute if score #opt2_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 run function gourd_guard:path/mob/subsplit_2
execute if score #opt2_continues path.cmp matches 1 if score #mid_choice path.cmp matches 2 run tag @s remove path_advance
tag @e[tag=path_mid_sub2] remove path_mid_sub2
