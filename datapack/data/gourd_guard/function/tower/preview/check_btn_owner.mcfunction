# Executed as a placement interaction entity (@s)
scoreboard players operation #check_pid gg.tower_pid = @s gg.tower_pid
scoreboard players set #has_owner math 0
execute as @a[scores={gg.tower_hold=1..}] if score @s gg.tower_pid = #check_pid gg.tower_pid run scoreboard players set #has_owner math 1
execute if score #has_owner math matches 0 run kill @s
