execute if data storage generic:main {TextInput1:"'"} run data modify storage generic:main TextInput1 set value "’"
execute if data storage generic:main {TextInput1:"\""} run data modify storage generic:main TextInput1 set value "”"
function generic:text/combine/json_with_string_later/macro with storage generic:main
