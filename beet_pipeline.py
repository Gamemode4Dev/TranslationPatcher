from beet import Context, Function
import csv

def beet_default(ctx: Context):

    # generate item modifier traversal tree
    tree_files = {"player_inv/slots/offhand": "weapon.offhand"}
    tree_files.update({f"player_inv/slots/armor/{val}": f"armor.{val}" for val in ("chest", "feet", "legs", "head")})
    tree_files.update({f"player_inv/slots/inventory/{val}": f"container.{val}" for val in range(0,26)})

    for k, v in tree_files.items():
        ctx.data.functions[f"gm4_translation_patcher:{k}"] = Function((
            "function gm4_translation_patcher:player_inv/store_text\n"
            "function gm4_translation_patcher:update_name\n"
            "function gm4_translation_patcher:lore/start\n"
            f"item modify entity @s {v} gm4_translation_patcher:main\n"
            "function gm4_translation_patcher:player_inv/slots/next"
        ))

    # text replacement function
    function_lines = []
    with open('name_replacements.csv') as f:
        reader = csv.reader(f, delimiter="|")
        for old, new in reader:
            escaped_old = old.replace('\'', '\\\'')
            escaped_new = new.replace('\'', '\\\'')
            function_lines.append(f"execute if data storage player_inv:temp {{Name:'{escaped_old}'}} run data modify storage player_inv:temp Name set value '{escaped_new}'")
    ctx.data.functions["gm4_translation_patcher:update_name"] = Function(function_lines)

    function_lines = []
    with open('lore_replacements.csv') as f:
        reader = csv.reader(f, delimiter="|")
        for old, new in reader:
            escaped_old = old.replace('\'', '\\\'')
            escaped_new = new.replace('\'', '\\\'')
            function_lines.append(f"execute if data storage player_inv:temp {{LoreLine:'{escaped_old}'}} run data modify storage player_inv:temp LoreLine set value '{escaped_new}'")
    ctx.data.functions["gm4_translation_patcher:update_lore"] = Function(function_lines)
