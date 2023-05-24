scoreboard players remove #slot_count gm4_translation_value 1
execute if score #slot_count gm4_translation_value matches 1.. run data remove storage player_inv:temp Items[-1]
