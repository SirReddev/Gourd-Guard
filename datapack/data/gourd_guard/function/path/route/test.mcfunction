# Pathfinding - Spawn 4 fast test runners on a specific map & path to test all splits and subpaths!
# Usage: /function gourd_guard:path/route/test {map:1,path:2}

$function gourd_guard:wave/spawn/runner {map:$(map),path:$(path)}
$function gourd_guard:wave/spawn/runner {map:$(map),path:$(path)}
$function gourd_guard:wave/spawn/runner {map:$(map),path:$(path)}
$function gourd_guard:wave/spawn/runner {map:$(map),path:$(path)}

$tellraw @a [{"text":"[Path Test] ","color":"dark_green"},{"text":"Spawned 4 test runners on Map $(map) Path $(path) to test all splits & subpaths!","color":"green"}]
