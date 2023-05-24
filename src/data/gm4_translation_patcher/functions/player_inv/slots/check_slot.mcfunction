# If all the conditions can be done as part of the filtering then the recursion can be removed

execute if data storage player_inv:temp Items[-1].tag.Lore[0] run function player_inv:slots/skip_and_check_slot
execute if score #slot_count temp matches 1.. store result score #slot temp run data get storage player_inv:temp Items[-1].Slot