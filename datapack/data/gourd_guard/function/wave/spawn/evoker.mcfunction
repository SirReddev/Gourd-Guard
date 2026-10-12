# Wave Mob Spawn: Sorcerer of Hollows
# Macro: $(map) is Map ID, $(path) is Route ID
scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.state dummy
$execute at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0},limit=1] run summon evoker ~ ~ ~ {PersistenceRequired:1b,Silent:1b,NoAI:1b,Health:700.0f,attributes:[{id:"minecraft:max_health",base:700.0},{id:"minecraft:scale",base:1.5}],DeathLootTable:"gourd_guard:candy/medium",CustomName:[{text:"[Lvl 25] ",color:"gold",bold:true},{text:"Sorcerer of Hollows",color:"dark_aqua",bold:false}],CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],Tags:["m$(map)_p$(path)","gg_mob"]}
$execute unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0}] at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=1},limit=1] run summon evoker ~ ~ ~ {PersistenceRequired:1b,Silent:1b,NoAI:1b,Health:700.0f,attributes:[{id:"minecraft:max_health",base:700.0},{id:"minecraft:scale",base:1.5}],DeathLootTable:"gourd_guard:candy/medium",CustomName:[{text:"[Lvl 25] ",color:"gold",bold:true},{text:"Sorcerer of Hollows",color:"dark_aqua",bold:false}],CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],Tags:["m$(map)_p$(path)","gg_mob"]}
$execute unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0..1}] run tellraw @a [{"text":"[Wave System] ","color":"dark_red"},{"text":"Spawn Error: No Node 0 found for Map $(map) Route $(path)! Run /function gourd_guard:path/route/begin {map:$(map),path:$(path)}","color":"red"}]
