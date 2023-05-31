# run from each slot modifier file

# recurse through list
execute store result score #lore_length gm4_translation_value run data get storage player_inv:temp Lore
execute if score #lore_length gm4_translation_value matches 1.. run function gm4_translation_patcher:lore/next_line

# store new lore back
data modify storage player_inv:temp Lore set from storage player_inv:temp NewLore
data remove storage player_inv:temp NewLore
