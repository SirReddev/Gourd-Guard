# Pathfinding System - Help / Command Reference
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
tellraw @s [{"text":"  🗺 ","color":"white"},{"text":"Pathfinding System","color":"green","bold":true}]
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
tellraw @s {"text":"  Route Setup:","color":"gold","bold":true}
tellraw @s [{"text":"  "},{"text":"[begin {route:N}]","color":"aqua","bold":true,"click_event":{"action":"suggest_command","command":"/function gourd_guard:path/route/begin {route:1}"}},{"text":"  start editing route N","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[add_node]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:path/route/add_node"}},{"text":"  place node at your position","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[show {route:N}]","color":"aqua","bold":true,"click_event":{"action":"suggest_command","command":"/function gourd_guard:path/route/show {route:1}"}},{"text":"  visualize a route","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[clear {route:N}]","color":"red","bold":true,"click_event":{"action":"suggest_command","command":"/function gourd_guard:path/route/clear {route:1}"}},{"text":"  delete route nodes","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[clear_all]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:path/route/clear_all"}},{"text":"  wipe all nodes","color":"gray"}]
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}
tellraw @s {"text":"  Mob Assignment & Controls:","color":"gold","bold":true}
tellraw @s [{"text":"  "},{"text":"[assign mob]","color":"aqua","bold":true,"click_event":{"action":"suggest_command","command":"/execute as @e[type=zombie,distance=..5,limit=1] run function gourd_guard:path/route/assign {route:1}"}},{"text":"  send nearest mob on route","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[diagnostics]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:path/debug"}},{"text":"  view nodes and tracked mobs","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[Set Base HP: 500]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:hud/objective/set_max_hp {max_hp:500}"}},{"text":"  "},{"text":"[Heal Full]","color":"light_purple","bold":true,"click_event":{"action":"run_command","command":"/function gourd_guard:hud/objective/set_hp {hp:500}"}}]
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}
tellraw @s {"text":"  Terrain Tips:","color":"gold","bold":true}
tellraw @s {"text":"  • Going UP steps/slopes: place a node on top of the step","color":"gray"}
tellraw @s {"text":"  • Going DOWN stairs/ledges: place a node at the bottom","color":"gray"}
tellraw @s {"text":"  • Mobs will climb blocks and step down naturally","color":"gray"}
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
