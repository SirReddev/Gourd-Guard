# Save working memory into active session for @s
execute if score @s chatbox.session matches 1 run function chatbox:session/s1/save
execute if score @s chatbox.session matches 2 run function chatbox:session/s2/save
execute if score @s chatbox.session matches 3 run function chatbox:session/s3/save
execute if score @s chatbox.session matches 4 run function chatbox:session/s4/save
