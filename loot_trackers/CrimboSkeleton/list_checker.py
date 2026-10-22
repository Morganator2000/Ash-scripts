import os
import pandas as pd
import pyperclip as pc

# Before running this script you need to go to 
# https://wiki.kingdomofloathing.com/Visiting_the_Skeleton_of_Crimbo_Past/Daily_Specials
# and manually copy the table into list_dump.xlsx starting at cell A1

# get list of unique items
df = pd.read_excel('loot_trackers/CrimboSkeleton/list_dump.xlsx')
current_items = sorted(df['Item'].dropna().unique().tolist())
current_items.remove("something...")

# get the list of the last time this script was updated
last_list_path = 'loot_trackers/CrimboSkeleton/last_list.txt'
old_items = []
if os.path.exists(last_list_path):
    with open(last_list_path, 'r', encoding='utf-8') as f:
        old_items = [line.strip() for line in f if line.strip()]

current_set = set(current_items)
old_set = set(old_items)

added = sorted(list(current_set - old_set))
removed = sorted(list(old_set - current_set))

new_list_text = '\n'.join(current_items)
pc.copy(new_list_text)
print("New list copied to clipboard.")

# verify that the CrimboSkeletonLoot.ash script also has these items somewhere in them
ash_path = 'loot_trackers/CrimboSkeleton/CrimboSkeletonLoot.ash'
if os.path.exists(ash_path):
    with open(ash_path, 'r', encoding='utf-8') as f:
        ash_content = f.read()
    
    missing_in_ash = [item for item in current_items if item not in ash_content]
    
    if missing_in_ash:
        print(f"The following items were NOT found in your ASH script ({len(missing_in_ash)}):")
        for item in missing_in_ash:
            print(f"  - {item}")
    else:
        print("All items from the list are referenced somewhere in CrimboSkeletonLoot.ash")
else:
    print(f"\n[!] Could not find '{ash_path}' in the current directory.")