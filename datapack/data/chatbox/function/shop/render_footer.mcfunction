# Renders the animated controls indicator footer on the row right below the last shop item
$execute if score @s chatbox.shop_icon_frame matches 0 run bossbar set chatbox:$(Session)_shop_$(FooterRow) name [{"text":"\ue300","font":"custom:chatbox/shop","color":"#FBFBFB"}]
$execute if score @s chatbox.shop_icon_frame matches 1 run bossbar set chatbox:$(Session)_shop_$(FooterRow) name [{"text":"\ue301","font":"custom:chatbox/shop","color":"#FBFBFB"}]
