# Ensure dialogue bossbars are visible and assigned with empty name so selection bossbars stack underneath properly
$bossbar set chatbox:$(Session)_frame visible true
$bossbar set chatbox:$(Session)_line_0 visible true
$bossbar set chatbox:$(Session)_line_1 visible true
$bossbar set chatbox:$(Session)_line_2 visible true

$bossbar set chatbox:$(Session)_frame players @s
$bossbar set chatbox:$(Session)_line_0 players @s
$bossbar set chatbox:$(Session)_line_1 players @s
$bossbar set chatbox:$(Session)_line_2 players @s

$execute unless score #chatbox.vignette.flag loy.value matches 0 run bossbar set chatbox:$(Session)_frame name [{"text":"\ue000","font":"custom:chatbox/vignette","color":"#FBFBFA"}]
$execute if score #chatbox.vignette.flag loy.value matches 0 run bossbar set chatbox:$(Session)_frame name ""
$bossbar set chatbox:$(Session)_line_0 name ""
$bossbar set chatbox:$(Session)_line_1 name ""
$bossbar set chatbox:$(Session)_line_2 name ""

# Ensure all 9 selection bossbars are visible and detached
$bossbar set chatbox:$(Session)_shop_0 visible true
$bossbar set chatbox:$(Session)_shop_1 visible true
$bossbar set chatbox:$(Session)_shop_2 visible true
$bossbar set chatbox:$(Session)_shop_3 visible true
$bossbar set chatbox:$(Session)_shop_4 visible true
$bossbar set chatbox:$(Session)_shop_5 visible true
$bossbar set chatbox:$(Session)_shop_6 visible true
$bossbar set chatbox:$(Session)_shop_7 visible true
$bossbar set chatbox:$(Session)_shop_8 visible true

$bossbar set chatbox:$(Session)_shop_0 players
$bossbar set chatbox:$(Session)_shop_1 players
$bossbar set chatbox:$(Session)_shop_2 players
$bossbar set chatbox:$(Session)_shop_3 players
$bossbar set chatbox:$(Session)_shop_4 players
$bossbar set chatbox:$(Session)_shop_5 players
$bossbar set chatbox:$(Session)_shop_6 players
$bossbar set chatbox:$(Session)_shop_7 players
$bossbar set chatbox:$(Session)_shop_8 players

# Assign active item bossbars to @s
$execute if score #chatbox.selection_items loy.value matches 1.. run bossbar set chatbox:$(Session)_shop_0 players @s
$execute if score #chatbox.selection_items loy.value matches 2.. run bossbar set chatbox:$(Session)_shop_1 players @s
$execute if score #chatbox.selection_items loy.value matches 3.. run bossbar set chatbox:$(Session)_shop_2 players @s
$execute if score #chatbox.selection_items loy.value matches 4.. run bossbar set chatbox:$(Session)_shop_3 players @s
$execute if score #chatbox.selection_items loy.value matches 5.. run bossbar set chatbox:$(Session)_shop_4 players @s
$execute if score #chatbox.selection_items loy.value matches 6.. run bossbar set chatbox:$(Session)_shop_5 players @s
$execute if score #chatbox.selection_items loy.value matches 7.. run bossbar set chatbox:$(Session)_shop_6 players @s
$execute if score #chatbox.selection_items loy.value matches 8.. run bossbar set chatbox:$(Session)_shop_7 players @s
$execute if score #chatbox.selection_items loy.value matches 9.. run bossbar set chatbox:$(Session)_shop_8 players @s

# Assign footer row bossbar right after the items
$execute if score #chatbox.selection_items loy.value matches 1 run bossbar set chatbox:$(Session)_shop_1 players @s
$execute if score #chatbox.selection_items loy.value matches 2 run bossbar set chatbox:$(Session)_shop_2 players @s
$execute if score #chatbox.selection_items loy.value matches 3 run bossbar set chatbox:$(Session)_shop_3 players @s
$execute if score #chatbox.selection_items loy.value matches 4 run bossbar set chatbox:$(Session)_shop_4 players @s
$execute if score #chatbox.selection_items loy.value matches 5 run bossbar set chatbox:$(Session)_shop_5 players @s
$execute if score #chatbox.selection_items loy.value matches 6 run bossbar set chatbox:$(Session)_shop_6 players @s
$execute if score #chatbox.selection_items loy.value matches 7 run bossbar set chatbox:$(Session)_shop_7 players @s
$execute if score #chatbox.selection_items loy.value matches 8 run bossbar set chatbox:$(Session)_shop_8 players @s\n