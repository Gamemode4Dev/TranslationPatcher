# Simple command-line-ran tool to assist in the generation of conversion table csv's from in-game item data

import csv
import nbtlib

# retrieve data from files
with open('old_chest_data.txt') as f:
    data = f.readline()
    sidx = data.find('{')
    old_chest_data = nbtlib.parse_nbt(data[sidx:])

with open('new_chest_data.txt') as f:
    data = f.readline()
    sidx = data.find('{')
    new_chest_data = nbtlib.parse_nbt(data[sidx:])

# extract data from nested chests
def extract_sub_chests(items_list):
    ret_list = []
    for chest in items_list:
        ret_list.extend(chest['tag']['BlockEntityTag']['Items'])
    return ret_list

old_items = extract_sub_chests(old_chest_data['Items'])
new_items = extract_sub_chests(new_chest_data['Items'])

# pair old and new to form conversion tuples
name_conversions = []
lore_conversions = []
for old_item, new_item in zip(old_items, new_items):
    name_conversions.append((old_item['tag']['display']['Name'], new_item['tag']['display']['Name']))
    if old_item['tag']['display'].get('Lore'):
        lore_conversions.extend(zip(old_item['tag']['display']['Lore'], new_item['tag']['display']['Lore']))

# output to csv files
with open('name_replacements.csv', 'w') as f:
    writer = csv.writer(f, delimiter="|", lineterminator="\n")
    writer.writerows(name_conversions)
with open('lore_replacements.csv', 'w') as f:
    writer = csv.writer(f, delimiter="|", lineterminator="\n")
    writer.writerows(lore_conversions)
