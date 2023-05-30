data remove storage player_inv:temp Name
data remove storage player_inv:temp Lore
data modify storage player_inv:temp Name set from storage player_inv:temp Items[-1].tag.display.Name
data modify storage player_inv:temp Lore set from storage player_inv:temp Items[-1].tag.display.Lore
