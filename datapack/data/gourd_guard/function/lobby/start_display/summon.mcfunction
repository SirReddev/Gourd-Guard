# gourd_guard:lobby/start_display/summon
# Summons the interactive Start Game text displays with the Gourd pixel icon and "CLICK TO START" button badge, plus interaction hitbox

# Clean up any existing start display & interaction hitbox at this location
kill @e[type=text_display,tag=gg_start_display,distance=..5]
kill @e[type=interaction,tag=gg_start_display_interaction,distance=..5]

# Text Displays (Stacked vertically at identical X, Z origin with alignment:"center" for pixel-perfect centering):
# 1. Gourd Icon Display (Y+2.35)
summon minecraft:text_display ~ ~2.35 ~ {billboard:"vertical",alignment:"center",background:0,transformation:{scale:[1.4f,1.4f,1.4f],translation:[0.0f,0.0f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]},Tags:["gg_start_display","gg_start_icon"],text:'{"text":"\uE304","color":"white","font":"minecraft:default"}'}

# 2. Click to Start Button Badge Display (Y+1.20)
summon minecraft:text_display ~ ~1.20 ~ {billboard:"vertical",alignment:"center",background:0,transformation:{scale:[1.4f,1.4f,1.4f],translation:[0.0f,0.0f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]},Tags:["gg_start_display","gg_start_btn"],text:'{"text":"\uE302","color":"white","font":"minecraft:default"}'}

# Interaction Hitbox for Click (covers both button and icon from all angles)
summon minecraft:interaction ~ ~0.2 ~ {width:2.5f,height:2.8f,response:1b,Tags:["gg_start_display_interaction"]}

tellraw @s[type=player] [{"text":"[Gourd Guard] ","color":"gold","bold":true},{"text":"Start Game display & interaction summoned!","color":"green","bold":true}]
