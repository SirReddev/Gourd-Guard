function chatbox:session/s3/load

# Advance dialogue typewriter timer if dialogue active and shop not active
execute if score #chatbox.bossbar.flag loy.value matches 1 unless data storage chatbox:shop {Active:1b} run function chatbox:manage/timer

# Advance shop tick for hotbar cycling & movement exit
execute if data storage chatbox:shop {Active:1b} run function chatbox:shop/tick

function chatbox:session/s3/save
