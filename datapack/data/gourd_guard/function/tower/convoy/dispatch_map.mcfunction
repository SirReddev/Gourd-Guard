# Dispatch one convoy for every main path on the active map
# Macro arguments: $(map), $(lvl), $(hp)

$execute if entity @e[tag=path_node,scores={path.map=$(map),path.route=1},limit=1] run function gourd_guard:tower/convoy/spawn_route {map:$(map),path:1,lvl:$(lvl),hp:$(hp)}
$execute if entity @e[tag=path_node,scores={path.map=$(map),path.route=2},limit=1] run function gourd_guard:tower/convoy/spawn_route {map:$(map),path:2,lvl:$(lvl),hp:$(hp)}
$execute if entity @e[tag=path_node,scores={path.map=$(map),path.route=3},limit=1] run function gourd_guard:tower/convoy/spawn_route {map:$(map),path:3,lvl:$(lvl),hp:$(hp)}
$execute if entity @e[tag=path_node,scores={path.map=$(map),path.route=4},limit=1] run function gourd_guard:tower/convoy/spawn_route {map:$(map),path:4,lvl:$(lvl),hp:$(hp)}
$execute if entity @e[tag=path_node,scores={path.map=$(map),path.route=5},limit=1] run function gourd_guard:tower/convoy/spawn_route {map:$(map),path:5,lvl:$(lvl),hp:$(hp)}
$execute if entity @e[tag=path_node,scores={path.map=$(map),path.route=6},limit=1] run function gourd_guard:tower/convoy/spawn_route {map:$(map),path:6,lvl:$(lvl),hp:$(hp)}
$execute if entity @e[tag=path_node,scores={path.map=$(map),path.route=7},limit=1] run function gourd_guard:tower/convoy/spawn_route {map:$(map),path:7,lvl:$(lvl),hp:$(hp)}
$execute if entity @e[tag=path_node,scores={path.map=$(map),path.route=8},limit=1] run function gourd_guard:tower/convoy/spawn_route {map:$(map),path:8,lvl:$(lvl),hp:$(hp)}
$execute if entity @e[tag=path_node,scores={path.map=$(map),path.route=9},limit=1] run function gourd_guard:tower/convoy/spawn_route {map:$(map),path:9,lvl:$(lvl),hp:$(hp)}
$execute if entity @e[tag=path_node,scores={path.map=$(map),path.route=10},limit=1] run function gourd_guard:tower/convoy/spawn_route {map:$(map),path:10,lvl:$(lvl),hp:$(hp)}
