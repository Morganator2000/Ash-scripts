# Checks for all the cool items from the Time-Twitching Tower

void print_item(string it) {
    item thing = to_item(it);
    string colour;
    if(available_amount(thing) == 0) {
        colour = "black";
    } else {
        colour = "green";
    }
    print(it + ": " + available_amount(thing), colour);
}

void main() {
    cli_execute("clear");
    print("Level 1: Time Before Time", "blue");
    print_item("Droll Monocle");
    print_item("Silent Pea Shooter");
    print_item("Kiwi Beak");
    print_item("solid shifting time weirdness");
    print_item("Caveman Dan's favorite rock");
    print("Neandermall", "orange");
    print_item("wooly loincloth");
    print_item("yabba dabba doo rag");
    if(in_terrarium($familiar[helix fossil]) || have_familiar($familiar[helix fossil])) {
        print("You have a helix fossil familiar", "green");
    } else {
        print_item("strange helix fossil");
    }
    print();
    print("Level 2: Roaring 20s", "blue");
    print_item("hep waders");
    print_item("birdbone corset");
    print_item("law-abiding citizen cane");
    print_item("banjo kazoo mount");
    print_item("4-dimensional fez");
    print_item("super-absorbent tarp");
    print("Legitimate shoe repair inc", "orange");
    print_item("gumshoes");
    print_item("flapper floppers");
    print_item("sneakeasies");
    print();

    print("Level 3: Roman Times", "blue");
    print_item("vampire pellet");
    print_item("gladiator tunica");
    print_item("unsanitized scalpel");
    print_item("madius");
    print_item("radiator heater shield ");
    print_item("Roman sadnals");
    print_item("centurion helmet");
    print_item("pteruges");
    print();

    print("Level 4: Post-Apocalyptic Future", "blue");
    if(in_terrarium($familiar[Baby Z-Rex]) || have_familiar($familiar[Baby Z-Rex])) {
        print("You have a Baby Z-Rex familiar", "green");
    } else {
        print_item("zombie dinosaur egg");
    }
    print("Applecalypse Store", "orange");
    print_item("iShield");
    print_item("white earbuds");
    print_item("iFlail");
    print();

    print("Level 5: Old West", "blue");
    print_item("outlaw bandana");
    print_item("plaid cowboy hat");
    print_item("rusted-out shootin' iron");
    print();

    print("Level 6: December 25th, 1492", "blue");
    print("The nina", "orange");
    print_item("time shuriken");
    print_item("ninjammies");
    print();

    print("Level 7: Shakespearean Tymes", "blue");
    print_item("hawk");
    print_item("Othello's military jacket");
    print_item("Othello's handkerchief");
    print_item("Othello's dagger");
    print_item("heavy crown");
    print_item("ghostly dagger");
    print("Ye Olde Souvenir Shop", "orange");
    print_item("portable Othello set");
    print_item("Twelve Night Energy");
    print_item("Yorick");
    print();

    print("Level 8: KoL Con 13", "blue");
    // if(in_terrarium($familiar[baby bark scorpion]) || have_familiar($familiar[baby bark scorpion])) {
    //     print("You have a Baby Scorpion familiar", "green");
    // } else {
        print_item("baby bark scorpion");
    // }
    print_item("KoL Con 13 T-shirt");
    print_item("discarded swimming trunks");
    print_item("foam pistol");
    print("Merch Shop", "orange");
    print("Note that unlike every other shop, this one uses Mr. Accessories as currency rather than Chroner.");
    print_item("Portable Laughing Stock");
    print_item("Allied Radio Backpack");
    if(in_terrarium($familiar[evolving organism]) || have_familiar($familiar[evolving organism])) {
        print("You have an evolving organism familiar", "green");
    } else {
        print_item("unevolved organism");
    }
    print_item("wardrobe-o-matic");
    print_item("KoL Con 13 snowglobe");
    print_item("hippo tutu");
    print();

    print("Level 9: Automated Future", "blue");
    print_item("housekeeping automa-core");
    print_item("portable housekeeping robot");
    print();

    print("Level 10: Primordial Seas", "blue");
    print_item("flagellate flagon");
    print_item("messenger bag RNA");
    if(in_terrarium($familiar[Proto-Protozoa]) || have_familiar($familiar[Proto-Protozoa])) {
        print("You have a Proto-Protozoa familiar", "green");
    } else {
        print_item("proto-proto-protozoa");
    }
    print();

    print("Level 11: The Skeleton Wars", "blue");
    print_item("Axis helmet");
    print_item("Axis fatigues");
    print_item("Axis suspenders");
    print_item("ordnance magnet");
    if(in_terrarium($familiar[Baby Skeleton]) || have_familiar($familiar[Baby Skeleton])) {
        print("You have a Baby Skeleton familiar", "green");
    } else {
        print_item("orphaned baby skeleton");
    }
    print("Allied HQ", "orange");
    print_item("chocolate and nylons detector");
    print_item("Allied Forces insignia");
    print();

    print("Level 12: Renaissance Times", "blue");
    print_item("flimsy plastic breastplate");
    print_item("flimsy plastic greaves");
    print_item("flimsy plastic helmet");
    print_item("flimsy plastic shield");
    print_item("The Wizard's Android");
    print_item("Tactical jester's cap");
    print_item("Space Soldier Helmet");
    print("Renaissance Gift Shop", "orange");
    print_item("wooden lute");
    print_item("wooden staff");
    print_item("wooden sword");
    print_item("Staff of Anachronistic Churning");
}