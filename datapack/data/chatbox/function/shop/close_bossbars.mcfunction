$bossbar set chatbox:$(Session)_shop_0 players
$bossbar set chatbox:$(Session)_shop_1 players
$bossbar set chatbox:$(Session)_shop_2 players
$bossbar set chatbox:$(Session)_shop_3 players
$bossbar set chatbox:$(Session)_shop_4 players
$bossbar set chatbox:$(Session)_shop_5 players
$bossbar set chatbox:$(Session)_shop_6 players
$bossbar set chatbox:$(Session)_shop_7 players
$bossbar set chatbox:$(Session)_shop_8 players

$bossbar set chatbox:$(Session)_shop_0 name ""
$bossbar set chatbox:$(Session)_shop_1 name ""
$bossbar set chatbox:$(Session)_shop_2 name ""
$bossbar set chatbox:$(Session)_shop_3 name ""
$bossbar set chatbox:$(Session)_shop_4 name ""
$bossbar set chatbox:$(Session)_shop_5 name ""
$bossbar set chatbox:$(Session)_shop_6 name ""
$bossbar set chatbox:$(Session)_shop_7 name ""
$bossbar set chatbox:$(Session)_shop_8 name ""

# If not in sequence, hide dialogue bossbars too
$execute unless data storage chatbox:main {SequenceActive:1b} run bossbar set chatbox:$(Session)_frame name ""
$execute unless data storage chatbox:main {SequenceActive:1b} run bossbar set chatbox:$(Session)_line_0 name ""
$execute unless data storage chatbox:main {SequenceActive:1b} run bossbar set chatbox:$(Session)_line_1 name ""
$execute unless data storage chatbox:main {SequenceActive:1b} run bossbar set chatbox:$(Session)_line_2 name ""
$execute unless data storage chatbox:main {SequenceActive:1b} run bossbar set chatbox:$(Session)_frame players
$execute unless data storage chatbox:main {SequenceActive:1b} run bossbar set chatbox:$(Session)_line_0 players
$execute unless data storage chatbox:main {SequenceActive:1b} run bossbar set chatbox:$(Session)_line_1 players
$execute unless data storage chatbox:main {SequenceActive:1b} run bossbar set chatbox:$(Session)_line_2 players
