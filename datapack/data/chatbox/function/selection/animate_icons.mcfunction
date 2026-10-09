scoreboard players set @s chatbox.shop_icon_timer 0
execute if score @s chatbox.shop_icon_frame matches 0 run scoreboard players set @s chatbox.shop_icon_frame 1
execute unless score @s chatbox.shop_icon_frame matches 1 run scoreboard players set @s chatbox.shop_icon_frame 0
function chatbox:selection/render_footer with storage chatbox:selection\n