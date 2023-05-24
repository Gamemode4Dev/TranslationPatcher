# If all the conditions can be done as part of the filtering then the recursion can be removed

execute if data storage player_inv:gm4_translation_value Items[-1].tag.Lore[0] run function gm4_translation_patcher:player_inv/slots/skip_and_check_slot
execute if score #slot_count gm4_translation_value matches 1.. store result score #slot gm4_translation_value run data get storage player_inv:gm4_translation_value Items[-1].Slot
