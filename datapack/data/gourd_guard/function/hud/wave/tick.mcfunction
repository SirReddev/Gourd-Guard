# Ensure scores are initialized
execute unless score .global wave matches 1.. run scoreboard players set .global wave 1

# Wave HUD only shows when waves are active (state 1 or 2)
execute unless score .wave state matches 1..2 if score .global wave_hud_toggle matches 0 run return 0
execute unless score .wave state matches 1..2 run scoreboard players set .global wave_hud_toggle 0
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_sign set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_sign_back set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_text set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_num set value '{"text":""}'
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_text_back set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_ghost set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_ghost_back set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_mobs_display set value '{"text":""}'
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_mobs_back set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_timer_tab set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_timer_tab_back set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_timer_icon set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_timer_icon_back set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_timer_display set value '{"text":""}'
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.wave_timer_back set value ""
execute unless score .wave state matches 1..2 run return 0

scoreboard players set .global wave_hud_toggle 1

# Live-count active path mobs for the Ghost Mob UI counter
scoreboard players set .global wave_mobs 0
execute as @e[tag=path_mob,scores={path.state=1..}] run scoreboard players add .global wave_mobs 1

# If HUD is toggled ON (1), populate storage
# Wave Sign: 26px -> backstep \uF81A (-26px)
data modify storage gourd_guard:hud macro.wave_sign set value "\uE200"
data modify storage gourd_guard:hud macro.wave_sign_back set value "\uF81A"
data modify storage gourd_guard:hud macro.wave_text set value "WAVE "
data modify storage gourd_guard:hud macro.wave_num set value '{"score":{"name":".global","objective":"wave"},"font":"gourd_guard:minecrafter","color":"#01BB04","shadow_color":-16699900}'
# Ghost Icon: 12px -> backstep \uF808\uF802 (-10px, shifted +2px right)
data modify storage gourd_guard:hud macro.wave_ghost set value "\uE201"
data modify storage gourd_guard:hud macro.wave_ghost_back set value "\uF808\uF802"
data modify storage gourd_guard:hud macro.wave_mobs_display set value '{"score":{"name":".global","objective":"wave_mobs"},"font":"gourd_guard:minecrafter","color":"#01BB03","shadow_color":-16699901}'

# Dynamic exact backstep for WAVE <score> (25px + digits)
execute if score .global wave matches 0..9 run data modify storage gourd_guard:hud macro.wave_text_back set value "\uF81C\uF802\uF801"
execute if score .global wave matches 10..99 run data modify storage gourd_guard:hud macro.wave_text_back set value "\uF822\uF802\uF801"
execute if score .global wave matches 100.. run data modify storage gourd_guard:hud macro.wave_text_back set value "\uF828\uF802\uF801"

# Dynamic exact backstep for <wave_mobs> (shifted +2px right)
execute if score .global wave_mobs matches 0..9 run data modify storage gourd_guard:hud macro.wave_mobs_back set value "\uF808"
execute if score .global wave_mobs matches 10..99 run data modify storage gourd_guard:hud macro.wave_mobs_back set value "\uF80E"
execute if score .global wave_mobs matches 100..999 run data modify storage gourd_guard:hud macro.wave_mobs_back set value "\uF814"
execute if score .global wave_mobs matches 1000.. run data modify storage gourd_guard:hud macro.wave_mobs_back set value "\uF81A"

# -------------------------------------------------------------
# Wave Intermission Timer Extension (State 2 Only)
# -------------------------------------------------------------
# When wave is active (State 1), hide intermission timer extension
execute if score .wave state matches 1 run data modify storage gourd_guard:hud macro.wave_timer_tab set value ""
execute if score .wave state matches 1 run data modify storage gourd_guard:hud macro.wave_timer_tab_back set value ""
execute if score .wave state matches 1 run data modify storage gourd_guard:hud macro.wave_timer_icon set value ""
execute if score .wave state matches 1 run data modify storage gourd_guard:hud macro.wave_timer_icon_back set value ""
execute if score .wave state matches 1 run data modify storage gourd_guard:hud macro.wave_timer_display set value '{"text":""}'
execute if score .wave state matches 1 run data modify storage gourd_guard:hud macro.wave_timer_back set value ""

# When intermission is active (State 2), show intermission timer extension
execute if score .wave state matches 2 run data modify storage gourd_guard:hud macro.wave_timer_tab set value "\uE202"
execute if score .wave state matches 2 run data modify storage gourd_guard:hud macro.wave_timer_tab_back set value "\uF80C"
execute if score .wave state matches 2 run data modify storage gourd_guard:hud macro.wave_timer_icon set value "\uE003"
execute if score .wave state matches 2 run data modify storage gourd_guard:hud macro.wave_timer_icon_back set value "\uF810"
execute if score .wave state matches 2 run data modify storage gourd_guard:hud macro.wave_timer_back set value "\uF814\uF804"

# Color 1: Green (> 10s remaining)
execute if score .wave state matches 2 if score .wave timer_min matches 1.. if score .wave timer_sec matches 10.. run data modify storage gourd_guard:hud macro.wave_timer_display set value '{"score":{"name":".wave","objective":"timer_min"},"font":"gourd_guard:minecrafter","color":"#01BB10","shadow_color":-16699888,"extra":[{"text":":"},{"score":{"name":".wave","objective":"timer_sec"}}]}'
execute if score .wave state matches 2 if score .wave timer_min matches 1.. if score .wave timer_sec matches 0..9 run data modify storage gourd_guard:hud macro.wave_timer_display set value '{"score":{"name":".wave","objective":"timer_min"},"font":"gourd_guard:minecrafter","color":"#01BB10","shadow_color":-16699888,"extra":[{"text":":0"},{"score":{"name":".wave","objective":"timer_sec"}}]}'
execute if score .wave state matches 2 if score .wave timer_min matches 0 if score .wave timer_sec matches 11.. run data modify storage gourd_guard:hud macro.wave_timer_display set value '{"score":{"name":".wave","objective":"timer_min"},"font":"gourd_guard:minecrafter","color":"#01BB10","shadow_color":-16699888,"extra":[{"text":":"},{"score":{"name":".wave","objective":"timer_sec"}}]}'

# Color 2: Yellow (8s - 10s remaining)
execute if score .wave state matches 2 if score .wave timer_min matches 0 if score .wave timer_sec matches 10..10 run data modify storage gourd_guard:hud macro.wave_timer_display set value '{"score":{"name":".wave","objective":"timer_min"},"font":"gourd_guard:minecrafter","color":"#01BB11","shadow_color":-16699887,"extra":[{"text":":"},{"score":{"name":".wave","objective":"timer_sec"}}]}'
execute if score .wave state matches 2 if score .wave timer_min matches 0 if score .wave timer_sec matches 8..9 run data modify storage gourd_guard:hud macro.wave_timer_display set value '{"score":{"name":".wave","objective":"timer_min"},"font":"gourd_guard:minecrafter","color":"#01BB11","shadow_color":-16699887,"extra":[{"text":":0"},{"score":{"name":".wave","objective":"timer_sec"}}]}'

# Color 3: Orange (4s - 7s remaining)
execute if score .wave state matches 2 if score .wave timer_min matches 0 if score .wave timer_sec matches 4..7 run data modify storage gourd_guard:hud macro.wave_timer_display set value '{"score":{"name":".wave","objective":"timer_min"},"font":"gourd_guard:minecrafter","color":"#01BB12","shadow_color":-16699886,"extra":[{"text":":0"},{"score":{"name":".wave","objective":"timer_sec"}}]}'

# Color 4: Red (0s - 3s remaining)
execute if score .wave state matches 2 if score .wave timer_min matches 0 if score .wave timer_sec matches 0..3 run data modify storage gourd_guard:hud macro.wave_timer_display set value '{"score":{"name":".wave","objective":"timer_min"},"font":"gourd_guard:minecrafter","color":"#01BB13","shadow_color":-16699885,"extra":[{"text":":0"},{"score":{"name":".wave","objective":"timer_sec"}}]}'
