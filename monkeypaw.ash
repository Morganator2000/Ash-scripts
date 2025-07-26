void main (String request) {
    if (get_property("_monkeyPawWishesUsed") == 5) {
        abort("You have no wishes remaining");
    }
    switch (request) {
        case "cold dmg":
        case "cold damage":
            if (have_effect($effect[Staying Frosty]) == 0) {
                monkey_paw($effect[Staying Frosty]);
            } else if (have_effect($effect[Permafrosty]) == 0) {
                monkey_paw($effect[Permafrosty]);
            } else if (have_effect($effect[Void Between the Stars]) == 0) {
                monkey_paw($effect[Void Between the Stars]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "cold res":
            if (have_effect($effect[Fever From the Flavor]) == 0) {
                monkey_paw($effect[Fever From the Flavor]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "cold spell":
        case "cold spell dmg":
        case "cold spell damage":
            if (have_effect($effect[Cold as Ice]) == 0) {
                monkey_paw($effect[Cold as Ice]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "-combat":
            if (have_effect($effect[Disquiet Riot]) == 0) {
                monkey_paw($effect[Disquiet Riot]);
            } else if (have_effect($effect[Patent Invisibility]) == 0) {
                monkey_paw($effect[Patent Invisibility]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "combat":
            if (have_effect($effect[Taunt of Horus]) == 0) {
                monkey_paw($effect[Taunt of Horus]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "da":
            if (have_effect($effect[Inscrutable exoskeleton]) == 0) {
                monkey_paw($effect[Inscrutable exoskeleton]);
            } else if (have_effect($effect[Feeling Peaceful]) == 0) {
                monkey_paw($effect[Feeling Peaceful]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "exp":
            switch(my_primestat())  {
            case $stat[Muscle]:
            if (have_effect($effect[HGH-charged]) == 0){
                monkey_paw($effect[HGH-charged]);
            }
            break;
            case $stat[Mysticality]:
            if (have_effect($effect[Different Way of Seeing Things]) == 0){
                monkey_paw($effect[Different Way of Seeing Things]);
            }
            break;
            case $stat[Moxie]: 
            if (have_effect($effect[Thou Shant Not Sing]) == 0){
                monkey_paw($effect[Thou Shant Not Sing]);
            }
            break;
            }
        break;
        case "fam xp":
        case "familiar xp":
        case "familiar experience":
            if (have_effect($effect[Blue Swayed]) == 0) {
                # TODO: this has a variable xp boost    
                monkey_paw($effect[Blue Swayed]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "hot dmg":
        case "hot damage":
            if (have_effect($effect[Dragged Through the Coals]) == 0) {
                monkey_paw($effect[Dragged Through the Coals]);
            } else if (have_effect($effect[Abyssal Blood]) == 0) {
                monkey_paw($effect[Abyssal Blood]); #Untested
            } else {
                abort("Add a new effect.");
            }
            break;
        case "hot res":
        case "hot resistance":
            if (have_effect($effect[Fireproof Lips]) == 0) {
                monkey_paw($effect[Fireproof Lips]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "hp":
            if (have_effect($effect[Preemptive Medicine]) ==0) {
                monkey_paw($effect[Preemptive Medicine]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "init":
        case "initiative":
            if (have_effect($effect[Hare-o-dynamic]) == 0) {
                monkey_paw($effect[Hare-o-dynamic]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "item":
        case "items":
            if (have_effect($effect[Always be Collecting]) == 0){
                monkey_paw($effect[Always be Collecting]);
            } else if (have_effect($effect[Your #1 Problem]) == 0){
                monkey_paw($effect[Your #1 Problem]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "meat":
            if (have_effect($effect[Always be Collecting]) == 0){
                monkey_paw($effect[Always be Collecting]);
            } else if (have_effect($effect[Low on the Hog]) == 0){
                monkey_paw($effect[Low on the Hog]);
            } else if (have_effect($effect[Trufflin']) == 0){
                monkey_paw($effect[Trufflin']);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "ml":
            if (have_effect($effect[Sweetbreads Flamb&eacute;]) == 0) {
                monkey_paw($effect[Sweetbreads Flamb&eacute;]);
            } else if (have_effect($effect[Too Noir For Snoir]) == 0){
                monkey_paw($effect[Too Noir For Snoir]);
            }else { 
                abort("Add a new effect.");
            }
            break;
        case "mox":
        case "moxie":
            if (have_effect($effect[New and Improved]) == 0) {
                monkey_paw($effect[New and Improved]);
            } else if (have_effect($effect[A Contender]) == 0) {
                monkey_paw($effect[A Contender]);
            } else { 
                abort("Add a new effect.");
            }
            break;
        case "mus":
        case "muscle":
            if (have_effect($effect[New and Improved]) == 0) {
                monkey_paw($effect[New and Improved]);
            } else if (have_effect($effect[A Contender]) == 0) {
                monkey_paw($effect[A Contender]);
            } else { 
                abort("Add a new effect.");
            }
            break;
        case "myst":
        case "mysticality":
            if (have_effect($effect[New and Improved]) == 0) {
                monkey_paw($effect[New and Improved]);
            } else if (have_effect($effect[A Contender]) == 0) {
                monkey_paw($effect[A Contender]);
            } else { 
                abort("Add a new effect.");
            }
            break;
        case "sleaze dmg":
        case "sleaze damage":
            if (have_effect($effect[Fifty Ways to Bereave Your Lover]) == 0) {
                monkey_paw($effect[Fifty Ways to Bereave Your Lover]);
            } else if (have_effect($effect[Gutterminded]) == 0) {
                monkey_paw($effect[Gutterminded]);
            } else if (have_effect($effect[Cuts Like a Buttered Knife]) == 0) {
                monkey_paw($effect[Cuts Like a Buttered Knife]);
            } else { 
                abort("Add a new effect.");
            }
            break;
        case "spell dmg":
        case "spell damage":
            if(have_effect($effect[Witch Breaded]) == 0) {
                monkey_paw($effect[Witch Breaded]);
            } else if (have_effect($effect[Pisces in the Skyces]) == 0) {
                monkey_paw($effect[Pisces in the Skyces]);
            } else {
                abort("Add a new effect");
            }
            break;
        case "spooky dmg":
        case "spooky damage":
            if (have_effect($effect[Eyes All Black]) == 0) {
                monkey_paw($effect[Eyes All Black]);
            } else { 
                abort("Add a new effect.");
            }
            break;

        case "spooky res":
            if (have_effect($effect[You Can Taste the Darkness]) == 0) {
                monkey_paw($effect[You Can Taste the Darkness]);
            } else { 
                abort("Add a new effect.");
            }
            break;
        case "stench dmg":
        case "stench damage":
            if (have_effect($effect[Sewer-Drenched]) == 0) { #not tested
                monkey_paw($effect[Sewer-Drenched]);
            } else { 
                abort("Add a new effect.");
            }
            break;
        case "stench res":
            if (have_effect($effect[Can't Smell Nothin']) == 0) {
                monkey_paw($effect[Can't Smell Nothin']);
            } else { 
                abort("Add a new effect.");
            }
            break;
        default:
            abort("Unknown request. Type something like \"-combat\" or \"meat\"");
    }
    int wishes_remaining = 5 - to_int(get_property("_monkeyPawWishesUsed"));
    print("You have " + wishes_remaining + " wishes remaining.");
}