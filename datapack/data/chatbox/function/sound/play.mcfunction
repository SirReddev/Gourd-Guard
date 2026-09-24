execute if score #chatbox.sound.id loy.value matches 0 at @s run function chatbox:sound/zzz/0
execute if score #chatbox.sound.id loy.value matches 1 at @s run function chatbox:sound/zzz/1
execute if score #chatbox.sound.id loy.value matches 2 at @s run function chatbox:sound/zzz/2
execute if score #chatbox.sound.id loy.value matches 3 at @s run function chatbox:sound/zzz/3
scoreboard players operation #chatbox.sound.timer loy.value = #chatbox.sound.interval loy.value