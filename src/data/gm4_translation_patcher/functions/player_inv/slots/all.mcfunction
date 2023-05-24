function player_inv:slots/check_slot
execute if score #slot temp matches -106 run function player_inv:slots/offhand
execute if score #slot temp matches 100..103 run function player_inv:slots/armor/split
execute if score #slot temp matches 27..35 run function player_inv:slots/inventory/bottom/split
execute if score #slot temp matches 18..26 run function player_inv:slots/inventory/middle/split
execute if score #slot temp matches 9..17 run function player_inv:slots/inventory/top/split
execute if score #slot temp matches 0..8 run function player_inv:slots/hotbar/split