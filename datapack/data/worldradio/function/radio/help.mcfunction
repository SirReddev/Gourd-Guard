# WorldRadio - Chat Control Panel
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
tellraw @s [{"text":"  📻 ","color":"white"},{"text":"WorldRadio Control Panel","color":"green","bold":true}]
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
tellraw @s {"text":"  🌐 Global Radio","color":"gold","bold":true}
tellraw @s [{"text":"  "},{"text":"[▶ Play] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:radio/play"}},{"text":"[⏹ Stop] ","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:radio/stop"}},{"text":"[⏸ Pause]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:radio/pause"}}]
tellraw @s [{"text":"  "},{"text":"[⏮ Prev] ","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:radio/previous"}},{"text":"[⏭ Next] ","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:radio/next"}},{"text":"[🔀 Shuffle]","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:radio/shuffle"}}]
tellraw @s [{"text":"  "},{"text":"[🔄 Auto-Play] ","color":"dark_purple","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:radio/toggle_shuffle"}},{"text":"[ℹ Status]","color":"gray","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:radio/status"}}]
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}
tellraw @s {"text":"  🎶 Jukebox Zones","color":"gold","bold":true}
tellraw @s [{"text":"  "},{"text":"[▶ Play] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:jukebox/control/play"}},{"text":"[⏹ Stop] ","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:jukebox/control/stop"}},{"text":"[🔀 Shuffle]","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:jukebox/toggle_shuffle"}}]
tellraw @s [{"text":"  "},{"text":"[⏮ Prev] ","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:jukebox/control/prev"}},{"text":"[⏭ Next] ","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:jukebox/control/next"}},{"text":"[📢 Notifs]","color":"white","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:radio/toggle_announce"}}]
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}
tellraw @s {"text":"  📻 Devices","color":"gold","bold":true}
tellraw @s [{"text":"  "},{"text":"[+ Boombox] ","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:summon_boombox"}},{"text":"[- Boombox]","color":"dark_red","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:remove_boombox"}}]
tellraw @s [{"text":"  "},{"text":"[+ Jukebox] ","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:summon_jukebox"}},{"text":"[- Jukebox]","color":"dark_red","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:remove_jukebox"}}]
tellraw @s {"text":"────────────────────────────","color":"dark_gray"}
tellraw @s {"text":"  [🔄 Reset Everything]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function worldradio:reset"}}
tellraw @s {"text":"════════════════════════════","color":"dark_gray"}
