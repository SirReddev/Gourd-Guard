# gourd_guard:npc/deco/summon_all
# Summons all 5 decorative NPCs spaced horizontally side-by-side relative to player facing

execute positioned ^-4 ^ ^ run function gourd_guard:npc/deco/witch
execute positioned ^-2 ^ ^ run function gourd_guard:npc/deco/blacksmith
execute positioned ^ ^ ^ run function gourd_guard:npc/deco/peeves
execute positioned ^2 ^ ^ run function gourd_guard:npc/deco/archer
execute positioned ^4 ^ ^ run function gourd_guard:npc/deco/gravedigger
tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Summoned all 5 decorative NPCs!","color":"green","bold":true}]
