# Load active session for @s into working memory
execute if score @s chatbox.session matches 1 run function chatbox:session/s1/load
execute if score @s chatbox.session matches 2 run function chatbox:session/s2/load
execute if score @s chatbox.session matches 3 run function chatbox:session/s3/load
execute if score @s chatbox.session matches 4 run function chatbox:session/s4/load
