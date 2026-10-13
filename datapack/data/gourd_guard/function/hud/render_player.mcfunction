# Ensure player scores are initialized (Default: HUD enabled = 1, sync global shared coins for newly joined players)
execute unless score @s hud_toggle matches 0..1 run scoreboard players set @s hud_toggle 1
execute unless score @s coins matches 0.. as @a[scores={coins=0..},limit=1] run scoreboard players operation @p[scores={coins=..-1}] coins = @s coins
execute unless score @s coins matches 0.. if entity @a[scores={coins=1..}] run scoreboard players operation @s coins = @r[scores={coins=1..}] coins
execute unless score @s coins matches 0.. run scoreboard players set @s coins 0
execute unless score @s coins_diff matches 0.. run scoreboard players set @s coins_diff 0
execute unless score @s coins_pop matches 0.. run scoreboard players set @s coins_pop 0
execute unless score @s coins_pop_type matches 0.. run scoreboard players set @s coins_pop_type 0
execute unless score .global timer_sec matches 0.. run scoreboard players set .global timer_sec 0
execute unless score .global timer_min matches 0.. run scoreboard players set .global timer_min 0

# If player has toggled HUD off (hud_toggle = 0), clear actionbar and skip rendering
execute if score @s hud_toggle matches 0 run title @s actionbar {"text":""}
execute if score @s hud_toggle matches 0 run return 0

# Hide all HUD elements during Game Over (4) or Victory (3)
execute if score .wave state matches 3..4 run title @s actionbar {"text":""}
execute if score .wave state matches 3..4 run return 0

# Hide all HUD elements during Cutscene (cs.state 1..3)
execute if score .global cs.state matches 1..3 run title @s actionbar {"text":""}
execute if score .global cs.state matches 1..3 run return 0


# Resolve player username (cached in storage for singleplayer; refreshed in multiplayer)
execute unless data storage gourd_guard:hud macro.player run function gourd_guard:hud/fetch_player_name
execute if entity @a[limit=2] run function gourd_guard:hud/fetch_player_name

# Set default macro backsteps
data modify storage gourd_guard:hud macro.timer_pad set value "\uF80E"
data modify storage gourd_guard:hud macro.timer_back set value "\uF81A"
data modify storage gourd_guard:hud macro.coins_back set value "\uF806"
data modify storage gourd_guard:hud macro.pop_back set value "\uF80C"

# Calculate dynamic padding & backstep for match timer minutes (6px per digit)
execute if score .global timer_min matches 0..9 run data modify storage gourd_guard:hud macro.timer_pad set value "\uF80E"
execute if score .global timer_min matches 0..9 run data modify storage gourd_guard:hud macro.timer_back set value "\uF81A"
execute if score .global timer_min matches 10..99 run data modify storage gourd_guard:hud macro.timer_pad set value "\uF810\uF801"
execute if score .global timer_min matches 10..99 run data modify storage gourd_guard:hud macro.timer_back set value "\uF81C\uF801"
execute if score .global timer_min matches 100.. run data modify storage gourd_guard:hud macro.timer_pad set value "\uF814"
execute if score .global timer_min matches 100.. run data modify storage gourd_guard:hud macro.timer_back set value "\uF820"

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

# Render HUD (Game Timer stays white via shader)
function gourd_guard:hud/render/green with storage gourd_guard:hud macro