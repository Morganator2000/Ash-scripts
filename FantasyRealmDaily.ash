#Bandit crossroad
#Cursed village (cosmic bowling ball, new age hurting crystal) then wishing well (~50 rubees)
#Mystic Wood (cosmic bowling ball, new age hurting crystal) unlock campsite
    #Druidic campsite
#Sprawling Cemetery then rob graves (~50 rubees)
#Putrid swamp
#Towering mountains unlock cave
    #foreboding cave open chest (buy key first) 

string throw_things(int round, monster enemy, string text){
    if(round == 1) {return "item cosmic bowling ball/new age hurting crystal";}
    else return "item new age healing crystal/new age hurting crystal";
} //TODO: make sure you have a throwable item

void equip_fantasy_gear() {
    equip($slot[weapon], $item[LyleCo premium magnifying glass]);
    equip($slot[acc2], $item[fantasyrealm g. e. m.]);
    equip($slot[acc3], $item[fantasyrealm g. e. m.]);
    equip($slot[familiar], $item[none]);
}

void main() {
    #make sure you have the required adventures (45?)
    if(my_adventures() < 45){
        abort("You need 45 adventures to run this script");
    }
    #Get FantasyRealm starter gear
    if ($item[fantasyrealm g. e. m.].available_amount() == 0) {
        int hat_choice;
        switch (my_primestat()) {
            case $stat[muscle]:
                hat_choice = 1;
                break;
            case $stat[mysticality]:
                hat_choice = 2;
                break;
            case $stat[moxie]:
                hat_choice = 3;
                break;
            default:
                abort("Why can't you pick a hat?");
        }
        visit_url("place.php?whichplace=realm_fantasy&action=fr_initcenter");
        visit_url("choice.php?whichchoice=1280&option=" + hat_choice);

    }
    #Begin with combats. The only hour you're losing for now are the ones to unlock the Foreboding Cave and The Druidic Campsite
    #Bandit crossroad (no hours spent)
    cli_execute("maximize mus");
    equip_fantasy_gear();
    adventure(5, $location[The Bandit Crossroads]);
    print("Finished at the Bandit Crossroad", "green");

    #Putrid Swamp (no hours spent)
    adventure(5, $location[The Putrid Swamp]);
    print("Finished at the Putrid Swamp", "green");

    #Mystic wood (1 hour spent)
    adventure(5, $location[The Mystic Wood], "throw_things");
    //add choice adventure to unlock campsite
    adv1($location[The Mystic Wood]);
    run_choice(2);
    print("Finished at the Mystic Wood", "green");

    #Druidic Campsite (no hours spent)
    adventure(5, $location[The Druidic Campsite]);
    print("Finished at the Druidic Campsite", "green");

    #Towering Mountains (1 hour spent)
    adventure(5, $location[The Towering Mountains]);
    //add choice adventure to unlock foreboding cave
    print("Finished at the Towering Mountains", "green");

    #Foreboding Cave (1 hour spent)
    adventure(5, $location[The Foreboding Cave]);
    //buy key if unavailable
    //add choice adventure to open chest
    print("Finished at the Foreboding Cave", "green");

    #Sprawling Cemetery (1 hour spent)
    adventure(5, $location[The Sprawling Cemetery]);
    //add choice adventure to rob graves
    print("Finished at the Sprawling Cemetery", "green");

    #Cursed Village (1 hour spent, the last one)
    adventure(5, $location[The Cursed Village], "throw_things");
    //add choice adventure to dive into well
    print("Finished at the Cursed Village", "green");
}

#TODO: track how many rubees you've made, because why not?
#TODO: fix throw_things() to account for when combat items are missing.
#TODO: what happens when the adventure was free?
#TODO: figure out combat scripts to use and when
#TODO: make sure the outfit changes appropriately to match the area