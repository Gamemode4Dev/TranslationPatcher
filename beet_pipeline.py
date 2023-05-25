from beet import Context, Function

def beet_default(ctx: Context):

    # generate item modifier traversal tree
    tree_files = {"player_inv/slots/offhand": "weapon.offhand"}
    tree_files.update({f"player_inv/slots/armor/{val}": f"armor.{val}" for val in ("chest", "feet", "legs", "head")})
    tree_files.update({f"player_inv/slots/inventory/{val}": f"container.{val}" for val in range(0,26)})

    for k, v in tree_files.items():
        ctx.data.functions[f"gm4_translation_patcher:{k}"] = Function((
            "function gm4_translation_patcher:player_inv/store_text\n"
            "function gm4_translation_patcher:update_text\n"
            f"item modify entity @s {v} gm4_translation_patcher:main\n"
            "function gm4_translation_patcher:player_inv/slots/next"
        ))

    # text replacement function
    ctx.data.functions["gm4_translation_patcher:update_text"] = Function("data modify storage player_inv:temp Name set value '{\"text\":\"my new name\"}'")
