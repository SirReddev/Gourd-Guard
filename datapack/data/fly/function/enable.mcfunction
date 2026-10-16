# Enable Adventure Mode Flight (Called when waves start with Peeves)

scoreboard players set .global fly_active 1
scoreboard players set @a[gamemode=!spectator,gamemode=!creative] fly_status 3
scoreboard players set @a fly_hold 0
scoreboard players enable @a fly_status

# Equip locked Gourd Glider (Elytra with Curse of Binding & Unbreakable)
item replace entity @a[gamemode=!spectator,gamemode=!creative] armor.chest with minecraft:elytra[unbreakable={},enchantments={levels:{"minecraft:binding_curse":1}},custom_name='{"text":"Gourd Glider","color":"gold","bold":true}']

# Provide Gourd Rockets for high-speed 3D flight
give @a[gamemode=!spectator,gamemode=!creative] minecraft:firework_rocket[custom_data={gg_rocket:1b},custom_name='{"text":"Gourd Rocket","color":"gold","bold":true}',fireworks={flight_duration:1}] 64

tellraw @a [{"text":"[Peeves] ","color":"aqua"},{"text":"Gourd Glider equipped! Tap ","color":"green"},{"text":"[Space]","color":"yellow","bold":true},{"text":" in mid-air to glide, and use ","color":"green"},{"text":"Gourd Rockets","color":"gold","bold":true},{"text":" to boost!","color":"green"}]
