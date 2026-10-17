# gourd_guard:lobby/stats/apply_display
# Macro args: {plays, wins, fails, rate}

$execute as @e[type=text_display,tag=gg_stats_display] run data modify entity @s text set value {text:"",extra:[{text:"\n    ★ GAME STATISTICS ★    \n",color:"gold",bold:true},{text:"━━━━━━━━━━━━━━━━━━━━━━━━━\n",color:"dark_gray"},{text:" Total Playthroughs:  ",color:"yellow"},{text:"$(plays)\n",color:"white",bold:true},{text:" Total Victories:     ",color:"green"},{text:"$(wins)\n",color:"white",bold:true},{text:" Total Defeats:       ",color:"red"},{text:"$(fails)\n",color:"white",bold:true},{text:"━━━━━━━━━━━━━━━━━━━━━━━━━\n",color:"dark_gray"},{text:" Win Rate:            ",color:"gold"},{text:"$(rate)%\n ",color:"aqua",bold:true}]}
