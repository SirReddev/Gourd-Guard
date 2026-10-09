# WorldRadio - Handle Song Natural Finish
# If shuffle is enabled, pick random song:
execute if score #shuffle worldradio.data matches 1 store result score #rand worldradio.data run random value 0..2147483646
execute if score #shuffle worldradio.data matches 1 run scoreboard players operation #rand worldradio.data %= #total_songs worldradio.data
execute if score #shuffle worldradio.data matches 1 run scoreboard players add #rand worldradio.data 1
execute if score #shuffle worldradio.data matches 1 if score #rand worldradio.data = #song worldradio.data run scoreboard players add #rand worldradio.data 1
execute if score #shuffle worldradio.data matches 1 if score #rand worldradio.data > #total_songs worldradio.data run scoreboard players set #rand worldradio.data 1
execute if score #shuffle worldradio.data matches 1 run scoreboard players operation #song worldradio.data = #rand worldradio.data

# If shuffle is disabled, sequential advance:
execute if score #shuffle worldradio.data matches 0 run scoreboard players add #song worldradio.data 1
execute if score #shuffle worldradio.data matches 0 if score #song worldradio.data > #total_songs worldradio.data run scoreboard players set #song worldradio.data 1

function worldradio:radio/internal/switch_and_play
