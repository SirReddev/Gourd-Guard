# Check affordability for this item
function chatbox:shop/check_afford

# Negative space after 252px banner (+1px font spacing = 253px): \uf007\uf006\uf005\uf004\uf003\uf002\uf000 (-253px)
# Left margin: \uf102\uf101 (+6px)
# Icon: $(Icon) (12px)
# Gap: \uf101 (+2px)
# Slot: [$(DisplaySlot)] (bold: true, 16px)
# Gap: \uf101 (+2px)
# Name column: $(Name)$(SpaceAfterName) (126px)
# Price column: $(Price)$(SpaceAfterPrice) (48px)
# Gap before button: \uf101 (+2px)
# Button / Placeholder: \ue102 (31px) or \uf104\uf103\uf102\uf101\uf100 (31px)
# Right margin: \uf103 (+8px)
# Total row width = 253px constant for all rows, selected and unselected!

# Selected Row - Affordable: [BUY] in mint green (#69F0AE)
$execute if score @s chatbox.selected_slot matches $(Slot) if score #chatbox.can_afford loy.value matches 1 run bossbar set chatbox:$(Session)_shop_$(Row) name [{"text":"\ue101","font":"custom:chatbox/shop","color":"#FBFBA5"},{"text":"\uf007\uf006\uf005\uf004\uf003\uf002\uf000","font":"custom:space","color":"#FBFBA5"},{"text":"\uf102\uf101","font":"custom:space","color":"#FBFBA5"},{"text":"$(Icon)","font":"custom:chatbox/shop","color":"#FBFBA6"},{"text":"\uf101","font":"custom:space","color":"#FBFBA5"},{"text":"[$(DisplaySlot)]","color":"#FFE082","bold":true},{"text":"\uf101","font":"custom:space","color":"#FBFBA5"},{"text":"$(Name)","color":"#FFF5C5"},{"text":"$(SpaceAfterName)","font":"custom:space","color":"#FBFBA5"},{"text":"$(Price)","color":"#FFD54F"},{"text":"$(SpaceAfterPrice)","font":"custom:space","color":"#FBFBA5"},{"text":"\uf101","font":"custom:space","color":"#FBFBA5"},{"text":"\ue102","font":"custom:chatbox/shop","color":"#69F0AE"},{"text":"\uf103","font":"custom:space","color":"#FBFBA5"}]

# Selected Row - Unaffordable: [ X ] in red (#FF5252)
$execute if score @s chatbox.selected_slot matches $(Slot) unless score #chatbox.can_afford loy.value matches 1 run bossbar set chatbox:$(Session)_shop_$(Row) name [{"text":"\ue101","font":"custom:chatbox/shop","color":"#FBFBA5"},{"text":"\uf007\uf006\uf005\uf004\uf003\uf002\uf000","font":"custom:space","color":"#FBFBA5"},{"text":"\uf102\uf101","font":"custom:space","color":"#FBFBA5"},{"text":"$(Icon)","font":"custom:chatbox/shop","color":"#FBFBA6"},{"text":"\uf101","font":"custom:space","color":"#FBFBA5"},{"text":"[$(DisplaySlot)]","color":"#FFE082","bold":true},{"text":"\uf101","font":"custom:space","color":"#FBFBA5"},{"text":"$(Name)","color":"#FFF5C5"},{"text":"$(SpaceAfterName)","font":"custom:space","color":"#FBFBA5"},{"text":"$(Price)","color":"#FF5252"},{"text":"$(SpaceAfterPrice)","font":"custom:space","color":"#FBFBA5"},{"text":"\uf101","font":"custom:space","color":"#FBFBA5"},{"text":"\ue103","font":"custom:chatbox/shop","color":"#FF5252"},{"text":"\uf103","font":"custom:space","color":"#FBFBA5"}]

# Unselected Row - Affordable: Price in gold (#FFB74D)
$execute unless score @s chatbox.selected_slot matches $(Slot) if score #chatbox.can_afford loy.value matches 1 run bossbar set chatbox:$(Session)_shop_$(Row) name [{"text":"\ue100","font":"custom:chatbox/shop","color":"#FBFBA4"},{"text":"\uf007\uf006\uf005\uf004\uf003\uf002\uf000","font":"custom:space","color":"#FBFBA4"},{"text":"\uf102\uf101","font":"custom:space","color":"#FBFBA4"},{"text":"$(Icon)","font":"custom:chatbox/shop","color":"#FBFBA6"},{"text":"\uf101","font":"custom:space","color":"#FBFBA4"},{"text":"[$(DisplaySlot)]","color":"#A0887E","bold":true},{"text":"\uf101","font":"custom:space","color":"#FBFBA4"},{"text":"$(Name)","color":"#D7CCC8"},{"text":"$(SpaceAfterName)","font":"custom:space","color":"#FBFBA4"},{"text":"$(Price)","color":"#FFB74D"},{"text":"$(SpaceAfterPrice)","font":"custom:space","color":"#FBFBA4"},{"text":"\uf101","font":"custom:space","color":"#FBFBA4"},{"text":"\uf104\uf103\uf102\uf101\uf100","font":"custom:space","color":"#FBFBA4"},{"text":"\uf103","font":"custom:space","color":"#FBFBA4"}]

# Unselected Row - Unaffordable: Price in muted red (#CF6679)
$execute unless score @s chatbox.selected_slot matches $(Slot) unless score #chatbox.can_afford loy.value matches 1 run bossbar set chatbox:$(Session)_shop_$(Row) name [{"text":"\ue100","font":"custom:chatbox/shop","color":"#FBFBA4"},{"text":"\uf007\uf006\uf005\uf004\uf003\uf002\uf000","font":"custom:space","color":"#FBFBA4"},{"text":"\uf102\uf101","font":"custom:space","color":"#FBFBA4"},{"text":"$(Icon)","font":"custom:chatbox/shop","color":"#FBFBA6"},{"text":"\uf101","font":"custom:space","color":"#FBFBA4"},{"text":"[$(DisplaySlot)]","color":"#A0887E","bold":true},{"text":"\uf101","font":"custom:space","color":"#FBFBA4"},{"text":"$(Name)","color":"#D7CCC8"},{"text":"$(SpaceAfterName)","font":"custom:space","color":"#FBFBA4"},{"text":"$(Price)","color":"#CF6679"},{"text":"$(SpaceAfterPrice)","font":"custom:space","color":"#FBFBA4"},{"text":"\uf101","font":"custom:space","color":"#FBFBA4"},{"text":"\uf104\uf103\uf102\uf101\uf100","font":"custom:space","color":"#FBFBA4"},{"text":"\uf103","font":"custom:space","color":"#FBFBA4"}]


