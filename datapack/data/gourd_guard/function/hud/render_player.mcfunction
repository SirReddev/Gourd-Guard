# Ensure player scores are initialized (Default: HUD enabled = 1)
execute unless score @s hud_toggle matches 0..1 run scoreboard players set @s hud_toggle 1
execute unless score @s coins matches 0.. run scoreboard players set @s coins 0
execute unless score .global timer_sec matches 0.. run scoreboard players set .global timer_sec 0
execute unless score .global timer_min matches 0.. run scoreboard players set .global timer_min 5

# If player has toggled HUD off (hud_toggle = 0), skip rendering
execute if score @s hud_toggle matches 0 run return 0

# Route dynamically based on remaining match time:
# > 2:00 remaining -> Green (#0100FF)
execute if score .global timer_min matches 2.. run function gourd_guard:hud/render/green with storage gourd_guard:hud macro

# 1:00 - 1:59 remaining -> Yellow (#0101FF)
execute if score .global timer_min matches 1..1 run function gourd_guard:hud/render/yellow with storage gourd_guard:hud macro

# 0:30 - 0:59 remaining -> Orange (#0102FF)
execute if score .global timer_min matches 0..0 if score .global timer_sec matches 30..59 run function gourd_guard:hud/render/orange with storage gourd_guard:hud macro

# 0:00 - 0:29 remaining -> Red (#0103FF)
execute if score .global timer_min matches 0..0 if score .global timer_sec matches 0..29 run function gourd_guard:hud/render/red with storage gourd_guard:hud macro