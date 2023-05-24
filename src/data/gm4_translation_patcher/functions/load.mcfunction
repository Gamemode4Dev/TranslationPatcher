# run by #minecraft:load

scoreboard objectives add gm4_translation_patcher trigger
scoreboard objectives add gm4_translation_value dummy
#declare storage player_inv:temp
schedule clear gm4_translation_patcher:main
schedule function gm4_translation_patcher:main 1t
