# Adventure Mode Flying Engine - Initialization
# Based on TomatoCake's Adventure Flight System

scoreboard objectives add fly_start minecraft.custom:minecraft.sneak_time {"text":"FlyTime","color":"yellow"}
scoreboard objectives add fly_status trigger {"text":"Fly-Status","color":"yellow"}
scoreboard objectives remove fly

scoreboard players add @a fly_status 0
scoreboard players add @a fly_start 0
scoreboard players enable @a fly_status
