function player_inv:slots/skip
execute if score #slot_count temp matches 1.. run function player_inv:slots/check_slot
execute if score #slot_count temp matches ..0 run scoreboard players reset #slot temp