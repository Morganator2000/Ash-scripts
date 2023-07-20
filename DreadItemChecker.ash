# prints out the quantity of each Dreadsylvanian item you have.

void main(boolean clearScreen) {
    if(clearScreen) {cli_execute("clear");}
    print("Colour scheme: Blue is for locations, fuchsia for types of monsters.");
    print("Red is for an item that is needed at the anvil");
    print("Purple is a consumable. Orange is an item to unlock a hard-mode boss.");
    print("Green is an equipment that can be pulverized and has no other uses in Dreadsylvania.");
    print();

    print("The Woods", "blue");
    print("Bugbears:", "fuchsia");
    print("Warm Fur: " + available_amount($item[Warm Fur]), "red");
    print("Snowstick: " + available_amount($item[Snowstick]), "green");
    print("Stinkwater: " + available_amount($item[Stinkwater]), "purple");
    print("Eerie Fetish: " + available_amount($item[Eerie Fetish]), "green");
    print("Dubious Loincloth: " + available_amount($item[Dubious Loincloth]), "green");
    print("Werewolves:", "fuchsia");
    print("Accidental Mutton: " + available_amount($item[Accidental Mutton]), "purple");
    print("Drafty Drawers: " + available_amount($item[Drafty Drawers]), "green");
    print("Guts Necklace: " + available_amount($item[Guts Necklace]), "green");
    print("Wolfskull Mask: " + available_amount($item[Wolfskull Mask]), "green");
    print("Groping Claw: " + available_amount($item[Groping Claw]), "green");
    print("Bosses", "fuchsia");
    print("Drapes-You-Regally: " + available_amount($item[Drapes-You-Regally]));
    print("Warms-Your-Tush: " + available_amount($item[Warms-Your-Tush]));
    print("Covers-Your-Head: " + available_amount($item[Covers-Your-Head]));
    print("Great Wolf's headband: " + available_amount($item[Great Wolf's headband]));
    print("Great Wolf's right paw: " + available_amount($item[Great Wolf's right paw]));
    print("Great Wolf's left paw: " + available_amount($item[Great Wolf's left paw]));
    print();

    print("The Village", "blue");
    print("Zombies:", "fuchsia");
    print("Hothammer: " + available_amount($item[Hothammer]), "red");
    print("Thriller Ice: " + available_amount($item[Thriller Ice]), "purple");
    print("Muddy Skirt: " + available_amount($item[Muddy Skirt]) + ". Must be turned into a weedy skirt", "orange");
    print("Grandfather Watch: " + available_amount($item[Grandfather Watch]), "green");
    print("Antique Spyglass: " + available_amount($item[Antique Spyglass]), "green");
    print("Ghosts:", "fuchsia");
    print("Vengeful Spirit: " + available_amount($item[Vengeful Spirit]) + ". Also used in a chefstave recipe", "green");
    print("BOOtonniere: " + available_amount($item[BOOtonniere]), "green");
    print("Bag of Unfinished Business: " + available_amount($item[Bag of Unfinished Business]), "green");
    print("Ghost Thread: " + available_amount($item[Ghost Thread]) + ". You need 10 to make a ghost shawl", "orange");
    print("Transparent Pants: " + available_amount($item[Transparent Pants]), "green");
    print("Bosses", "fuchsia");
    print("Zombie mariachi hat: " + available_amount($item[zombie mariachi hat]));
    print("Zombie accordion: " + available_amount($item[zombie accordion]));
    print("Zombie mariachi pants: " + available_amount($item[zombie mariachi pants]));
    print("Mayor Ghost's cloak: " + available_amount($item[Mayor Ghost's cloak]));
    print("Mayor Ghost's khakis: " + available_amount($item[Mayor Ghost's khakis]));
    print("Mayor Ghost's toupee: " + available_amount($item[Mayor Ghost's toupee]));
    print();


    print("The Castle", "blue");
    print("Vampires:", "fuchsia");
    print("Vial of Hot Blood: " + available_amount($item[Vial of Hot Blood]), "green");
    print("Remorseless Knife: " + available_amount($item[remorseless knife]), "green");
    print("Cod Cape: " + available_amount($item[Cod Cape]), "green");
    print("Intimidating Coiffure: " + available_amount($item[Intimidating Coiffure]), "green");
    print("Blood Sausage: " + available_amount($item[Blood Sausage]), "purple");
    print("Skeletons:", "fuchsia");
    print("Frying Brainpan: " + available_amount($item[Frying Brainpan]) + ". This is also a good saucesphere pan.", "green");
    print("Old Ball and Chain: " + available_amount($item[Old Ball and Chain]) + ". Must be turned into a cool iron ingot in the woods", "red");
    print("Tailbone Shield: " + available_amount($item[Tailbone Shield]), "green");
    print("Old Dry Bone: " + available_amount($item[Old Dry Bone]) + ". Grind it in the woods for bone flour.", "orange");
    print("Tonguebone: " + available_amount($item[Tonguebone]), "green");
    print("Bosses", "fuchsia");
    print("Thunkula's drinking cap: " + available_amount($item[Thunkula's drinking cap]));
    print("Drunkula's silky pants: " + available_amount($item[Drunkula's silky pants]));
    print("Drunkula's cape: " + available_amount($item[Drunkula's cape]));
    print("Unkillable Skeleton's skullcap: " + available_amount($item[Unkillable Skeleton's skullcap]));
    print("Unkillable Skeleton's shinguards: " + available_amount($item[Unkillable Skeleton's shinguards]));
    print("Unkillable Skeleton's breastplate: " + available_amount($item[Unkillable Skeleton's breastplate]));
    print();

    print("Items required for Hard-mode bosses", "blue");
    print("Great wolf of the Air", "blue");
    print("Moon-Amber Necklace: " + available_amount($item[Moon-Amber Necklace]) + ". Jewlery-crafted using a polished moon-amber and heavy necklace chain.");
    print("polished moon-amber: " + available_amount($item[polished moon-amber]) + ". Polished in Skid Row (village) as a moxie class.");
    print("moon-amber: " + available_amount($item[moon-amber]) + ". Acquired by climbing the tallest tree (woods) as a muscle class.");
    print("Falls-From-Sky", "blue");
    print("bloody kiwitini: " + available_amount($item[bloody kiwitini]) + ". Made in the laboratory (castle, key) as a moxie class with a blood kiwi and eau de mort.");
    print("blood kiwi: " + available_amount($item[blood kiwi]) + ". Acquired by having a clanmate drop it from the tallest tree (woods) while you catch it at the bottom.");
    print("eau de mort: " + available_amount($item[eau de mort]) + ". Acquired at the Old Dukes' Estate (village, key).");
    print("Mayor Ghost", "blue");
    print("Dreadsylvania Auditor's badge: " + available_amount($item[Dreadsylvania Auditor's badge]) + ". Acquired in the cabin (woods) with a replica key.");
    print("replica key: " + available_amount($item[replica key]) + ". Created in skid row (village) as a moxie class with intricate music box parts and complicated lock impression.");
    print("intricate music box parts: " + available_amount($item[intricate music box parts]) + ". Go into the cabin (woods) as an accordion thief.");
    print("complicated lock impression: " + available_amount($item[complicated lock impression]) + ". Use a wax banana in the cabin (woods).");
    print("wax banana: " + available_amount($item[wax banana]) + ". Acquired in the great hall (castle) as a myst class.");
    print("Zombie Homeowners' Association", "blue");
    print("weedy skirt: " + available_amount($item[weedy skirt]) + ". Go to great hall (castle, key) with a muddy skirt and seed pod.");
    print("muddy skirt: " + available_amount($item[muddy skirt]) + ". Acquired from stench zombie (village).");
    print("Dreadsylvanian seed pod: " + available_amount($item[Dreadsylvanian seed pod]) + ". Root around the tallest tree (woods).");
    print("Unkillable Skeleton", "blue");
    print("Dreadsylvanian shepherd's pie: " + available_amount($item[Dreadsylvanian shepherd's pie]) + ". Made in the duke's estate (village) as a myst class with the next 4 ingredients.");
    print("dreadful roast: " + available_amount($item[dreadful roast]) + ". Castle -> Great Hall -> Dining room.");
    print("bone flour: " + available_amount($item[bone flour]) + ". Grind an old dry bone in the cabin (woods) as a muscle class.");
    print("Old Dry Bone: " + available_amount($item[Old Dry Bone]) + ". Acquired from spooky skeleton (castle).");
    print("stinking agaricus: " + available_amount($item[stinking agaricus]) + ". Found in the dungeons (castle).");
    print("dread tarragon: " + available_amount($item[dread tarragon]) + ". Wooods -> Cabin -> kitchen.");
    print("Count Drunkula", "blue");
    print("ghost shawl: " + available_amount($item[ghost shawl]) + ". Made in the Old Duke's Estate (village, key) with 10 ghost threads.");
    print("ghost thread: " + available_amount($item[ghost thread]) + ". Acquired from spooky ghosts (village).");
}