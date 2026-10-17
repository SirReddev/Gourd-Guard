# Temp is already populated with the selected item. Check affordability.
function chatbox:shop/check_afford

# If item has no action configured, alert player and prevent deduction
execute if score #chatbox.can_afford loy.value matches 1 unless data storage chatbox:shop Temp.Action run return run tellraw @s [{"text":"[Shop] ","color":"gold","bold":true},{"text":"This item is currently out of stock / coming soon!","color":"yellow"}]

# Execute purchase or denial based on #chatbox.can_afford score
execute if score #chatbox.can_afford loy.value matches 1 run function chatbox:shop/purchase_success with storage chatbox:shop Temp
execute unless score #chatbox.can_afford loy.value matches 1 run function chatbox:shop/purchase_denied with storage chatbox:shop Temp
