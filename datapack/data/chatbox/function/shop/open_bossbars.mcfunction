# Assign dialogue bossbars to @s with empty name so shop bossbars occupy consistent indices
$bossbar set chatbox:$(Session)_frame players @s
$bossbar set chatbox:$(Session)_line_0 players @s
$bossbar set chatbox:$(Session)_line_1 players @s
$bossbar set chatbox:$(Session)_line_2 players @s

$execute unless score #chatbox.vignette.flag loy.value matches 0 run bossbar set chatbox:$(Session)_frame name [{"text":"\ue000","font":"custom:chatbox/vignette","color":"#FBFBFA"}]
$execute if score #chatbox.vignette.flag loy.value matches 0 run bossbar set chatbox:$(Session)_frame name ""
$bossbar set chatbox:$(Session)_line_0 name ""
$bossbar set chatbox:$(Session)_line_1 name ""
$bossbar set chatbox:$(Session)_line_2 name ""

# Assign visible bossbars to @s dynamically based on item count
$bossbar set chatbox:$(Session)_shop_0 players
$bossbar set chatbox:$(Session)_shop_1 players
$bossbar set chatbox:$(Session)_shop_2 players
$bossbar set chatbox:$(Session)_shop_3 players
$bossbar set chatbox:$(Session)_shop_4 players
$bossbar set chatbox:$(Session)_shop_5 players
$bossbar set chatbox:$(Session)_shop_6 players
$bossbar set chatbox:$(Session)_shop_7 players
$bossbar set chatbox:$(Session)_shop_8 players

$execute if score #chatbox.shop_items loy.value matches 1.. run bossbar set chatbox:$(Session)_shop_0 players @s
$execute if score #chatbox.shop_items loy.value matches 2.. run bossbar set chatbox:$(Session)_shop_1 players @s
$execute if score #chatbox.shop_items loy.value matches 3.. run bossbar set chatbox:$(Session)_shop_2 players @s
$execute if score #chatbox.shop_items loy.value matches 4.. run bossbar set chatbox:$(Session)_shop_3 players @s
$execute if score #chatbox.shop_items loy.value matches 5.. run bossbar set chatbox:$(Session)_shop_4 players @s
$execute if score #chatbox.shop_items loy.value matches 6.. run bossbar set chatbox:$(Session)_shop_5 players @s
$execute if score #chatbox.shop_items loy.value matches 7.. run bossbar set chatbox:$(Session)_shop_6 players @s
$execute if score #chatbox.shop_items loy.value matches 8.. run bossbar set chatbox:$(Session)_shop_7 players @s
$execute if score #chatbox.shop_items loy.value matches 9.. run bossbar set chatbox:$(Session)_shop_8 players @s
