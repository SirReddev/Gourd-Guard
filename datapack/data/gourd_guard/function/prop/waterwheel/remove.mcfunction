# gourd_guard:prop/waterwheel/remove
# Removes the nearest Waterwheel prop within 16 blocks
execute if entity @s[tag=aj.gourdguard_prop_waterwheel.root] run function aj:gourdguard_prop_waterwheel/remove/this
execute unless entity @s[tag=aj.gourdguard_prop_waterwheel.root] as @e[type=item_display,tag=aj.gourdguard_prop_waterwheel.root,distance=..16,limit=1,sort=nearest] run function aj:gourdguard_prop_waterwheel/remove/this

# Stop sound if no more waterwheels exist
execute unless entity @e[type=item_display,tag=aj.gourdguard_prop_waterwheel.root] run stopsound @a ambient gourd_guard:prop.waterwheel.spin
execute unless entity @e[type=item_display,tag=aj.gourdguard_prop_waterwheel.root] run scoreboard players set #waterwheel_spin gg.timer 0