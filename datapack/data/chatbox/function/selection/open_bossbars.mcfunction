# Clears dialogue bossbars and opens active row bossbars
$bossbar set chatbox:$(Session)_line_0 visible false
$bossbar set chatbox:$(Session)_line_1 visible false
$bossbar set chatbox:$(Session)_line_2 visible false
$bossbar set chatbox:$(Session)_frame visible false

# Ensure all 9 selection bossbars are hidden first
$bossbar set chatbox:$(Session)_shop_0 visible false
$bossbar set chatbox:$(Session)_shop_1 visible false
$bossbar set chatbox:$(Session)_shop_2 visible false
$bossbar set chatbox:$(Session)_shop_3 visible false
$bossbar set chatbox:$(Session)_shop_4 visible false
$bossbar set chatbox:$(Session)_shop_5 visible false
$bossbar set chatbox:$(Session)_shop_6 visible false
$bossbar set chatbox:$(Session)_shop_7 visible false
$bossbar set chatbox:$(Session)_shop_8 visible false

# Make active items visible + 1 footer row
$execute if score #chatbox.selection_items loy.value matches 1.. run bossbar set chatbox:$(Session)_shop_0 visible true
$execute if score #chatbox.selection_items loy.value matches 2.. run bossbar set chatbox:$(Session)_shop_1 visible true
$execute if score #chatbox.selection_items loy.value matches 3.. run bossbar set chatbox:$(Session)_shop_2 visible true
$execute if score #chatbox.selection_items loy.value matches 4.. run bossbar set chatbox:$(Session)_shop_3 visible true
$execute if score #chatbox.selection_items loy.value matches 5.. run bossbar set chatbox:$(Session)_shop_4 visible true
$execute if score #chatbox.selection_items loy.value matches 6.. run bossbar set chatbox:$(Session)_shop_5 visible true
$execute if score #chatbox.selection_items loy.value matches 7.. run bossbar set chatbox:$(Session)_shop_6 visible true
$execute if score #chatbox.selection_items loy.value matches 8.. run bossbar set chatbox:$(Session)_shop_7 visible true

# Make footer row visible
$execute if score #chatbox.selection_items loy.value matches 1 run bossbar set chatbox:$(Session)_shop_1 visible true
$execute if score #chatbox.selection_items loy.value matches 2 run bossbar set chatbox:$(Session)_shop_2 visible true
$execute if score #chatbox.selection_items loy.value matches 3 run bossbar set chatbox:$(Session)_shop_3 visible true
$execute if score #chatbox.selection_items loy.value matches 4 run bossbar set chatbox:$(Session)_shop_4 visible true
$execute if score #chatbox.selection_items loy.value matches 5 run bossbar set chatbox:$(Session)_shop_5 visible true
$execute if score #chatbox.selection_items loy.value matches 6 run bossbar set chatbox:$(Session)_shop_6 visible true
$execute if score #chatbox.selection_items loy.value matches 7 run bossbar set chatbox:$(Session)_shop_7 visible true
$execute if score #chatbox.selection_items loy.value matches 8 run bossbar set chatbox:$(Session)_shop_8 visible true\n