# run from ~/start

data modify storage player_inv:temp LoreLine set from storage player_inv:temp Lore[0]
data remove storage player_inv:temp Lore[0]
function gm4_translation_patcher:update_lore
data modify storage player_inv:temp NewLore append from storage player_inv:temp LoreLine
execute store result score #lore_length gm4_translation_value run data get storage player_inv:temp Lore
execute if score #lore_length gm4_translation_value matches 1.. run function gm4_translation_patcher:lore/next_line
