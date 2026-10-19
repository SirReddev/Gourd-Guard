# Inject session to items
execute if score @s chatbox.session matches 1 run data modify storage chatbox:shop Session set value "s1"
execute if score @s chatbox.session matches 2 run data modify storage chatbox:shop Session set value "s2"
execute if score @s chatbox.session matches 3 run data modify storage chatbox:shop Session set value "s3"
execute if score @s chatbox.session matches 4 run data modify storage chatbox:shop Session set value "s4"
execute unless data storage chatbox:shop Session run data modify storage chatbox:shop Session set value "s1"
data modify storage chatbox:shop Items[0].Session set from storage chatbox:shop Session
data modify storage chatbox:shop Items[1].Session set from storage chatbox:shop Session
data modify storage chatbox:shop Items[2].Session set from storage chatbox:shop Session
data modify storage chatbox:shop Items[3].Session set from storage chatbox:shop Session
data modify storage chatbox:shop Items[4].Session set from storage chatbox:shop Session
data modify storage chatbox:shop Items[5].Session set from storage chatbox:shop Session
data modify storage chatbox:shop Items[6].Session set from storage chatbox:shop Session
data modify storage chatbox:shop Items[7].Session set from storage chatbox:shop Session
data modify storage chatbox:shop Items[8].Session set from storage chatbox:shop Session

# Ensure item count is populated for rendering
execute store result score #chatbox.shop_items loy.value run data get storage chatbox:shop FooterRow

# Renders active shop rows for the player ordered top-to-bottom
execute if score #chatbox.shop_items loy.value matches 1 run function chatbox:shop/render/count_1
execute if score #chatbox.shop_items loy.value matches 2 run function chatbox:shop/render/count_2
execute if score #chatbox.shop_items loy.value matches 3 run function chatbox:shop/render/count_3
execute if score #chatbox.shop_items loy.value matches 4 run function chatbox:shop/render/count_4
execute if score #chatbox.shop_items loy.value matches 5 run function chatbox:shop/render/count_5
execute if score #chatbox.shop_items loy.value matches 6 run function chatbox:shop/render/count_6
execute if score #chatbox.shop_items loy.value matches 7 run function chatbox:shop/render/count_7
execute if score #chatbox.shop_items loy.value matches 8 run function chatbox:shop/render/count_8
execute if score #chatbox.shop_items loy.value matches 9 run function chatbox:shop/render/count_9

# Render footer controls below item rows
function chatbox:shop/render_footer with storage chatbox:shop
