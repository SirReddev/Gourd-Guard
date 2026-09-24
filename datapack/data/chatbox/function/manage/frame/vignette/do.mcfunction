# Prepends vignette quad and -1 negative space to CurrentFrameCombine
data modify storage generic:main TextInput0 set value '[{"text":"\\ue000","font":"custom:chatbox/vignette","color":"#FBFBFA"},{"text":"\\uf000","font":"custom:space"}]'
data modify storage generic:main TextInput1 set from storage chatbox:main CurrentFrameCombine
function generic:text/combine/json_with_format/do
data modify storage chatbox:main CurrentFrameCombine set from storage generic:main TextOutput