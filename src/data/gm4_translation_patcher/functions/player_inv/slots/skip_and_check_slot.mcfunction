# If all the conditions can be done as part of the filtering then this function can be removed

function player_inv:slots/skip
execute if score #slot_count temp matches 1.. if data storage player_inv:temp Items[-1].tag.Lore[0] run function player_inv:slots/skip_and_check_slot