# runs item upgrade/fixing process, callable by all players via trigger command
# @s = player who has set trigger

scoreboard players reset @s gm4_translation_patcher
say run the trigger!
function gm4_translation_patcher:player_inv/process_all_slots
