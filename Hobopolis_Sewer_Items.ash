void main () {
    int umbrella = available_amount($item[Gatorskin Umbrella]);
    int binder = available_amount($item[Hobo Code Binder]);
    int wad = available_amount($item[Sewer Wad]);
    int dumpling = available_amount($item[Unfortunate Dumplings]);
    int ooze = available_amount($item[Bottle of Ooze-O]);
    int oil = available_amount($item[Oil of Oiliness]);

    print("You have " + umbrella + " gatorskin umbrellas.");
    print("You have " + binder + " hobo code binder.");
    print("You have " + wad + " sewer wads");
    print("You have " + dumpling + " unfortunate dumplings");
    print("You have " + ooze + " bottles of ooze-o");
    print("You have " + oil + " flasks of oil of oiliness");
    print();

    boolean allgood = true;

    if (umbrella < 1) {
        print("Missing gatorskin umbrella.", "red");
        if (have_skill($skill[Armorcraftiness])) {
            print("Smith together gator skin (you have " + available_amount($item[gator skin]) 
            + ") and either titanium assault umbrella (you have " + available_amount($item[titanium assault umbrella]) + ") "
            + "or goatskin umbrella (you have " + available_amount($item[goatskin umbrella]) + ").", "red");
        } else {
            print("You do not have armorcraftiness. You'll have to buy this.", "red");
        }
        allgood = false;
    }

    if (binder < 1) {
        print("you do not have a hobo code binder.", "red");
        allgood = false;
    }

    if (wad < 1) {
        print("Missing Sewer Wad.", "red");
        if (my_primestat() == $stat[muscle] && have_skill($skill[Pulverize])) {
            print("Make by combining 5 sewer nuggets (you have " + available_amount($item[sewer nuggets]) + ").", "red");
        } else {
            print("You do not have access to the Malus of Forethought. You'll have to buy this.", "red");
        }
        allgood = false;
    }

    if (dumpling < 1) {
        print("Missing unfortunate dumpling.", "red");
        if (have_skill($skill[Transcendental Noodlecraft])) {
            print("Cook C.H.U.M. chum (you have " + available_amount($item[C.H.U.M. chum]) 
        + ") with savory dry noodles (you have " + available_amount($item[savory dry noodles]) + ").", "red" );
        } else {
            print("You do not have transcendental noodlecraft. You'll have to buy this.", "red");
        }
        allgood = false;
    }

    if (ooze < 1) {
        print("Missing bottle of Ooze-O.", "red");
        if (stills_available() > 0 && have_skill($skill[Superhuman Cocktailcrafting])) {
            print("Distill bottle of sewage schnapps (you have " + available_amount($item[bottle of sewage schnapps]) + ").", "red" );
        } else {
            print("You cannot use Nash Crosby's Still. You'll have to buy this.", "red");
        }
        allgood = false;
    }

    if (oil < 3) {
        print("Missing " + (3 - oil) + " flasks of oil of oiliness.", "red");
        if (have_skill($skill[Advanced Saucecrafting])) {
            print("Cook a decaying goldfish liver (you have " + available_amount($item[decaying goldfish liver]) 
        + ") with a scrumptious reagent (you have " + available_amount($item[scrumptious reagent]) + ").", "red" );
        } else {
            print("You do not have advanced saucecrafting. You'll have to buy this.", "red");
        }
        allgood = false;
    }

    if (allgood) {
        print("You have everything you need. Have fun sewer diving! Watch out for cages!", "green");
    }

}