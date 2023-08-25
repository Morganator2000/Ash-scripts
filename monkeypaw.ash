void main (String request) {
    //print(_monkeyPawWishesUsed);
    switch (request) {
        case "-combat":
            if (have_effect($effect[Disquiet Riot]) == 0) {
                monkey_paw($effect[Disquiet Riot]);
                break;
            }
        case "init":
        case "initiative":
            if (have_effect($effect[Hare-o-dynamic]) == 0) {
                monkey_paw($effect[Hare-o-dynamic]);
                break;
            }
        case "item":
        case "items":
            if (have_effect($effect[Always be Collecting]) == 0){
                monkey_paw($effect[Always be Collecting]);
                break;
            }
            break;
        case "ml":
            if (have_effect($effect[Sweetbreads Flamb&eacute;]) == 0) {
                monkey_paw($effect[Sweetbreads Flamb&eacute;]);
                break;
            }
            break;
        default:
            abort("Unknown request. Type something like \"-combat\" or \"meat\"");
    }
}