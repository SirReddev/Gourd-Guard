data modify storage chatbox:shop Temp set from storage chatbox:shop Items[0]
data modify storage chatbox:shop Temp.Row set value 0
data modify storage chatbox:shop Temp.DisplaySlot set value 1
function chatbox:shop/render_row/item with storage chatbox:shop Temp
