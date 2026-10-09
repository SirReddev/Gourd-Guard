function chatbox:session/s4/load

# Advance dialogue typewriter timer if dialogue active and neither shop nor selection active
execute if score #chatbox.bossbar.flag loy.value matches 1 unless data storage chatbox:shop {Active:1b} unless data storage chatbox:selection {Active:1b} run function chatbox:manage/timer

# Advance selection tick for hotbar cycling & movement exit
execute if data storage chatbox:selection {Active:1b} run function chatbox:selection/tick

# Advance shop tick for hotbar cycling & movement exit
execute if data storage chatbox:shop {Active:1b} run function chatbox:shop/tick

function chatbox:session/s4/save
