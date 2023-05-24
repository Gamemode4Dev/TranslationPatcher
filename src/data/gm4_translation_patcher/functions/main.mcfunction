# schedule looped by load and self

schedule function gm4_translation_patcher:main 5s

scoreboard players enable @a gm4_translation_patcher
execute as @a[scores={gm4_translation_patcher=1..}] run function gm4_translation_patcher:run
