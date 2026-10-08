# Map 2 Wave Handler (Placeholder)
# Waves for Map 2 will be dispatched here when configured.
tellraw @a[tag=admin] [{"text":"[Wave System] ","color":"dark_green"},{"text":"Map 2 waves have not been configured yet! Run ","color":"yellow"},{"text":"/function gourd_guard:wave/set_map {map:1}","color":"gold"},{"text":" to play Map 1.","color":"yellow"}]
scoreboard players set .wave state 0
