# Spawn Ravager Convoy with Pillager rider at route start node
# Macro arguments: $(map), $(path), $(lvl), $(hp)

$execute at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.branch=0,path.node=0},limit=1] run summon ravager ~ ~ ~ {PersistenceRequired:1b,NoAI:1b,Health:$(hp)f,attributes:[{id:"minecraft:max_health",base:$(hp)}],DeathLootTable:"minecraft:empty",CustomName:[{text:"[Lvl $(lvl)] ",color:"gold",bold:true},{text:"Pillager Convoy",color:"dark_red",bold:false}],CustomNameVisible:1b,Tags:["gg_convoy","gg_new_convoy"],Passengers:[{id:"minecraft:pillager",NoAI:1b,Silent:1b,Tags:["gg_convoy_rider"],HandItems:[{id:"minecraft:crossbow",count:1},{}]}]}

$execute unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.branch=0,path.node=0}] at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.branch=0,path.node=1},limit=1] run summon ravager ~ ~ ~ {PersistenceRequired:1b,NoAI:1b,Health:$(hp)f,attributes:[{id:"minecraft:max_health",base:$(hp)}],DeathLootTable:"minecraft:empty",CustomName:[{text:"[Lvl $(lvl)] ",color:"gold",bold:true},{text:"Pillager Convoy",color:"dark_red",bold:false}],CustomNameVisible:1b,Tags:["gg_convoy","gg_new_convoy"],Passengers:[{id:"minecraft:pillager",NoAI:1b,Silent:1b,Tags:["gg_convoy_rider"],HandItems:[{id:"minecraft:crossbow",count:1},{}]}]}

# Fallback if no branch 0 exists (route starts at branch 1 node 1)
$execute unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.branch=0,path.node=0..1}] at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=1},limit=1] run summon ravager ~ ~ ~ {PersistenceRequired:1b,NoAI:1b,Health:$(hp)f,attributes:[{id:"minecraft:max_health",base:$(hp)}],DeathLootTable:"minecraft:empty",CustomName:[{text:"[Lvl $(lvl)] ",color:"gold",bold:true},{text:"Pillager Convoy",color:"dark_red",bold:false}],CustomNameVisible:1b,Tags:["gg_convoy","gg_new_convoy"],Passengers:[{id:"minecraft:pillager",NoAI:1b,Silent:1b,Tags:["gg_convoy_rider"],HandItems:[{id:"minecraft:crossbow",count:1},{}]}]}

# Initialize the newly spawned convoy
$execute as @e[tag=gg_new_convoy] run function gourd_guard:tower/convoy/init_convoy {map:$(map),path:$(path)}
