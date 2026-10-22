#Bandit crossroad
#Cursed village (cosmic bowling ball, new age hurting crystal) then wishing well (~50 rubees)
#Mystic Wood (cosmic bowling ball, new age hurting crystal) unlock campsite
    #Druidic campsite
#Sprawling Cemetery then rob graves (~50 rubees)
#Putrid swamp
#Towering mountains unlock cave
    #foreboding cave open chest (buy key first) 
# This should get you a low 285 rubees or a high of 345 rubees (315 average) for 35 adventures. 
# That's about 9 rubees per adventure
# TODO sometimes it is appropriate to use a custom combat script rather than forcing attack.
#TODO: fix throw_things() to account for when combat items are missing.
#TODO: free adventures (from stuff like breathitin) break this script.

string throw_things(int round, monster opp, string text){
    if(round == 1) {
        return "item great wolf's lice,cosmic bowling ball";
    } else {
        return "item new age healing crystal,new age hurting crystal";
    }
}

void equip_fantasy_gear() {
    equip($slot[weapon], $item[LyleCo premium magnifying glass]);
    equip($slot[acc2], $item[LyleCo premium monocle]);
    equip($slot[acc3], $item[fantasyrealm g. e. m.]);
    equip($slot[familiar], $item[none]);
}

void main() {
    # Check to make sure you can do a full run.
    if(my_adventures() < 45){
        abort("You need 45 adventures to run this script");
    }
    # See if the price of a visitor pass makes this run worth it.
    int pass_price =  mall_price($item[FantasyRealm guest pass]);
    float rubee_price = pass_price/350;
    # Considering that we can volcano mine at around 3000 meat per adventure, we need to exceed that for it to be worthwhile.
    # On average we should get 9 rubees per adventure. Therefore...
    if(rubee_price*9 < 3000) {
        abort("Doing this is not worth the price of a guest pass.");
    }

    # record initial Rubees
    int initial_rubees = item_amount($item[Rubee&trade;]);

    #Get FantasyRealm starter gear
    if (available_amount($item[fantasyrealm g. e. m.]) == 0) {
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
    # Begin with combats. The only hour you're losing for now are the ones to unlock the Foreboding Cave and The Druidic Campsite
    # Bandit crossroad (no hours spent), gain 15 rubees
    cli_execute("maximize mus");
    equip_fantasy_gear();
    adventure(5, $location[The Bandit Crossroads]);
    print("Finished at the Bandit Crossroad", "green");

    # Putrid Swamp (no hours spent), gain 15 rubees
    cli_execute("maximize stench res");
    equip_fantasy_gear();
    adventure(5, $location[The Putrid Swamp]);
    print("Finished at the Putrid Swamp", "green");

    # Mystic wood (1 hour spent), gain 15 rubees
    adventure(5, $location[The Mystic Wood], "throw_things");
    # add choice adventure to unlock campsite
    adv1($location[The Mystic Wood]);
    run_choice(2);
    print("Finished at the Mystic Wood", "green");

    # Druidic Campsite (no hours spent), gain 20 rubees
    cli_execute("maximize mus");
    equip_fantasy_gear();
    equip($slot[acc1], $item[bezoar ring]);
    adventure(5, $location[The Druidic Campsite]);
    print("Finished at the Druidic Campsite", "green");

    # Towering Mountains (1 hour spent), gain 15 rubees 
    cli_execute("maximize spell dmg percent, lantern");
    equip_fantasy_gear();
    adventure(5, $location[The Towering Mountains], "skill saucestorm;");
    # unlock foreboding cave
    adv1($location[The Towering Mountains]);
    run_choice(2);
    print("Finished at the Towering Mountains", "green");

    # Foreboding Cave (1 hour spent), gain between 110 and 130 rubees
    # Buy key if you need to.
    if(item_amount($item[fantasyrealm key]) < 1) {
        visit_url("shop.php?whichshop=fantasyrealm&action=buyitem&quantity=1&whichrow=1003&pwd");
    }
    cli_execute("maximize ranged dmg");
    equip_fantasy_gear();
    # currently the best weapon that increases ranged damage is a melee weapon. Figure that one out.
    equip($item[deep six-shooter]);
    adventure(5, $location[The Foreboding Cave], "attack;");
    //open chest
    adv1($location[The Foreboding Cave]);
    run_choice(1);
    print("Finished at the Foreboding Cave", "green");

    # Sprawling Cemetery (1 hour spent), gain between 55 and 75 rubees
    cli_execute("maximize spooky res");
    equip_fantasy_gear();
    adventure(5, $location[The Sprawling Cemetery], "skill saucestorm;");
    //rob graves
    adv1($location[The Sprawling Cemetery]);
    run_choice(4);
    print("Finished at the Sprawling Cemetery", "green");

    #Cursed Village (1 hour spent, the last one), gain between 55 and 75 rubees
    adventure(5, $location[The Cursed Village], "throw_things");
    //dive into well
    adv1($location[The Cursed Village]);
    run_choice(5);
    print("Finished at the Cursed Village", "green");

    # Print results
    int current_rubees = item_amount($item[Rubee&trade;]);
    int rubees_earned = current_rubees - initial_rubees;

    print("You have gained " + rubees_earned + " Rubee&trade;s from this run.", "green");
    print("You now have " + current_rubees + " Rubee&trade;s.", "green");
}