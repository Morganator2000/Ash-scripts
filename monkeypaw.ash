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
            } else {
                abort("Add a new effect.");
            }
            break;
        case "meat":
            if (have_effect($effect[Shadow Waters]) == 0){
                monkey_paw($effect[Shadow Waters]);
            } else if (have_effect($effect[Covetin' Drunk]) == 0){
                monkey_paw($effect[Covetin' Drunk]);
            } else if (have_effect($effect[Always be Collecting]) == 0){
                monkey_paw($effect[Always be Collecting]);
            } else {
                abort("Add a new effect.");
            }
            break;
        case "ml":
            if (have_effect($effect[Sweetbreads Flamb&eacute;]) == 0) {
                monkey_paw($effect[Sweetbreads Flamb&eacute;]);
            } else { 
                abort("Add a new effect.");
            }
            break;
        case "mox":
        case "moxie":
            abort("Add a new effect.");
        case "mus":
        case "muscle":
            if (have_effect($effect[A Contender]) == 0) {
                monkey_paw($effect[A Contender]);
            } else { 
                abort("Add a new effect.");
            }
            break;
        case "myst":
        case "mysticality":
            abort("Add a new effect.");
        default:
            abort("Unknown request. Type something like \"-combat\" or \"meat\"");
    }
    int wishes_remaining = 5 - to_int(get_property("_monkeyPawWishesUsed"));
    print("You have " + wishes_remaining + " wishes remaining.");
}