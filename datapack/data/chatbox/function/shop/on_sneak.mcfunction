# Handles Shift / Sneak purchase input while shop is active
# Slots (indices 0..7) trigger purchase evaluation
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 0 if data storage chatbox:shop Items[0] run data modify storage chatbox:shop Temp set from storage chatbox:shop Items[0]
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 0 if data storage chatbox:shop Items[0] run function chatbox:shop/purchase
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 0 if data storage chatbox:shop Items[0] run scoreboard players set #chatbox.sneak.handled loy.value 1

execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 1 if data storage chatbox:shop Items[1] run data modify storage chatbox:shop Temp set from storage chatbox:shop Items[1]
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 1 if data storage chatbox:shop Items[1] run function chatbox:shop/purchase
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 1 if data storage chatbox:shop Items[1] run scoreboard players set #chatbox.sneak.handled loy.value 1

execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 2 if data storage chatbox:shop Items[2] run data modify storage chatbox:shop Temp set from storage chatbox:shop Items[2]
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 2 if data storage chatbox:shop Items[2] run function chatbox:shop/purchase
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 2 if data storage chatbox:shop Items[2] run scoreboard players set #chatbox.sneak.handled loy.value 1

execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 3 if data storage chatbox:shop Items[3] run data modify storage chatbox:shop Temp set from storage chatbox:shop Items[3]
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 3 if data storage chatbox:shop Items[3] run function chatbox:shop/purchase
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 3 if data storage chatbox:shop Items[3] run scoreboard players set #chatbox.sneak.handled loy.value 1

execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 4 if data storage chatbox:shop Items[4] run data modify storage chatbox:shop Temp set from storage chatbox:shop Items[4]
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 4 if data storage chatbox:shop Items[4] run function chatbox:shop/purchase
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 4 if data storage chatbox:shop Items[4] run scoreboard players set #chatbox.sneak.handled loy.value 1

execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 5 if data storage chatbox:shop Items[5] run data modify storage chatbox:shop Temp set from storage chatbox:shop Items[5]
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 5 if data storage chatbox:shop Items[5] run function chatbox:shop/purchase
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 5 if data storage chatbox:shop Items[5] run scoreboard players set #chatbox.sneak.handled loy.value 1

execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 6 if data storage chatbox:shop Items[6] run data modify storage chatbox:shop Temp set from storage chatbox:shop Items[6]
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 6 if data storage chatbox:shop Items[6] run function chatbox:shop/purchase
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 6 if data storage chatbox:shop Items[6] run scoreboard players set #chatbox.sneak.handled loy.value 1

execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 7 if data storage chatbox:shop Items[7] run data modify storage chatbox:shop Temp set from storage chatbox:shop Items[7]
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 7 if data storage chatbox:shop Items[7] run function chatbox:shop/purchase
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 7 if data storage chatbox:shop Items[7] run scoreboard players set #chatbox.sneak.handled loy.value 1

execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 8 if data storage chatbox:shop Items[8] run data modify storage chatbox:shop Temp set from storage chatbox:shop Items[8]
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 8 if data storage chatbox:shop Items[8] run function chatbox:shop/purchase
execute if score #chatbox.sneak.handled loy.value matches 0 if score @s chatbox.selected_slot matches 8 if data storage chatbox:shop Items[8] run scoreboard players set #chatbox.sneak.handled loy.value 1
