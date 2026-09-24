# Acquires a free session (1..4) for player @s
# Reset sneak detection state for player
scoreboard players set @s chatbox.sneak 0
scoreboard players set @s chatbox.was_sneaking 1
scoreboard players set @s chatbox.sneak_cd 0

# If player already has a session, keeps it
execute if score @s chatbox.session matches 1..4 run return 1

# Check for first available session (1..4)
scoreboard players set @s chatbox.session 0
execute if score @s chatbox.session matches 0 unless score #chatbox.s1.busy loy.value matches 1 run scoreboard players set @s chatbox.session 1
execute if score @s chatbox.session matches 0 unless score #chatbox.s2.busy loy.value matches 1 run scoreboard players set @s chatbox.session 2
execute if score @s chatbox.session matches 0 unless score #chatbox.s3.busy loy.value matches 1 run scoreboard players set @s chatbox.session 3
execute if score @s chatbox.session matches 0 unless score #chatbox.s4.busy loy.value matches 1 run scoreboard players set @s chatbox.session 4

# If all 4 are busy, alert player and return 0
execute if score @s chatbox.session matches 0 run tellraw @s {"text":"[ChatBox] All 4 player slots are currently in use.","color":"#FF5252"}
execute if score @s chatbox.session matches 0 run return 0

# Mark session busy and attach player to that session's dialogue bossbars
execute if score @s chatbox.session matches 1 run scoreboard players set #chatbox.s1.busy loy.value 1
execute if score @s chatbox.session matches 1 run bossbar set chatbox:s1_frame players @s
execute if score @s chatbox.session matches 1 run bossbar set chatbox:s1_line_0 players @s
execute if score @s chatbox.session matches 1 run bossbar set chatbox:s1_line_1 players @s
execute if score @s chatbox.session matches 1 run bossbar set chatbox:s1_line_2 players @s

execute if score @s chatbox.session matches 2 run scoreboard players set #chatbox.s2.busy loy.value 1
execute if score @s chatbox.session matches 2 run bossbar set chatbox:s2_frame players @s
execute if score @s chatbox.session matches 2 run bossbar set chatbox:s2_line_0 players @s
execute if score @s chatbox.session matches 2 run bossbar set chatbox:s2_line_1 players @s
execute if score @s chatbox.session matches 2 run bossbar set chatbox:s2_line_2 players @s

execute if score @s chatbox.session matches 3 run scoreboard players set #chatbox.s3.busy loy.value 1
execute if score @s chatbox.session matches 3 run bossbar set chatbox:s3_frame players @s
execute if score @s chatbox.session matches 3 run bossbar set chatbox:s3_line_0 players @s
execute if score @s chatbox.session matches 3 run bossbar set chatbox:s3_line_1 players @s
execute if score @s chatbox.session matches 3 run bossbar set chatbox:s3_line_2 players @s

execute if score @s chatbox.session matches 4 run scoreboard players set #chatbox.s4.busy loy.value 1
execute if score @s chatbox.session matches 4 run bossbar set chatbox:s4_frame players @s
execute if score @s chatbox.session matches 4 run bossbar set chatbox:s4_line_0 players @s
execute if score @s chatbox.session matches 4 run bossbar set chatbox:s4_line_1 players @s
execute if score @s chatbox.session matches 4 run bossbar set chatbox:s4_line_2 players @s
