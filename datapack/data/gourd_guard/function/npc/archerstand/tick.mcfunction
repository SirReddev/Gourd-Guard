# gourd_guard:npc/archerstand/tick
# Failsafe: if neither animation is active, start idle
execute as @e[type=item_display,tag=aj.gourdguard_npc_archerstand.root] unless entity @s[tag=aj.gourdguard_npc_archerstand.animation.idle.playing] unless entity @s[tag=aj.gourdguard_npc_archerstand.animation.shoot.playing] run function aj:gourdguard_npc_archerstand/animations/idle/play_exclusive