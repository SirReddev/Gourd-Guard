# Wave Mob Spawn: THE GOURD COLOSSUS
# Macro: $(map) is Map ID, $(path) is Route ID
scoreboard objectives add path.map dummy
scoreboard objectives add path.route dummy
scoreboard objectives add path.node dummy
scoreboard objectives add path.cmp dummy
scoreboard objectives add path.state dummy
$execute at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0},limit=1] run summon warden ~ ~ ~ {Silent:1b,NoAI:1b,Health:75000.0f,attributes:[{id:"minecraft:max_health",base:75000.0},{id:"minecraft:scale",base:3.0}],DeathLootTable:"gourd_guard:candy/boss",CustomName:'{"text":"THE GOURD COLOSSUS","bold":true}',CustomNameVisible:1b,HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],Glowing:1b,Tags:["m$(map)_p$(path)","gg_mob","gg_boss","gg_final_boss","gg_heavy","gg_slow"]}
$execute unless entity @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0}] run tellraw @a [{"text":"[Wave System] ","color":"dark_red"},{"text":"Spawn Error: No Node 0 found for Map $(map) Route $(path)! Run /function gourd_guard:path/route/begin {map:$(map),path:$(path)}","color":"red"}]
$execute at @e[tag=path_node,scores={path.map=$(map),path.route=$(path),path.node=0},limit=1] as @e[tag=m$(map)_p$(path),tag=gg_final_boss,limit=1,sort=nearest] run team join team_red @s
