# Advance typewriter only if current page is not full (current.line < 3)
execute if data storage chatbox:main Buffer[0] unless score #chatbox.current.line loy.value matches 3.. run function chatbox:manage/newchar/timer

# If page is full (current.line >= 3) and more text remains, show [SHIFT] icon to prompt page turn
execute if data storage chatbox:main Buffer[0] if score #chatbox.current.line loy.value matches 3.. run function chatbox:manage/frame/icon/play

function chatbox:manage/frame/timer