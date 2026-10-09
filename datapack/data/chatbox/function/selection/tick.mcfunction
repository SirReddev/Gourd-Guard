# Per-tick selection management for player @s with active selection UI
# 1. Exit when walking or sprinting forward
execute if score @s chatbox.walk matches 1.. if data storage chatbox:selection {Active:1b} at @s run function chatbox:selection/close
execute if score @s chatbox.sprint matches 1.. if data storage chatbox:selection {Active:1b} at @s run function chatbox:selection/close
scoreboard players set @s chatbox.walk 0
scoreboard players set @s chatbox.sprint 0

# 2. Track hotbar slot changes (0..8) and cycle modulo total item count
execute if data storage chatbox:selection {Active:1b} store result score @s chatbox.selected_slot run data get entity @s SelectedItemSlot
execute if data storage chatbox:selection {Active:1b} if score #chatbox.selection_items loy.value matches 1.. run scoreboard players operation @s chatbox.selected_slot %= #chatbox.selection_items loy.value

# 3. Only when slot changed: play click sound and re-render rows
execute if data storage chatbox:selection {Active:1b} unless score @s chatbox.selected_slot = @s chatbox.prev_slot at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.35 1.25
execute if data storage chatbox:selection {Active:1b} unless score @s chatbox.selected_slot = @s chatbox.prev_slot run function chatbox:selection/render
execute if data storage chatbox:selection {Active:1b} unless score @s chatbox.selected_slot = @s chatbox.prev_slot run scoreboard players operation @s chatbox.prev_slot = @s chatbox.selected_slot

# 4. Animate controls icon at bottom of selection UI (every 8 ticks, flips frames)
execute if data storage chatbox:selection {Active:1b} run scoreboard players add @s chatbox.shop_icon_timer 1
execute if data storage chatbox:selection {Active:1b} if score @s chatbox.shop_icon_timer matches 8.. run function chatbox:selection/animate_icons\n