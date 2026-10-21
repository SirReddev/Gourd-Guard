# Wave Mob Spawn: Magma Core
# Macro: $(map) is Map ID, $(path) is Route ID
scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.state dummy
$execute in minecraft:overworld at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0},limit=1] run summon magma_cube ~ ~ ~ {PersistenceRequired:1b,Silent:1b,NoAI:1b,Health:280.0f,attributes:[{id:"minecraft:max_health",base:280.0},{id:"minecraft:scale",base:2.0}],DeathLootTable:"gourd_guard:candy/small",CustomName:[{text:"[Lvl 10] ",color:"gold",bold:true},{text:"Magma Core ",color:"red",bold:false},{text:"❤ ",color:"red",bold:true},{text:"280",color:"red",bold:true}],CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],Size:1,Tags:["m$(map)_p$(path)","gg_mob"]}
$execute in minecraft:overworld unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0}] at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=1},limit=1] run summon magma_cube ~ ~ ~ {PersistenceRequired:1b,Silent:1b,NoAI:1b,Health:280.0f,attributes:[{id:"minecraft:max_health",base:280.0},{id:"minecraft:scale",base:2.0}],DeathLootTable:"gourd_guard:candy/small",CustomName:[{text:"[Lvl 10] ",color:"gold",bold:true},{text:"Magma Core ",color:"red",bold:false},{text:"❤ ",color:"red",bold:true},{text:"280",color:"red",bold:true}],CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],Size:1,Tags:["m$(map)_p$(path)","gg_mob"]}
$execute in minecraft:overworld unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0..1}] run tellraw @a [{"text":"[Gourd Guard] ","color":"dark_red"},{"text":"Spawn Error: No Node 0 found for Map $(map) Route $(path)! Run /function gourd_guard:path/route/begin {map:$(map),path:$(path)}","color":"red"}]
