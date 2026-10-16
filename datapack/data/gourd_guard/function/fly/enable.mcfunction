# Enable Adventure Mode Flight (Called when waves start with Peeves)

scoreboard players set .global fly_active 1
scoreboard players set @a fly_status 3
scoreboard players set @a fly_hold 0
scoreboard players enable @a fly_status

# Equip locked Gourd Glider (Elytra)
item replace entity @a[gamemode=!spectator] armor.chest with minecraft:elytra[minecraft:item_name={text:"Gourd Glider",color:"gold",bold:true},minecraft:custom_data={gg_glider:1b},minecraft:unbreakable={}]

# Provide Gourd Rockets for high-speed 3D flight
give @a[gamemode=!spectator] minecraft:firework_rocket[minecraft:item_name={text:"Gourd Rocket",color:"gold",bold:true},minecraft:custom_data={gg_rocket:1b}] 64

tellraw @a [{"text":"[Peeves] ","color":"aqua"},{"text":"Gourd Glider equipped! Tap ","color":"green"},{"text":"[Space]","color":"yellow","bold":true},{"text":" in mid-air to glide, and use ","color":"green"},{"text":"Gourd Rockets","color":"gold","bold":true},{"text":" to boost!","color":"green"}]
