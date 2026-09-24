# Clears full dialogue page and begins rendering the next page from Buffer
scoreboard players set #chatbox.sneak.handled loy.value 1
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.35 0.95
function chatbox:bossbar/clear/without_format
