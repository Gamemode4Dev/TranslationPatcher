function gm4_translation_patcher:player_inv/slots/check_slot
execute if score #slot gm4_translation_value matches -106 run function gm4_translation_patcher:player_inv/slots/offhand
execute if score #slot gm4_translation_value matches 100..103 run function gm4_translation_patcher:player_inv/slots/armor/split
execute if score #slot gm4_translation_value matches 27..35 run function gm4_translation_patcher:player_inv/slots/inventory/bottom/split
execute if score #slot gm4_translation_value matches 18..26 run function gm4_translation_patcher:player_inv/slots/inventory/middle/split
execute if score #slot gm4_translation_value matches 9..17 run function gm4_translation_patcher:player_inv/slots/inventory/top/split
execute if score #slot gm4_translation_value matches 0..8 run function gm4_translation_patcher:player_inv/slots/hotbar/split
function gm4_translation_patcher:player_inv/slots/next
