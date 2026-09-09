# gourd_guard:npc/archerstand/tick_entity
# Export-proof automatic transition between Idle and Shoot animations

# Switch from Idle to Shoot when idle finishes (frame 300+)
execute if entity @s[tag=aj.gourdguard_npc_archerstand.animation.idle.playing] if score @s aj.idle.frame matches 300.. run function aj:gourdguard_npc_archerstand/animations/shoot/play_exclusive

# Switch from Shoot to Idle when shoot finishes (frame 240+)
execute if entity @s[tag=aj.gourdguard_npc_archerstand.animation.shoot.playing] if score @s aj.shoot.frame matches 240.. run function aj:gourdguard_npc_archerstand/animations/idle/play_exclusive

# Failsafe: if neither animation is playing, start idle
execute unless entity @s[tag=aj.gourdguard_npc_archerstand.animation.idle.playing] unless entity @s[tag=aj.gourdguard_npc_archerstand.animation.shoot.playing] run function aj:gourdguard_npc_archerstand/animations/idle/play_exclusive