# gourd_guard:npc/archerstand/tick_entity
# State machine for single Archer root entity

# If not initialized, start in idle state
execute unless entity @s[tag=gg.archer.state.idle] unless entity @s[tag=gg.archer.state.shoot] run function gourd_guard:npc/archerstand/init

# When Idle finishes (loop mode stop) -> switch to Shoot
execute if entity @s[tag=gg.archer.state.idle] unless entity @s[tag=aj.gourdguard_npc_archerstand.animation.idle.playing] run function gourd_guard:npc/archerstand/switch_to_shoot

# When Shoot finishes (loop mode stop) -> switch to Idle
execute if entity @s[tag=gg.archer.state.shoot] unless entity @s[tag=aj.gourdguard_npc_archerstand.animation.shoot.playing] run function gourd_guard:npc/archerstand/switch_to_idle