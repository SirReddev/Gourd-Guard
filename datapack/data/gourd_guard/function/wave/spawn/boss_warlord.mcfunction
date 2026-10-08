# Wave Mob Spawn: Warlord Malakor
# Macro: $(map) is Map ID, $(path) is Route ID
scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.state dummy
$execute at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0},limit=1] run summon zombie ~ ~ ~ {Silent:1b,NoAI:1b,Health:2500.0f,attributes:[{id:"minecraft:max_health",base:2500.0},{id:"minecraft:scale",base:2.2}],DeathLootTable:"gourd_guard:candy/large",CustomName:[{text:"[Lvl 10] ",color:"gold",bold:true},{text:"Warlord Malakor",color:"gold",bold:true}],CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandItems:[{id:"minecraft:netherite_axe",count:1},{}],ArmorItems:[{},{},{},{id:"minecraft:golden_helmet",count:1}],Glowing:1b,Tags:["m$(map)_p$(path)","gg_mob","gg_boss","gg_heavy"]}
$execute unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0}] run tellraw @a [{"text":"[Wave System] ","color":"dark_red"},{"text":"Spawn Error: No Node 0 found for Map $(map) Route $(path)! Run /function gourd_guard:path/route/begin {map:$(map),path:$(path)}","color":"red"}]
$execute at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0},limit=1] as @e[tag=m$(map)_p$(path),tag=gg_boss,limit=1,sort=nearest] run team join team_gold @s
