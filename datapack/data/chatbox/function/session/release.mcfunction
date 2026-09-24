# Releases the active session for player @s
execute if score @s chatbox.session matches 1 run function chatbox:session/s1/release
execute if score @s chatbox.session matches 2 run function chatbox:session/s2/release
execute if score @s chatbox.session matches 3 run function chatbox:session/s3/release
execute if score @s chatbox.session matches 4 run function chatbox:session/s4/release
scoreboard players set @s chatbox.session 0
