data modify storage player_inv:gm4_translation_value Items set value []
# Replace the `{tag:{custom:1b}}` with the appropriate filter for your use case
# If this filter is all that is needed for finding the appropriate items, `.Slot` can be added to the source path to copy only the slot numbers, and remove all other uses of .Slot and the extra conditions in the various functions
data modify storage player_inv:gm4_translation_value Items append from entity @s Inventory[{tag: {custom: 1b}}]

execute store result score #slot_count gm4_translation_value if data storage player_inv:gm4_translation_value Items[]
execute if score #slot_count gm4_translation_value matches 1.. run function gm4_translation_patcher:player_inv/slots/all
