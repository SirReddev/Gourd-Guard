# Toggles shop controls icon animation frame and refreshes footer
scoreboard players set @s chatbox.shop_icon_timer 0
scoreboard players add @s chatbox.shop_icon_frame 1
execute if score @s chatbox.shop_icon_frame matches 2.. run scoreboard players set @s chatbox.shop_icon_frame 0
function chatbox:shop/render_footer with storage chatbox:shop
