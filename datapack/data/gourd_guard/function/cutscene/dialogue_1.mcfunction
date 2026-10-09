# Cutscene System - Dialogue 1
# Executed at Peeves' initial position

# Play Peeves Idle animation
execute as @e[tag=peeves_ghost_root] run function aj:gourdguard_npc_ghost/animations/idle/play_exclusive

# Queue Dialogue Sequence
data modify storage chatbox:main Sequence set value [{"Style":0,"Avatar":"peeves","Sound":-1,"Buffer":[{"Char":"H","Length":6},{"Char":"e","Length":6},{"Char":"y","Length":6},{"Char":" ","Length":4},{"Char":"t","Length":4},{"Char":"h","Length":6},{"Char":"e","Length":6},{"Char":"r","Length":6},{"Char":"e","Length":6},{"Char":",","Length":2},{"Char":" ","Length":4},{"Char":"s","Length":6},{"Char":"t","Length":4},{"Char":"r","Length":6},{"Char":"a","Length":6},{"Char":"n","Length":6},{"Char":"g","Length":6},{"Char":"e","Length":6},{"Char":"r","Length":6},{"Char":"!","Length":2},{Next:1b},{"Char":"I","Length":4},{"Char":"\u2019","Length":2},{"Char":"m","Length":6},{"Char":" ","Length":4},{"Char":"P","Length":6},{"Char":"e","Length":6},{"Char":"e","Length":6},{"Char":"v","Length":6},{"Char":"e","Length":6},{"Char":"s","Length":6},{"Char":"!","Length":2},{"Char":" ","Length":4},{"Char":"C","Length":6},{"Char":"a","Length":6},{"Char":"m","Length":6},{"Char":"e","Length":6},{"Char":" ","Length":4},{"Char":"t","Length":4},{"Char":"o","Length":6},{"Char":" ","Length":4},{"Char":"h","Length":6},{"Char":"e","Length":6},{"Char":"l","Length":3},{"Char":"p","Length":6},{"Char":"?","Length":6}]},{"Style":0,"Avatar":"peeves","Sound":-1,"Buffer":[{"Char":"I","Length":4},{"Char":"\u2019","Length":2},{"Char":"l","Length":3},{"Char":"l","Length":3},{"Char":" ","Length":4},{"Char":"s","Length":6},{"Char":"h","Length":6},{"Char":"o","Length":6},{"Char":"w","Length":6},{"Char":" ","Length":4},{"Char":"y","Length":6},{"Char":"o","Length":6},{"Char":"u","Length":6},{"Char":" ","Length":4},{"Char":"a","Length":6},{"Char":"r","Length":6},{"Char":"o","Length":6},{"Char":"u","Length":6},{"Char":"n","Length":6},{"Char":"d","Length":6},{"Char":" ","Length":4},{"Char":"t","Length":4},{"Char":"o","Length":6},{"Char":"w","Length":6},{"Char":"n","Length":6},{"Char":"!","Length":2},{Next:1b},{"Char":"F","Length":6},{"Char":"o","Length":6},{"Char":"l","Length":3},{"Char":"l","Length":3},{"Char":"o","Length":6},{"Char":"w","Length":6},{"Char":" ","Length":4},{"Char":"m","Length":6},{"Char":"e","Length":6},{"Char":"!","Length":2}]}]

# When dialogue completes, trigger movement
data modify storage chatbox:main SequenceOnEnd set value "function gourd_guard:cutscene/start_move"

# Launch dialogue for the player
execute as @a[tag=cs_viewer,limit=1] run function chatbox:sequence/start

# Cutscene state 1 (Dialogue 1)
scoreboard players set .global cs.state 1
