# Enable Adventure Mode Flight (Called when waves start with Peeves)

scoreboard players set .global fly_active 1
scoreboard players set @a[gamemode=!spectator,gamemode=!creative] fly_status 3
scoreboard players set @a fly_hold 0
scoreboard players enable @a fly_status

tellraw @a [{"text":"[Peeves] ","color":"aqua"},{"text":"Flight active! Hold ","color":"green"},{"text":"[Shift]","color":"yellow","bold":true},{"text":" to soar up, release to glide!","color":"green"}]
