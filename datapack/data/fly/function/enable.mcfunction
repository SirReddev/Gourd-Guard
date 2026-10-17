# Enable Adventure Mode Flight (Called when map starts with Peeves or when waves begin)
execute if score .global fly_active matches 1 run return 1

scoreboard players set .global fly_active 1
scoreboard players set @a[tag=!gourd_test] fly_status 3
scoreboard players set @a[tag=!gourd_test] fly_hold 0
scoreboard players enable @a[tag=!gourd_test] fly_status

# Equip locked Gourd Glider (Elytra)
item replace entity @a[gamemode=!spectator,tag=!gourd_test] armor.chest with minecraft:elytra[minecraft:item_name={text:"Gourd Glider",color:"gold",bold:true},minecraft:custom_data={gg_glider:1b},minecraft:unbreakable={}]

tellraw @a [{"text":"[Peeves] ","color":"aqua"},{"text":"Gourd Glider equipped! Tap ","color":"green"},{"text":"[Space]","color":"yellow","bold":true},{"text":" to glide, or hold ","color":"green"},{"text":"[Shift]","color":"yellow","bold":true},{"text":" to launch and ascend!","color":"green"}]
