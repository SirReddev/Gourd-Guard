# Ensure player scores are initialized (Default: HUD enabled = 1)
execute unless score @s hud_toggle matches 0..1 run scoreboard players set @s hud_toggle 1
execute unless score @s coins matches 0.. run scoreboard players set @s coins 0
execute unless score @s coins_diff matches 0.. run scoreboard players set @s coins_diff 0
execute unless score @s coins_pop matches 0.. run scoreboard players set @s coins_pop 0
execute unless score @s coins_pop_type matches 0.. run scoreboard players set @s coins_pop_type 0
execute unless score .global timer_sec matches 0.. run scoreboard players set .global timer_sec 0
execute unless score .global timer_min matches 0.. run scoreboard players set .global timer_min 5

# If player has toggled HUD off (hud_toggle = 0), skip rendering
execute if score @s hud_toggle matches 0 run return 0

# Ensure player has an attached invisible head display with their username
execute unless entity @e[type=item_display,tag=gg_player_head,distance=..2] run function gourd_guard:hud/init_player_head

# Copy player's username into macro storage (fallback to Sir_Reddev if loading)
data modify storage gourd_guard:hud macro.player set value "Sir_Reddev"
data modify storage gourd_guard:hud macro.player set from entity @e[type=item_display,tag=gg_player_head,distance=..2,limit=1] item.components."minecraft:profile".name

# Set default macro backsteps
data modify storage gourd_guard:hud macro.coins_back set value "\uF806"
data modify storage gourd_guard:hud macro.pop_back set value "\uF80C"

# Calculate dynamic backstep for coins digits (6px per digit)
execute if score @s coins matches 0..9 run data modify storage gourd_guard:hud macro.coins_back set value "\uF806"
execute if score @s coins matches 10..99 run data modify storage gourd_guard:hud macro.coins_back set value "\uF80C"
execute if score @s coins matches 100..999 run data modify storage gourd_guard:hud macro.coins_back set value "\uF810\uF802"
execute if score @s coins matches 1000..9999 run data modify storage gourd_guard:hud macro.coins_back set value "\uF814\uF804"
execute if score @s coins matches 10000.. run data modify storage gourd_guard:hud macro.coins_back set value "\uF81C\uF802"

# Calculate dynamic backstep for pop-up (+XX / -XX) (6px for symbol + 6px per diff digit)
execute if score @s coins_diff matches 0..9 run data modify storage gourd_guard:hud macro.pop_back set value "\uF80C"
execute if score @s coins_diff matches 10..99 run data modify storage gourd_guard:hud macro.pop_back set value "\uF810\uF802"
execute if score @s coins_diff matches 100..999 run data modify storage gourd_guard:hud macro.pop_back set value "\uF814\uF804"
execute if score @s coins_diff matches 1000..9999 run data modify storage gourd_guard:hud macro.pop_back set value "\uF81C\uF802"

# Route dynamically based on remaining match time:
# > 2:00 remaining -> Green (#0100FF)
execute if score .global timer_min matches 2.. run function gourd_guard:hud/render/green with storage gourd_guard:hud macro

# 1:00 - 1:59 remaining -> Yellow (#0101FF)
execute if score .global timer_min matches 1..1 run function gourd_guard:hud/render/yellow with storage gourd_guard:hud macro

# 0:30 - 0:59 remaining -> Orange (#0102FF)
execute if score .global timer_min matches 0..0 if score .global timer_sec matches 30..59 run function gourd_guard:hud/render/orange with storage gourd_guard:hud macro

# 0:00 - 0:29 remaining -> Red (#0103FF)
execute if score .global timer_min matches 0..0 if score .global timer_sec matches 0..29 run function gourd_guard:hud/render/red with storage gourd_guard:hud macro