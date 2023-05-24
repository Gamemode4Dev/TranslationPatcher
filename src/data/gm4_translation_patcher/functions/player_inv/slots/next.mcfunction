function gm4_translation_patcher:player_inv/slots/skip
execute if score #slot_count gm4_translation_value matches 1.. run function gm4_translation_patcher:player_inv/slots/all
execute if score #slot_count gm4_translation_value matches ..0 run scoreboard players reset #slot gm4_translation_value
