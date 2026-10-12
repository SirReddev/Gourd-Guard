# Cutscene System - Begin editing cutscene waypoints for a specific map
# Usage: /function gourd_guard:cutscene/node/begin {map:1}

function gourd_guard:cutscene/init

$scoreboard players set CurrentMap cs.edit $(map)

# Count existing NPC waypoints for this map to set the next node index
scoreboard players set NextNode cs.edit 0
execute as @e[tag=cs_npc_node] if score @s cs.map = CurrentMap cs.edit run scoreboard players add NextNode cs.edit 1

$tellraw @s [{"text":"[Cutscene] ","color":"aqua"},{"text":"Editing Cutscene for Map $(map)","color":"green","bold":true},{"text":" - Next NPC node: ","color":"gray"},{"score":{"name":"NextNode","objective":"cs.edit"},"color":"gold","bold":true}]
