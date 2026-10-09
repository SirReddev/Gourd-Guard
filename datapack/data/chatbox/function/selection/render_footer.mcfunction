# Renders the animated controls indicator footer on the row right below the last selection item
# Uses \ue308 (frame 0) and \ue309 (frame 1) showing [Cycle] | [Shift] to select | [Move] to exit
$execute if score @s chatbox.shop_icon_frame matches 0 run bossbar set chatbox:$(Session)_shop_$(FooterRow) name [{"text":"\ue308","font":"custom:chatbox/shop","color":"#FBFBA7"}]
$execute if score @s chatbox.shop_icon_frame matches 1 run bossbar set chatbox:$(Session)_shop_$(FooterRow) name [{"text":"\ue309","font":"custom:chatbox/shop","color":"#FBFBA7"}]\n