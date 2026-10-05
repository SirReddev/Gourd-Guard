# Pathfinding System - Help / Command Reference
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
tellraw @s [{"text":"  🗺 ","color":"white"},{"text":"Pathfinding System","color":"green","bold":true}]
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
tellraw @s {"text":"  Route Setup:","color":"gold","bold":true}
tellraw @s [{"text":"  "},{"text":"[begin {route:N}]","color":"aqua","bold":true,"click_event":{"action":"suggest_command","command":"/function gourd_guard:path/route/begin {route:1}"}},{"text":"  start editing route N","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[add_node]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:path/route/add_node"}},{"text":"  place node at your position","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[show {route:N}]","color":"aqua","bold":true,"click_event":{"action":"suggest_command","command":"/function gourd_guard:path/route/show {route:1}"}},{"text":"  visualize a route","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[clear {route:N}]","color":"red","bold":true,"click_event":{"action":"suggest_command","command":"/function gourd_guard:path/route/clear {route:1}"}},{"text":"  delete route nodes","color":"gray"}]
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}
tellraw @s {"text":"  Mob Assignment:","color":"gold","bold":true}
tellraw @s [{"text":"  "},{"text":"[assign mob to route]","color":"aqua","bold":true,"click_event":{"action":"suggest_command","command":"/execute as @e[type=zombie,distance=..5,limit=1] run function gourd_guard:path/route/assign {route:1}"}},{"text":"  (click to fill in)","color":"gray"}]
tellraw @s {"text":"  Example: execute as @e[type=zombie,distance=..5] run","color":"dark_gray"}
tellraw @s {"text":"           function gourd_guard:path/route/assign {route:1}","color":"dark_gray"}
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}
tellraw @s {"text":"  Tips:","color":"gold","bold":true}
tellraw @s {"text":"  • Place nodes every 2-5 blocks for smooth paths","color":"gray"}
tellraw @s {"text":"  • On ramps/stairs: place a node at top AND bottom","color":"gray"}
tellraw @s {"text":"  • Routes 1-99 are supported","color":"gray"}
tellraw @s {"text":"  • Edit on_reach_end.mcfunction for damage logic","color":"gray"}
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
