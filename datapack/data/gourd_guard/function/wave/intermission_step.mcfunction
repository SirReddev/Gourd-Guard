# Intermission countdown step (runs once per second)
scoreboard players set .wave timer_ticks 0
execute if score .wave timer_sec matches 1.. run scoreboard players remove .wave timer_sec 1
execute unless score .wave timer_sec matches 1.. if score .wave timer_min matches 1.. run scoreboard players remove .wave timer_min 1
execute unless score .wave timer_sec matches 1.. if score .wave timer_min matches 1.. run scoreboard players set .wave timer_sec 59

# Trigger 10-second countdown audio and show seconds (10..1) in title
execute if score .wave timer_min matches 0 if score .wave timer_sec matches 10 run playsound gourd_guard:hud.timer10s record @a ~ ~ ~ 1 1 1
execute if score .wave timer_min matches 0 if score .wave timer_sec matches 1..10 run title @a times 2 16 2
execute if score .wave timer_min matches 0 if score .wave timer_sec matches 4..10 run title @a title {"score":{"name":".wave","objective":"timer_sec"},"color":"gold","bold":true}
execute if score .wave timer_min matches 0 if score .wave timer_sec matches 1..3 run title @a title {"score":{"name":".wave","objective":"timer_sec"},"color":"red","bold":true}

# When timer expires (0:00), end intermission and start next wave
execute if score .wave timer_min matches ..0 if score .wave timer_sec matches ..0 run function gourd_guard:wave/intermission_end
