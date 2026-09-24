# Temp is already populated with the selected item. Check affordability.
function chatbox:shop/check_afford

# Execute purchase or denial based on #chatbox.can_afford score
execute if score #chatbox.can_afford loy.value matches 1 run function chatbox:shop/purchase_success with storage chatbox:shop Temp
execute unless score #chatbox.can_afford loy.value matches 1 run function chatbox:shop/purchase_denied with storage chatbox:shop Temp
