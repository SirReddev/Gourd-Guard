# WorldRadio - Chat Control Panel
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
tellraw @s [{"text":"  📻 ","color":"white"},{"text":"WorldRadio Control Panel","color":"green","bold":true}]
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
tellraw @s {"text":"  🌐 Global Radio","color":"gold","bold":true}
tellraw @s [{"text":"  "},{"text":"[▶ Play] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:radio/play"}},{"text":"[⏹ Stop] ","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:radio/stop"}},{"text":"[⏸ Pause]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:radio/pause"}}]
tellraw @s [{"text":"  "},{"text":"[⏮ Prev] ","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:radio/previous"}},{"text":"[⏭ Next] ","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:radio/next"}},{"text":"[🔀 Shuffle]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:radio/shuffle"}}]
tellraw @s [{"text":"  "},{"text":"[🔄 Auto-Play] ","color":"dark_purple","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:radio/toggle_shuffle"}},{"text":"[ℹ Status]","color":"gray","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:radio/status"}}]
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}
tellraw @s {"text":"  🎶 Jukebox Zones","color":"gold","bold":true}
tellraw @s [{"text":"  "},{"text":"[▶ Play] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:jukebox/control/play"}},{"text":"[⏹ Stop] ","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:jukebox/control/stop"}},{"text":"[🔀 Shuffle]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:jukebox/toggle_shuffle"}}]
tellraw @s [{"text":"  "},{"text":"[⏮ Prev] ","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:jukebox/control/prev"}},{"text":"[⏭ Next] ","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:jukebox/control/next"}},{"text":"[📢 Notifs]","color":"white","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:radio/toggle_announce"}}]
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}
tellraw @s {"text":"  📻 Devices","color":"gold","bold":true}
tellraw @s [{"text":"  "},{"text":"[+ Boombox] ","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:summon_boombox"}},{"text":"[- Boombox]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:remove_boombox"}}]
tellraw @s [{"text":"  "},{"text":"[+ Jukebox] ","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:summon_jukebox"}},{"text":"[- Jukebox]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:remove_jukebox"}}]
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}
tellraw @s {"text":"  [🔄 Reset Everything]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function worldradio:reset"}}
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
