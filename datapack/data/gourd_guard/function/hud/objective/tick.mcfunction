execute unless score .objective obj_max_hp matches 1.. run scoreboard players set .objective obj_max_hp 1000
execute unless score .objective obj_hp matches 0.. run scoreboard players set .objective obj_hp 1000

# Health bar only shows when waves are active (state 1 or 2)
execute unless score .wave state matches 1..2 if score .global obj_hud_toggle matches 0 run return 0
execute unless score .wave state matches 1..2 run scoreboard players set .global obj_hud_toggle 0
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.pumpkin set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.bar set value ""
execute unless score .wave state matches 1..2 run data modify storage gourd_guard:hud macro.backstep set value ""
execute unless score .wave state matches 1..2 run return 0

scoreboard players set .global obj_hud_toggle 1

# Clamp obj_hp between 0 and obj_max_hp
execute if score .objective obj_hp matches ..-1 run scoreboard players set .objective obj_hp 0
execute if score .objective obj_hp > .objective obj_max_hp run scoreboard players operation .objective obj_hp = .objective obj_max_hp

# Calculate percentage step: (obj_hp * 100) / obj_max_hp -> stored in .objective obj_step
scoreboard players operation .objective obj_step = .objective obj_hp
scoreboard players set .temp math 100
scoreboard players operation .objective obj_step *= .temp math
scoreboard players operation .objective obj_step /= .objective obj_max_hp

# If HUD is toggled ON (1), populate storage
# Pumpkin icon (28px) + Health Bar (86px)
data modify storage gourd_guard:hud macro.pumpkin set value "\uE100"
data modify storage gourd_guard:hud macro.backstep set value "\uF840\uF808"

# 20-step health bar: \uE101 (0%) to \uE115 (100%)
execute if score .objective obj_step matches 0..4 run data modify storage gourd_guard:hud macro.bar set value "\uE101"
execute if score .objective obj_step matches 5..9 run data modify storage gourd_guard:hud macro.bar set value "\uE102"
execute if score .objective obj_step matches 10..14 run data modify storage gourd_guard:hud macro.bar set value "\uE103"
execute if score .objective obj_step matches 15..19 run data modify storage gourd_guard:hud macro.bar set value "\uE104"
execute if score .objective obj_step matches 20..24 run data modify storage gourd_guard:hud macro.bar set value "\uE105"
execute if score .objective obj_step matches 25..29 run data modify storage gourd_guard:hud macro.bar set value "\uE106"
execute if score .objective obj_step matches 30..34 run data modify storage gourd_guard:hud macro.bar set value "\uE107"
execute if score .objective obj_step matches 35..39 run data modify storage gourd_guard:hud macro.bar set value "\uE108"
execute if score .objective obj_step matches 40..44 run data modify storage gourd_guard:hud macro.bar set value "\uE109"
execute if score .objective obj_step matches 45..49 run data modify storage gourd_guard:hud macro.bar set value "\uE10A"
execute if score .objective obj_step matches 50..54 run data modify storage gourd_guard:hud macro.bar set value "\uE10B"
execute if score .objective obj_step matches 55..59 run data modify storage gourd_guard:hud macro.bar set value "\uE10C"
execute if score .objective obj_step matches 60..64 run data modify storage gourd_guard:hud macro.bar set value "\uE10D"
execute if score .objective obj_step matches 65..69 run data modify storage gourd_guard:hud macro.bar set value "\uE10E"
execute if score .objective obj_step matches 70..74 run data modify storage gourd_guard:hud macro.bar set value "\uE10F"
execute if score .objective obj_step matches 75..79 run data modify storage gourd_guard:hud macro.bar set value "\uE110"
execute if score .objective obj_step matches 80..84 run data modify storage gourd_guard:hud macro.bar set value "\uE111"
execute if score .objective obj_step matches 85..89 run data modify storage gourd_guard:hud macro.bar set value "\uE112"
execute if score .objective obj_step matches 90..94 run data modify storage gourd_guard:hud macro.bar set value "\uE113"
execute if score .objective obj_step matches 95..99 run data modify storage gourd_guard:hud macro.bar set value "\uE114"
execute if score .objective obj_step matches 100.. run data modify storage gourd_guard:hud macro.bar set value "\uE115"