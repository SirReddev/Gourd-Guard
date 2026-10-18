# Cutscene System - Dialogue 1
# Executed at Peeves' initial position

# Play Peeves Idle animation
execute as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/idle/play_exclusive

# Queue Dialogue Sequence (Avatar: "peeves")
data modify storage chatbox:main Sequence set value [{Style:0,Avatar:"peeves",Sound:0,Buffer:[{Char:"H",Length:6},{Char:"a",Length:6},{Char:"p",Length:6},{Char:"p",Length:6},{Char:"y",Length:6},{Char:" ",Length:4},{Char:"H",Length:6},{Char:"a",Length:6},{Char:"l",Length:3},{Char:"l",Length:3},{Char:"o",Length:6},{Char:"w",Length:6},{Char:"e",Length:6},{Char:"e",Length:6},{Char:"n",Length:6},{Char:",",Length:2},{Next:1b},{Char:"A",Length:6},{Char:"d",Length:6},{Char:"v",Length:6},{Char:"e",Length:6},{Char:"n",Length:6},{Char:"t",Length:4},{Char:"u",Length:6},{Char:"r",Length:6},{Char:"e",Length:6},{Char:"r",Length:6},{Char:"(",Length:4},{Char:"s",Length:6},{Char:")",Length:4},{Char:"!",Length:2},{Char:" ",Length:4},{Char:"Y",Length:6},{Char:"o",Length:6},{Char:"u",Length:6},{Char:" ",Length:4},{Char:"s",Length:6},{Char:"e",Length:6},{Char:"e",Length:6},{Char:",",Length:2},{Next:1b},{Char:"o",Length:6},{Char:"u",Length:6},{Char:"r",Length:6},{Char:" ",Length:4},{Char:"t",Length:4},{Char:"o",Length:6},{Char:"w",Length:6},{Char:"n",Length:6},{Char:" ",Length:4},{Char:"i",Length:2},{Char:"s",Length:6},{Char:" ",Length:4},{Char:"i",Length:2},{Char:"n",Length:6}]},{Style:0,Avatar:"peeves",Sound:0,Buffer:[{Char:"g",Length:6},{Char:"r",Length:6},{Char:"a",Length:6},{Char:"v",Length:6},{Char:"e",Length:6},{Char:" ",Length:4},{Char:"D",Length:6},{Char:"A",Length:6},{Char:"N",Length:6},{Char:"G",Length:6},{Char:"E",Length:6},{Char:"R",Length:6},{Char:"!",Length:2}]},{Style:0,Avatar:"peeves",Sound:0,Buffer:[{Char:"M",Length:6},{Char:"y",Length:6},{Char:" ",Length:4},{Char:"n",Length:6},{Char:"a",Length:6},{Char:"m",Length:6},{Char:"e",Length:6},{Char:" ",Length:4},{Char:"i",Length:2},{Char:"s",Length:6},{Char:" ",Length:4},{Char:"P",Length:6},{Char:"e",Length:6},{Char:"e",Length:6},{Char:"v",Length:6},{Char:"e",Length:6},{Char:"s",Length:6},{Char:".",Length:2},{Next:1b},{Char:"P",Length:6},{Char:"l",Length:3},{Char:"e",Length:6},{Char:"a",Length:6},{Char:"s",Length:6},{Char:"e",Length:6},{Char:" ",Length:4},{Char:"f",Length:5},{Char:"o",Length:6},{Char:"l",Length:3},{Char:"l",Length:3},{Char:"o",Length:6},{Char:"w",Length:6},{Char:" ",Length:4},{Char:"m",Length:6},{Char:"e",Length:6},{Char:"!",Length:2}]}]

# When dialogue completes, trigger movement
data modify storage chatbox:main SequenceOnEnd set value "function gourd_guard:cutscene/start_move"

# Launch dialogue for the cutscene session and show bossbar to all players in multiplayer
execute as @a[tag=cs_viewer,limit=1] run function chatbox:sequence/start
execute unless entity @a[tag=cs_viewer] as @p run function chatbox:sequence/start
bossbar set chatbox:s1_frame players @a
bossbar set chatbox:s1_line_0 players @a
bossbar set chatbox:s1_line_1 players @a
bossbar set chatbox:s1_line_2 players @a
scoreboard players set @a chatbox.session 1

# Cutscene state 1 (Dialogue 1)
scoreboard players set .global cs.state 1
