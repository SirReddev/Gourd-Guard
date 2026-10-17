# gourd_guard:platform/give_wand
# Gives the player the interactive Platform Marker Wand
scoreboard objectives add gg_wand_use minecraft.used:minecraft.warped_fungus_on_a_stick

give @s minecraft:warped_fungus_on_a_stick[minecraft:item_name={text:"Platform Marker Wand",color:"gold",bold:true},minecraft:lore=[{text:"Right-Click: Place & Snap Marker",color:"green"},{text:"Shift + Right-Click: Remove Nearby Marker",color:"red"},{text:"Auto-snaps to Black Glazed Terracotta 2x2",color:"gray"}],minecraft:custom_data={gg_platform_wand:1b},minecraft:unbreakable={}] 1

tellraw @s [{"text":"[Platform] ","color":"green"},{"text":"Given ","color":"yellow"},{"text":"[Platform Marker Wand]","color":"gold","bold":true},{"text":"! Right-click any platform to place, Shift+Right-click to remove.","color":"yellow"}]
