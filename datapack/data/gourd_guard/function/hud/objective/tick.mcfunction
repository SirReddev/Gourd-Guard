# Ensure scores are initialized
execute unless score .global pumpkin_hp matches 0.. run scoreboard players set .global pumpkin_hp 100
execute unless score .global pumpkin_max_hp matches 1.. run scoreboard players set .global pumpkin_max_hp 100
execute unless score .global obj_hud_toggle matches 0..1 run scoreboard players set .global obj_hud_toggle 1

# If HUD is toggled OFF (0), clear storage
execute if score .global obj_hud_toggle matches 0 run data modify storage gourd_guard:hud macro.pumpkin set value ""
execute if score .global obj_hud_toggle matches 0 run data modify storage gourd_guard:hud macro.bar set value ""
execute if score .global obj_hud_toggle matches 0 run data modify storage gourd_guard:hud macro.backstep set value ""
execute if score .global obj_hud_toggle matches 0 run return 0

# If HUD is toggled ON (1), populate storage
# Pumpkin icon (18px) + Bar (54px) = 72px -> backstep \uF840\uF808 (-64 + -8 = -72px)
data modify storage gourd_guard:hud macro.pumpkin set value "\uE100"
data modify storage gourd_guard:hud macro.backstep set value "\uF840\uF808"

execute if score .global pumpkin_hp matches 0..4 run data modify storage gourd_guard:hud macro.bar set value "\uE101"
execute if score .global pumpkin_hp matches 5..9 run data modify storage gourd_guard:hud macro.bar set value "\uE102"
execute if score .global pumpkin_hp matches 10..14 run data modify storage gourd_guard:hud macro.bar set value "\uE103"
execute if score .global pumpkin_hp matches 15..19 run data modify storage gourd_guard:hud macro.bar set value "\uE104"
execute if score .global pumpkin_hp matches 20..24 run data modify storage gourd_guard:hud macro.bar set value "\uE105"
execute if score .global pumpkin_hp matches 25..29 run data modify storage gourd_guard:hud macro.bar set value "\uE106"
execute if score .global pumpkin_hp matches 30..34 run data modify storage gourd_guard:hud macro.bar set value "\uE107"
execute if score .global pumpkin_hp matches 35..39 run data modify storage gourd_guard:hud macro.bar set value "\uE108"
execute if score .global pumpkin_hp matches 40..44 run data modify storage gourd_guard:hud macro.bar set value "\uE109"
execute if score .global pumpkin_hp matches 45..49 run data modify storage gourd_guard:hud macro.bar set value "\uE10A"
execute if score .global pumpkin_hp matches 50..54 run data modify storage gourd_guard:hud macro.bar set value "\uE10B"
execute if score .global pumpkin_hp matches 55..59 run data modify storage gourd_guard:hud macro.bar set value "\uE10C"
execute if score .global pumpkin_hp matches 60..64 run data modify storage gourd_guard:hud macro.bar set value "\uE10D"
execute if score .global pumpkin_hp matches 65..69 run data modify storage gourd_guard:hud macro.bar set value "\uE10E"
execute if score .global pumpkin_hp matches 70..74 run data modify storage gourd_guard:hud macro.bar set value "\uE10F"
execute if score .global pumpkin_hp matches 75..79 run data modify storage gourd_guard:hud macro.bar set value "\uE110"
execute if score .global pumpkin_hp matches 80..84 run data modify storage gourd_guard:hud macro.bar set value "\uE111"
execute if score .global pumpkin_hp matches 85..89 run data modify storage gourd_guard:hud macro.bar set value "\uE112"
execute if score .global pumpkin_hp matches 90..94 run data modify storage gourd_guard:hud macro.bar set value "\uE113"
execute if score .global pumpkin_hp matches 95..99 run data modify storage gourd_guard:hud macro.bar set value "\uE114"
execute if score .global pumpkin_hp matches 100..100 run data modify storage gourd_guard:hud macro.bar set value "\uE115"
