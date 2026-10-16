# Gourd Guard Tick Router
function gourd_guard:player/clear_xp
function gourd_guard:player/tick
function gourd_guard:item_glow/tick
function gourd_guard:candy/tick
function gourd_guard:hud/tick
function gourd_guard:wave/tick
function gourd_guard:npc/witchstand/tick
function gourd_guard:npc/archerstand/tick
function gourd_guard:npc/blacksmithstand/tick
function gourd_guard:npc/gravediggerstand/tick
function gourd_guard:npc/interact/tick
function gourd_guard:prop/windmill/tick
function gourd_guard:prop/waterwheel/tick
function gourd_guard:pumpkin/tick
function gourd_guard:cutscene/tick
function gourd_guard:tower/tick

# Adventure Mode Flying Engine (Runs every 3 ticks)
scoreboard players add #fly_timer gg.timer 1
execute if score #fly_timer gg.timer matches 3.. run scoreboard players set #fly_timer gg.timer 0
execute if score #fly_timer gg.timer matches 0 run function fly:tick