# Wave Mob Spawn: Plated Ravager
# Macro: $(map) is Map ID, $(path) is Route ID
scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.state dummy
$execute in minecraft:overworld at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0},limit=1] run summon ravager ~ ~ ~ {PersistenceRequired:1b,Silent:1b,NoAI:1b,Health:1600.0f,attributes:[{id:"minecraft:max_health",base:1600.0},{id:"minecraft:scale",base:1.8}],DeathLootTable:"gourd_guard:candy/large",CustomName:[{text:"❤ ",color:"red",bold:true},{text:"1600",color:"red",bold:true}] ",color:"gold",bold:true},{text:"Plated Ravager",color:"dark_red",bold:false}],CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],Tags:["m$(map)_p$(path)","gg_mob","gg_heavy","gg_slow"]}
$execute in minecraft:overworld unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0}] at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=1},limit=1] run summon ravager ~ ~ ~ {PersistenceRequired:1b,Silent:1b,NoAI:1b,Health:1600.0f,attributes:[{id:"minecraft:max_health",base:1600.0},{id:"minecraft:scale",base:1.8}],DeathLootTable:"gourd_guard:candy/large",CustomName:[{text:"❤ ",color:"red",bold:true},{text:"1600",color:"red",bold:true}] ",color:"gold",bold:true},{text:"Plated Ravager",color:"dark_red",bold:false}],CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],Tags:["m$(map)_p$(path)","gg_mob","gg_heavy","gg_slow"]}
$execute in minecraft:overworld unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0..1}] run tellraw @a [{"text":"[Gourd Guard] ","color":"dark_red"},{"text":"Spawn Error: No Node 0 found for Map $(map) Route $(path)! Run /function gourd_guard:path/route/begin {map:$(map),path:$(path)}","color":"red"}]
