# Inject session to items
execute unless data storage chatbox:selection Session run data modify storage chatbox:selection Session set value "s1"
data modify storage chatbox:selection Items[0].Session set from storage chatbox:selection Session
data modify storage chatbox:selection Items[1].Session set from storage chatbox:selection Session
data modify storage chatbox:selection Items[2].Session set from storage chatbox:selection Session
data modify storage chatbox:selection Items[3].Session set from storage chatbox:selection Session
data modify storage chatbox:selection Items[4].Session set from storage chatbox:selection Session
data modify storage chatbox:selection Items[5].Session set from storage chatbox:selection Session
data modify storage chatbox:selection Items[6].Session set from storage chatbox:selection Session
data modify storage chatbox:selection Items[7].Session set from storage chatbox:selection Session
data modify storage chatbox:selection Items[8].Session set from storage chatbox:selection Session

# Renders active selection rows for the player ordered top-to-bottom
execute if score #chatbox.selection_items loy.value matches 1 run function chatbox:selection/render/count_1
execute if score #chatbox.selection_items loy.value matches 2 run function chatbox:selection/render/count_2
execute if score #chatbox.selection_items loy.value matches 3 run function chatbox:selection/render/count_3
execute if score #chatbox.selection_items loy.value matches 4 run function chatbox:selection/render/count_4
execute if score #chatbox.selection_items loy.value matches 5 run function chatbox:selection/render/count_5
execute if score #chatbox.selection_items loy.value matches 6 run function chatbox:selection/render/count_6
execute if score #chatbox.selection_items loy.value matches 7 run function chatbox:selection/render/count_7
execute if score #chatbox.selection_items loy.value matches 8 run function chatbox:selection/render/count_8
execute if score #chatbox.selection_items loy.value matches 9 run function chatbox:selection/render/count_9

# Render footer controls below item rows
function chatbox:selection/render_footer with storage chatbox:selection\n