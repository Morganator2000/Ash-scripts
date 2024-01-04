void main(boolean mallsell) {
    cli_execute("clear");
    print("Elf Guard MPCs: " + available_amount($item[Elf Guard MPC]), "green");
    print("Pieces of 12: " + available_amount($item[Crimbuccaneer piece of 12]), "red");
    print();

    print("Ambuela's Cottage", "blue");
    print("Elves", "green");
    print("Elf Guard officer's sidearm (elf warefare): " + available_amount($item[Elf Guard officer's sidearm]));
    print("Elf Guard insignia (general) (adventures): " + available_amount($item[Elf Guard insignia (general)]));
    print("Elf Guard commandeering gloves (elf warfare): " + available_amount($item[Elf Guard commandeering gloves]));
    print("Elf Guard Field Manual: Extortion (skill): " + available_amount($item[Elf Guard Field Manual: Extortion]));
    print("Elf Guard eyedrops (items): " + available_amount($item[Elf Guard eyedrops]));
    print("Elf Guard strategic map (increase pieces of 12): " + available_amount($item[Elf Guard strategic map]));
    print("Pirates", "red");
    print("Crimbuccaneer flotsam (armory item): " + item_amount($item[Crimbuccaneer flotsam]));
    print("Crimbuccaneer premium booty sack (rare item): " + available_amount($item[Crimbuccaneer premium booty sack]));
    print("Crimbuccaneer shirt (weight): " + available_amount($item[Crimbuccaneer shirt]));
    print("Crimbuccaneer invasion map (Increase MPC): " + available_amount($item[Crimbuccaneer invasion map]));
    print("Crimbuccaneer captain's purse (Pieces of 12): " + available_amount($item[Crimbuccaneer captain's purse]));
    print("brown pirate pants (spooky res): " + available_amount($item[brown pirate pants]));
    print();

    print("Cafe", "blue");
    print("Elves", "green");
    print("ancient Elf dessert spoon (spell damage): " + available_amount($item[ancient Elf dessert spoon]));
    print("sundae ration (food): " + available_amount($item[sundae ration]));
    print("Elf Guard Field Manual: Culinary Arts (skill): " + (available_amount($item[Elf Guard Field Manual: Culinary Arts])));
    print("peppermint tack (crafting item): " + available_amount($item[peppermint tack]));
    print("Elf Guard clipboard (items): " + available_amount($item[Elf Guard clipboard]));
    print("Elf Guard payroll bag (gives MPC): " + available_amount($item[Elf Guard payroll bag]));
    print("Pirates", "red");
    print("pegfinger (MPC drop): " + available_amount($item[pegfinger]));
    print("whalesteak (crafting item): " + available_amount($item[whalesteak]));
    print();
    
    print("Armory", "blue");
    print("Elves", "green");
    print("Elf Guard mouthknife (elf warefare): " + available_amount($item[Elf Guard mouthknife]));
    print("Elf Guard SCUBA tank (underwater): " + available_amount($item[Elf Guard SCUBA tank]));
    print("Kelflar vest (elf warfare): " + available_amount($item[Kelflar vest]));
    print("Elvish underarmor (DA): " + available_amount($item[Elvish underarmor]));
    print("red and white claret (crafting item): " + available_amount($item[red and white claret]));
    print("Elf Guard red and white beret (pvp): " + available_amount($item[Elf Guard red and white beret]));
    print("Pirates", "red");
    print("shipwright's hammer (pirate warfare): " + available_amount($item[shipwright's hammer]));
    print("gunwale (mus): " + available_amount($item[gunwale]));
    print("cannonbomb (kill elves): " + available_amount($item[cannonbomb]));
    print("free boots (sleaze res): " + available_amount($item[free boots]));
    print("whale cerebrospinal fluid (warfare effectiveness): " + available_amount($item[whale cerebrospinal fluid]));
    print("Crimbuccaneer runebone (myst): " + available_amount($item[Crimbuccaneer runebone]));
    print();
    
    print("Bar", "blue");
    print("Elves", "green");
    print("Elf Guard hangover cure: " + available_amount($item[Elf Guard hangover cure]));
    print("peppermint bomb: " + available_amount($item[peppermint bomb]));
    print("Elf Guard broom: " + available_amount($item[Elf Guard broom]));
    print("officer's nog: " + available_amount($item[officer's nog]));
    print("Elf Guard Field Manual: Wilderness Sleeping: " + available_amount($item[Elf Guard Field Manual: Wilderness Sleeping]));
    print("Pirates", "red");
    print("grog nuts: " + available_amount($item[grog nuts]));
    print("punching mirror: " + available_amount($item[punching mirror]));
    print("sawed-off blunderbuss: " + available_amount($item[sawed-off blunderbuss]));
    print("Crimbuccaneer tavern swab: " + available_amount($item[Crimbuccaneer tavern swab]));
    print("old-school pirate grog: " + available_amount($item[old-school pirate grog]));
    print("Cocktails of the Age of Sail: " + available_amount($item[Cocktails of the Age of Sail]));
    print();
    
    print("Factory", "blue");
    print("Elves", "green");
    print("Elf Army machine parts: " + available_amount($item[Elf Army machine parts]));
    print("massive wrench: " + available_amount($item[massive wrench]));
    print("military-grade peppermint oil: " + available_amount($item[military-grade peppermint oil]));
    print("Elf Guard fuel tank: " + available_amount($item[Elf Guard fuel tank]));
    print("Elf Guard tinsel grenade: " + available_amount($item[Elf Guard tinsel grenade]));
    print("Elf Guard honor present: " + available_amount($item[Elf Guard honor present]));
    print("Pirates", "red");
    print("Crimbuccaneer mologrog cocktail: " + available_amount($item[Crimbuccaneer mologrog cocktail]));
    print("Crimbuccaneer bombjacket: " + available_amount($item[Crimbuccaneer bombjacket]));
    print("Crimbuccaneer whale oil: " + available_amount($item[Crimbuccaneer whale oil]));
    print("Crimbuccaneer lantern: " + available_amount($item[Crimbuccaneer lantern]));
    print("Crimbuccaneer rigging lasso: " + available_amount($item[Crimbuccaneer rigging lasso]));
    print("baby rigging snake: " + available_amount($item[baby rigging snake]));
    print();
    
    print("Other", "blue");
    print("Elves", "green");
    print("Elf Guard patrol cap: " + available_amount($item[Elf Guard patrol cap]));
    print("Elf Guard hotpants: " + available_amount($item[Elf Guard hotpants]));
    print("Elf Guard insignia (private): " + available_amount($item[Elf Guard insignia (private)]));
    print("Pirates", "red");
    print("Crimbuccaneer tricorn: " + available_amount($item[Crimbuccaneer tricorn]));
    print("Crimbuccaneer breeches: " + available_amount($item[Crimbuccaneer breeches]));
    print("Crimbuccaneer fledges (mint): " + available_amount($item[Crimbuccaneer fledges (mint)]));
    
    if (mallsell) {
        
    }
}   

#TODO Add items to sell before end of crimbo