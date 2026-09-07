# Ensure scoreboards exist
execute unless score .global timer_min matches 0.. run function gourd_guard:hud/setup

# Pin actionbar on screen with zero fading
title @a times 0 100 0

# 1. Update Match Timer (Only when active)
execute if score .global timer_active matches 1 run scoreboard players add .global timer_ticks 1
execute if score .global timer_active matches 1 if score .global timer_ticks matches 20.. run function gourd_guard:hud/timer_step

# 2. Track Candy Gain/Loss Deltas for Pop-Up Animation (+XX / -XX)
execute as @a run function gourd_guard:hud/candy/track_delta

# 3. Update Objective Health Bar
function gourd_guard:hud/objective/tick

# 4. Update Wave HUD
function gourd_guard:hud/wave/tick

# 5. Render HUD for each player
execute as @a run function gourd_guard:hud/render_player