# Enable Adventure Mode Flight (Called when waves start with Peeves)

scoreboard players set .global fly_active 1
scoreboard players set @a[gamemode=!spectator,gamemode=!creative] fly_status 3
scoreboard players add @a fly_start 0
scoreboard players enable @a fly_status

tellraw @a [{"text":"[Peeves] ","color":"aqua"},{"text":"Flight is now active! Hold ","color":"green"},{"text":"[Shift]","color":"yellow","bold":true},{"text":" to soar up, release to glide!","color":"green"}]
