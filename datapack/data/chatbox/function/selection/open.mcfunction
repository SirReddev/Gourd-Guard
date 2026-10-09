# Opens the Selection UI for @s
function chatbox:session/acquire
execute unless score @s chatbox.session matches 1..4 run return 0

# Set Session string tag based on player's assigned session
execute if score @s chatbox.session matches 1 run data modify storage chatbox:selection Session set value "s1"
execute if score @s chatbox.session matches 2 run data modify storage chatbox:selection Session set value "s2"
execute if score @s chatbox.session matches 3 run data modify storage chatbox:selection Session set value "s3"
execute if score @s chatbox.session matches 4 run data modify storage chatbox:selection Session set value "s4"

data modify storage chatbox:selection Active set value 1b

# Count total items defined in storage chatbox:selection Items
scoreboard players set #chatbox.selection_items loy.value 0
execute if data storage chatbox:selection Items[0] run scoreboard players add #chatbox.selection_items loy.value 1
execute if data storage chatbox:selection Items[1] run scoreboard players add #chatbox.selection_items loy.value 1
execute if data storage chatbox:selection Items[2] run scoreboard players add #chatbox.selection_items loy.value 1
execute if data storage chatbox:selection Items[3] run scoreboard players add #chatbox.selection_items loy.value 1
execute if data storage chatbox:selection Items[4] run scoreboard players add #chatbox.selection_items loy.value 1
execute if data storage chatbox:selection Items[5] run scoreboard players add #chatbox.selection_items loy.value 1
execute if data storage chatbox:selection Items[6] run scoreboard players add #chatbox.selection_items loy.value 1
execute if data storage chatbox:selection Items[7] run scoreboard players add #chatbox.selection_items loy.value 1
execute if data storage chatbox:selection Items[8] run scoreboard players add #chatbox.selection_items loy.value 1

# Ensure SpaceAfterName exists for each item (fallback to 135px if empty)
execute if data storage chatbox:selection Items[0] unless data storage chatbox:selection Items[0].SpaceAfterName run data modify storage chatbox:selection Items[0].SpaceAfterName set value "\uf107\uf102\uf101\uf100"
execute if data storage chatbox:selection Items[1] unless data storage chatbox:selection Items[1].SpaceAfterName run data modify storage chatbox:selection Items[1].SpaceAfterName set value "\uf107\uf102\uf101\uf100"
execute if data storage chatbox:selection Items[2] unless data storage chatbox:selection Items[2].SpaceAfterName run data modify storage chatbox:selection Items[2].SpaceAfterName set value "\uf107\uf102\uf101\uf100"
execute if data storage chatbox:selection Items[3] unless data storage chatbox:selection Items[3].SpaceAfterName run data modify storage chatbox:selection Items[3].SpaceAfterName set value "\uf107\uf102\uf101\uf100"
execute if data storage chatbox:selection Items[4] unless data storage chatbox:selection Items[4].SpaceAfterName run data modify storage chatbox:selection Items[4].SpaceAfterName set value "\uf107\uf102\uf101\uf100"
execute if data storage chatbox:selection Items[5] unless data storage chatbox:selection Items[5].SpaceAfterName run data modify storage chatbox:selection Items[5].SpaceAfterName set value "\uf107\uf102\uf101\uf100"
execute if data storage chatbox:selection Items[6] unless data storage chatbox:selection Items[6].SpaceAfterName run data modify storage chatbox:selection Items[6].SpaceAfterName set value "\uf107\uf102\uf101\uf100"
execute if data storage chatbox:selection Items[7] unless data storage chatbox:selection Items[7].SpaceAfterName run data modify storage chatbox:selection Items[7].SpaceAfterName set value "\uf107\uf102\uf101\uf100"
execute if data storage chatbox:selection Items[8] unless data storage chatbox:selection Items[8].SpaceAfterName run data modify storage chatbox:selection Items[8].SpaceAfterName set value "\uf107\uf102\uf101\uf100"

# Reset movement tracking objectives for exit detection
scoreboard players set @s chatbox.walk 0
scoreboard players set @s chatbox.sprint 0
scoreboard players set @s chatbox.shop_icon_timer 0
scoreboard players set @s chatbox.shop_icon_frame 0

# Read initial selected hotbar slot (0..8) and cycle modulo item count
execute store result score @s chatbox.selected_slot run data get entity @s SelectedItemSlot
execute if score #chatbox.selection_items loy.value matches 1.. run scoreboard players operation @s chatbox.selected_slot %= #chatbox.selection_items loy.value
scoreboard players operation @s chatbox.prev_slot = @s chatbox.selected_slot

# Store FooterRow (row index directly after items)
execute store result storage chatbox:selection FooterRow int 1 run scoreboard players get #chatbox.selection_items loy.value

# Reset dialogue typewriter buffers and disable dialogue end icon during selection mode
data modify storage chatbox:main Buffer set value []
data modify storage chatbox:main HistoryBuffer set value []
data modify storage chatbox:main InstantBuffer set value []
data modify storage chatbox:main IconBuffer set value []
data modify storage chatbox:main CurrentText set value '{"text":""}'
data modify storage chatbox:main CurrentCombine set value '{"text":""}'
data modify storage chatbox:main CurrentFrameCombine set value '{"text":""}'
scoreboard players set #chatbox.icon.flag loy.value 0
scoreboard players set #chatbox.character.flag loy.value 0
scoreboard players set #chatbox.frame.reflash.flag loy.value 0
function chatbox:manage/frame/icon/disable

# Turn off dialogue timer loop so dialogue manage/timer NEVER runs during selection
scoreboard players set #chatbox.bossbar.flag loy.value 0

# Setup bossbars for the active session
function chatbox:selection/open_bossbars with storage chatbox:selection

# Render all rows
function chatbox:selection/render

# Save session state
function chatbox:session/save

# Play subtle UI chime
playsound minecraft:ui.toast.in master @s ~ ~ ~ 0.4 1.1\n