# gourd_guard:npc/archerstand/tick
# Continuous playback of Archerstand animation loop
execute as @e[type=item_display,tag=aj.gourdguard_npc_archerstand.root] unless entity @s[tag=aj.gourdguard_npc_archerstand.animation.idle.playing] run function aj:gourdguard_npc_archerstand/animations/idle/play_exclusive