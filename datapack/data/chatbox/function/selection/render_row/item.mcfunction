# Row rendering for selection menu:
# Row banner: \ue100 (idle, 252px) or \ue101 (selected, 252px)
# Negative rewind after 252px banner (+1px spacing = 253px): \uf007\uf006\uf005\uf004\uf003\uf002\uf000 (-253px)
# Left margin: \uf103\uf102 (+12px)
# Slot: [$(DisplaySlot)] (bold: true, 16px)
# Gap: \uf102\uf101 (+6px)
# Option Name + SpaceAfterName = 219px
# Total visual row width = 253px constant for all rows, selected and unselected!

# Selected Row
$execute if score @s chatbox.selected_slot matches $(Slot) run bossbar set chatbox:$(Session)_shop_$(Row) name [{"text":"\ue101","font":"custom:chatbox/shop","color":"#FBFBA5"},{"text":"\uf007\uf006\uf005\uf004\uf003\uf002\uf000","font":"custom:space","color":"#FBFBA5"},{"text":"\uf103\uf102","font":"custom:space","color":"#FBFBA5"},{"text":"[$(DisplaySlot)]","color":"#FFE082","bold":true},{"text":"\uf102\uf101","font":"custom:space","color":"#FBFBA5"},{"text":"$(Name)","color":"#FFF5C5"},{"text":"$(SpaceAfterName)","font":"custom:space","color":"#FBFBA5"}]

# Unselected Row
$execute unless score @s chatbox.selected_slot matches $(Slot) run bossbar set chatbox:$(Session)_shop_$(Row) name [{"text":"\ue100","font":"custom:chatbox/shop","color":"#FBFBA4"},{"text":"\uf007\uf006\uf005\uf004\uf003\uf002\uf000","font":"custom:space","color":"#FBFBA4"},{"text":"\uf103\uf102","font":"custom:space","color":"#FBFBA4"},{"text":"[$(DisplaySlot)]","color":"#A0887E","bold":true},{"text":"\uf102\uf101","font":"custom:space","color":"#FBFBA4"},{"text":"$(Name)","color":"#D7CCC8"},{"text":"$(SpaceAfterName)","font":"custom:space","color":"#FBFBA4"}]
