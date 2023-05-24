from beet import Context, Function

def beet_default(ctx: Context):

    # generate item modifier traversal tree
    tree_files = {"player_inv/slots/offhand": "weapon.offhand"}
    tree_files.update({f"player_inv/slots/armor/{val}": f"armor.{val}" for val in ("chest", "feet", "legs", "head")})
    tree_files.update({f"player_inv/slots/inventory/{val}": f"inventory.{val}" for val in range(0,26)})

    for k, v in tree_files.items():
        ctx.data.functions[f"gm4_translation_patcher:{k}"] = Function((
            f"item modify entity @s {v}\n"
            "function gm4_translation_patcher:player_inv/slots/next"
        ))