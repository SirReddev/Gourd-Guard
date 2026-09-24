data modify storage chatbox:shop Temp set from storage chatbox:shop Items[0]
data modify storage chatbox:shop Temp.Row set value 0
data modify storage chatbox:shop Temp.DisplaySlot set value 1
function chatbox:shop/render_row/item with storage chatbox:shop Temp

data modify storage chatbox:shop Temp set from storage chatbox:shop Items[1]
data modify storage chatbox:shop Temp.Row set value 1
data modify storage chatbox:shop Temp.DisplaySlot set value 2
function chatbox:shop/render_row/item with storage chatbox:shop Temp

data modify storage chatbox:shop Temp set from storage chatbox:shop Items[2]
data modify storage chatbox:shop Temp.Row set value 2
data modify storage chatbox:shop Temp.DisplaySlot set value 3
function chatbox:shop/render_row/item with storage chatbox:shop Temp

data modify storage chatbox:shop Temp set from storage chatbox:shop Items[3]
data modify storage chatbox:shop Temp.Row set value 3
data modify storage chatbox:shop Temp.DisplaySlot set value 4
function chatbox:shop/render_row/item with storage chatbox:shop Temp

