execute as @a[scores={chatbox.session=1..}] at @s run stopsound @s player custom:chatbox.character.sans.0
execute as @a[scores={chatbox.session=1..}] at @s run playsound custom:chatbox.character.sans.0 player @s ~ ~ ~ 1 1 1
execute unless entity @a[scores={chatbox.session=1..}] as @a at @s run stopsound @s player custom:chatbox.character.sans.0
execute unless entity @a[scores={chatbox.session=1..}] as @a at @s run playsound custom:chatbox.character.sans.0 player @s ~ ~ ~ 1 1 1

scoreboard players operation #chatbox.sound.timer loy.value = #chatbox.sound.interval loy.value
