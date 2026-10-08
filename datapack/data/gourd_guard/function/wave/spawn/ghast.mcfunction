# Wave Mob Spawn: Dread Ghast
# Macro: $(map) is Map ID, $(path) is Route ID
scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.state dummy
$execute at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0},limit=1] run summon ghast ~ ~ ~ {Silent:1b,NoAI:1b,Health:550.0f,attributes:[{id:"minecraft:max_health",base:550.0},{id:"minecraft:scale",base:0.4}],DeathLootTable:"gourd_guard:candy/medium",CustomName:[{text:"[Lvl 23] ",color:"gold",bold:true},{text:"Dread Ghast",color:"white",bold:false}],CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],Tags:["m$(map)_p$(path)","gg_mob","path_flyer"]}
$execute unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0}] run tellraw @a [{"text":"[Wave System] ","color":"dark_red"},{"text":"Spawn Error: No Node 0 found for Map $(map) Route $(path)! Run /function gourd_guard:path/route/begin {map:$(map),path:$(path)}","color":"red"}]
