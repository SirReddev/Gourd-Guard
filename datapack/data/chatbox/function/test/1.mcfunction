# Test 1: Mid-sentence pause / punctuation delay
function chatbox:session/acquire
execute if score @s chatbox.session matches 1 run data modify storage chatbox:main Session set value "s1"
execute if score @s chatbox.session matches 2 run data modify storage chatbox:main Session set value "s2"
execute if score @s chatbox.session matches 3 run data modify storage chatbox:main Session set value "s3"
execute if score @s chatbox.session matches 4 run data modify storage chatbox:main Session set value "s4"

function chatbox:style/0
function chatbox:bossbar/clear/with_all
function chatbox:manage/frame/combine
function chatbox:bossbar/display/on

data modify storage chatbox:main Buffer set value [{Char:"D",Length:6,Format:'{"text":"","color":"#777777"}'},{Char:"a",Length:6},{Char:"r",Length:6},{Char:"k",Length:5},{Char:"n",Length:6},{Char:"e",Length:6},{Char:"s",Length:6},{Char:"s",Length:6},{Char:" ",Length:4},{Char:"i",Length:2,Format:'{"text":"","color":"#BBBBBB"}'},{Char:"s",Length:6},{Char:".",Length:2,Delay:8},{Char:".",Length:2,Delay:8},{Char:".",Length:2,Delay:15},{Char:"h",Length:6,Format:'{"text":"","color":"#FBFBFB"}'},{Char:"o",Length:6},{Char:"m",Length:6},{Char:"e",Length:6},{Char:".",Length:2}]
scoreboard players set #chatbox.text.timer loy.value 0
function chatbox:session/save
