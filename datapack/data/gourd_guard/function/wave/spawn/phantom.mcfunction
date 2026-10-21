# Wave Mob Spawn: Wraith Phantom
# Macro: $(map) is Map ID, $(path) is Route ID
scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.state dummy
$execute in minecraft:overworld at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0},limit=1] run summon phantom ~ ~ ~ {PersistenceRequired:1b,Silent:1b,NoAI:1b,Health:85.0f,attributes:[{id:"minecraft:max_health",base:85.0},{id:"minecraft:scale",base:1.2}],DeathLootTable:"gourd_guard:candy/single",CustomName:'{"text":"❤ 85","color":"red","bold":true}',CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],Tags:["m$(map)_p$(path)","gg_mob","path_flyer"]}
$execute in minecraft:overworld unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0}] at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=1},limit=1] run summon phantom ~ ~ ~ {PersistenceRequired:1b,Silent:1b,NoAI:1b,Health:85.0f,attributes:[{id:"minecraft:max_health",base:85.0},{id:"minecraft:scale",base:1.2}],DeathLootTable:"gourd_guard:candy/single",CustomName:'{"text":"❤ 85","color":"red","bold":true}',CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],Tags:["m$(map)_p$(path)","gg_mob","path_flyer"]}
$execute in minecraft:overworld unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0..1}] run tellraw @a [{"text":"[Gourd Guard] ","color":"dark_red"},{"text":"Spawn Error: No Node 0 found for Map $(map) Route $(path)! Run /function gourd_guard:path/route/begin {map:$(map),path:$(path)}","color":"red"}]
