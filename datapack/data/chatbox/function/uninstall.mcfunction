# Stops sequences, off bossbars, clears tags and removes scoreboards and bossbars
function chatbox:reset

# Remove Session 1 Bossbars
bossbar remove chatbox:s1_frame
bossbar remove chatbox:s1_line_0
bossbar remove chatbox:s1_line_1
bossbar remove chatbox:s1_line_2
bossbar remove chatbox:s1_shop_0
bossbar remove chatbox:s1_shop_1
bossbar remove chatbox:s1_shop_2
bossbar remove chatbox:s1_shop_3
bossbar remove chatbox:s1_shop_4
bossbar remove chatbox:s1_shop_5
bossbar remove chatbox:s1_shop_6
bossbar remove chatbox:s1_shop_7
bossbar remove chatbox:s1_shop_8

# Remove Session 2 Bossbars
bossbar remove chatbox:s2_frame
bossbar remove chatbox:s2_line_0
bossbar remove chatbox:s2_line_1
bossbar remove chatbox:s2_line_2
bossbar remove chatbox:s2_shop_0
bossbar remove chatbox:s2_shop_1
bossbar remove chatbox:s2_shop_2
bossbar remove chatbox:s2_shop_3
bossbar remove chatbox:s2_shop_4
bossbar remove chatbox:s2_shop_5
bossbar remove chatbox:s2_shop_6
bossbar remove chatbox:s2_shop_7
bossbar remove chatbox:s2_shop_8

# Remove Session 3 Bossbars
bossbar remove chatbox:s3_frame
bossbar remove chatbox:s3_line_0
bossbar remove chatbox:s3_line_1
bossbar remove chatbox:s3_line_2
bossbar remove chatbox:s3_shop_0
bossbar remove chatbox:s3_shop_1
bossbar remove chatbox:s3_shop_2
bossbar remove chatbox:s3_shop_3
bossbar remove chatbox:s3_shop_4
bossbar remove chatbox:s3_shop_5
bossbar remove chatbox:s3_shop_6
bossbar remove chatbox:s3_shop_7
bossbar remove chatbox:s3_shop_8

# Remove Session 4 Bossbars
bossbar remove chatbox:s4_frame
bossbar remove chatbox:s4_line_0
bossbar remove chatbox:s4_line_1
bossbar remove chatbox:s4_line_2
bossbar remove chatbox:s4_shop_0
bossbar remove chatbox:s4_shop_1
bossbar remove chatbox:s4_shop_2
bossbar remove chatbox:s4_shop_3
bossbar remove chatbox:s4_shop_4
bossbar remove chatbox:s4_shop_5
bossbar remove chatbox:s4_shop_6
bossbar remove chatbox:s4_shop_7
bossbar remove chatbox:s4_shop_8

# Remove legacy frame/lines if existing
bossbar remove chatbox:frame
bossbar remove chatbox:line_0
bossbar remove chatbox:line_1
bossbar remove chatbox:line_2
bossbar remove chatbox:shop_0
bossbar remove chatbox:shop_1
bossbar remove chatbox:shop_2
bossbar remove chatbox:shop_3
bossbar remove chatbox:shop_4
bossbar remove chatbox:shop_5
bossbar remove chatbox:shop_6
bossbar remove chatbox:shop_7
bossbar remove chatbox:shop_8

# Remove scoreboards
scoreboard objectives remove chatbox.session
scoreboard objectives remove chatbox.selected_slot
scoreboard objectives remove chatbox.prev_slot
scoreboard objectives remove chatbox.shop_items
scoreboard objectives remove chatbox.walk
scoreboard objectives remove chatbox.sprint
scoreboard objectives remove chatbox.sneak
scoreboard objectives remove chatbox.sneak_cd
scoreboard objectives remove chatbox.was_sneaking
scoreboard objectives remove chatbox.candy
scoreboard objectives remove chatbox.gold

# Clear storages
data modify storage chatbox:main Sequence set value []
data modify storage chatbox:main SequenceActive set value 0b
data modify storage chatbox:shop Active set value 0b
data modify storage chatbox:shop Items set value []

data modify storage chatbox:s1_main Sequence set value []
data modify storage chatbox:s1_main SequenceActive set value 0b
data modify storage chatbox:s1_main Buffer set value []
data modify storage chatbox:s1_shop Active set value 0b
data modify storage chatbox:s1_shop Items set value []

data modify storage chatbox:s2_main Sequence set value []
data modify storage chatbox:s2_main SequenceActive set value 0b
data modify storage chatbox:s2_main Buffer set value []
data modify storage chatbox:s2_shop Active set value 0b
data modify storage chatbox:s2_shop Items set value []

data modify storage chatbox:s3_main Sequence set value []
data modify storage chatbox:s3_main SequenceActive set value 0b
data modify storage chatbox:s3_main Buffer set value []
data modify storage chatbox:s3_shop Active set value 0b
data modify storage chatbox:s3_shop Items set value []

data modify storage chatbox:s4_main Sequence set value []
data modify storage chatbox:s4_main SequenceActive set value 0b
data modify storage chatbox:s4_main Buffer set value []
data modify storage chatbox:s4_shop Active set value 0b
data modify storage chatbox:s4_shop Items set value []

tellraw @a [{"text":"[ChatBox] ","color":"#FF5252","bold":true},{"text":"ChatBox uninstalled cleanly. All bossbars and scoreboards removed.","color":"#FBFBFB"}]