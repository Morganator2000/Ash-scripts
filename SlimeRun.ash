#This is the base damage from being covered in slime, without taking slime resistance into account.
float[11] slime_percent;
 slime_percent[0] = 0;
 slime_percent[1] = 5.334167;
 slime_percent[2] = 4.001677;
 slime_percent[3] = 2.9025;
 slime_percent[4] = 2.016667;
 slime_percent[5] = 1.325;
 slime_percent[6] = .805833;
 slime_percent[7] = .4391667;
 slime_percent[8] = .200833;
 slime_percent[9] = .066667;
 slime_percent[10] = .01;

//this will be a percentage reduction based on your slime resistance
float slime_res = elemental_resistance($element[slime]); 

# how much damage you will take at the start of combat.
#It takes both covered in slime and slime resistance into account.
int slime_damage () {
    int slimeTurns = have_effect($effect[Coated in Slime]);
    if (slimeTurns > 10) {
    slimeTurns = 0;
    }
    int slimeDmg = my_maxhp() * slime_percent[slimeTurns];
    slimeDmg = slimeDmg - (slimeDmg * elemental_resistance($element[slime])/100) + 1;
    print("Predicted slime damage = " + slimeDmg, "green");
    return slimeDmg;
}

string combat_run_away(int round, monster enemy, string text){
    print("Attempting to run away", "blue");
    #Batter Up!
    if (have_skill($skill[Batter Up!]) && my_fury() >= 5) {return "skill Batter Up!";}
    #cosmic bowling ball "bowl a curveball"
    else if (combat_skill_available($skill[bowl a curveball])) {return "skill bowl a curveball";}
    #fish-oil smoke bomb
    else if (item_amount($item[fish-oil smoke bomb]) >= 1) {return "item fish-oil smoke bomb";}
    #feel hatred
    else if (combat_skill_available($skill[feel hatred])) {return "skill feel hatred";}
    #tennis ball
    else if (item_amount($item[tennis ball]) >= 1) {return "item tennis ball";}
    #green smoke bomb
    else if (item_amount($item[green smoke bomb]) >= 1) {return "item green smoke bomb";} 
    #CLEESH to not consume an adventure
    else if (combat_skill_available($skill[CLEESH])) {return "skill CLEESH"; "attack with weapon";}
    #abort if there are no runaway options
    else {return abort("You have no way of running away for free.");}
}

void maintain_ML(int minML) {
    int currentML = monster_level_adjustment();
    cli_execute("mood maintainML");
    cli_execute("mood clear");
    if (currentML < minML) {
        int MLIncr = minML - currentML;
        //Start with the monster aggravation device, as this is "free" ml
        boolean mcd_max() {
            int maxmcd = 10;
            if(canadia_available()) {
                maxmcd = 11;
            }
            if(current_mcd() == maxmcd) {
                return true;
            }
            return change_mcd(maxmcd);
        }
        #prioritize the slime res items first.
        if (have_effect($effect[Slimebreath]) == 0 && MLIncr > 1) {
            cli_execute("trigger lose_effect, Slimebreath, chew 1 slimy alveolus");
            MLIncr = MLIncr - 50;
        }
        if (have_effect($effect[Grimace]) == 0 && MLIncr > 1) {
            cli_execute("trigger lose_effect, Grimace, eat 1 slimy sweetbreads");
            MLIncr = MLIncr - 25;
        }
        if (have_effect($effect[bilious]) == 0 && MLIncr > 1) {
            cli_execute("trigger lose_effect, Bilious, drink 1 slimy fermented bile bladder");
            MLIncr = MLIncr - 25;
        }
        
        #then go by a ML per meat basis. Good luck. Here's the code for various effects.
        // cli_execute("trigger lose_effect, Pride of the Puffin, cast 1 Pride of the Puffin");
        // cli_execute("trigger lose_effect, Angering Pizza Purists, eat 1 plain calzone");
        // cli_execute("trigger lose_effect, Bloodthirsty, drink 1 blood and blood");
        // cli_execute("trigger lose_effect, Gelded, use 1 chocolate filthy lucre");
        // cli_execute("trigger lose_effect, Manbait, use 1 the most dangerous bait");
        // cli_execute("trigger lose_effect, Misplaced Rage, use 1 angry agate");
        // cli_execute("trigger lose_effect, Para-lyzed Jaw, use 1 Para-pop");
        // cli_execute("trigger lose_effect, Red Lettered, use 1 red letter");
        // cli_execute("trigger lose_effect, Too Noir for Soir, eat 1 hardboiled-egg"); //There are two items that can give this effect. Use both?
        // cli_execute("trigger lose_effect, Tortious, use 1 mocking turtle");
        //maybe get the code to buy the biggest boosts first. Or maybe ml per meat is a better metric.
        mood_execute(1);
        currentML = monster_level_adjustment();
    }
    print("ML boosted to " + monster_level_adjustment());
    if (currentML < minML) {
        abort("ML cannot be boosted this high.");
    }
}

boolean cleanupTime() {
    visit_url("clan_slimetube.php?action=chamois");
    if (have_effect( $effect[Coated in Slime]) > 0 ) {
        ## Something must have gone wrong.
        return false;
    } else {
        print ("Slime cleaned with Chamois");
        return true;
    }
}

void main (int turnsToAdventure, int minML) {
    # Keep track of how many adventures we have done.
    int adventureCounter = 0;
    boolean slimed = false;

    # If you enter a number greater than your current adventures, it will use all of them.
    if(turnsToAdventure > my_adventures()) turnsToAdventure = my_adventures();

    #Now the adventure loop. This will repeat as long as there are adventures remaining.
    while( my_adventures() > 0 && (turnsToAdventure-adventureCounter) > 0 ) {
        #first, do one adventure at low ml then run away. This will maximize the turns of covered in slime.
        #It will skip this part if you're already covered in slime.
        if (have_effect($effect[Coated in Slime]) == 0) {
            cli_execute("uneffect annoyance");
            change_mcd(0);
            cli_execute("maximize -ml"); //use other -ml items if needed?
            int temporaryAdvCounter = my_adventures();
            adv1($location[The Slime Tube], -1, "combat_run_away"); //if this adventure is a non-combat, you need to do it again.
            if (temporaryAdvCounter > my_adventures()) {
                ## Our adventures decreased. Therefore this did take an adventure.
                adventureCounter = adventureCounter + 1;
                print("Warning! Runaway was not free.", "red");
                print ("Finished adventure " +adventureCounter +" of " +turnsToAdventure, "orange");
            }
        }
        cli_execute("outfit +slime"); 
        cli_execute("equip tiny stillsuit");
        cli_execute("cast annoyance"); //this will be removed once maintain_ML is fixed
        if(canadia_available()) {//this will be removed once maintain_ML is fixed
            change_mcd(11);
        } else {
            change_mcd(10);
        }
        int slimeDamage = slime_damage();

        #Now that you're covered in slime, fight slimes until the damage exceeds your max hp.
        while(slimeDamage <= my_maxhp() && (turnsToAdventure-adventureCounter) > 0) {
            while(slimeDamage > my_hp()) {
                cli_execute("cast * cocoon"); //Is there a better way to heal?
            }
            // if (minML < monster_level_adjustment()) {
            //     maintain_ML(minML);
            // }
            int temporaryAdvCounter = my_adventures();
            adventure(1, $location[The Slime Tube]); //Add a way to heal in combat if needed. 
            if (temporaryAdvCounter > my_adventures()) {
                ## Our adventures decreased. Therefore this did take an adventure.
                adventureCounter = adventureCounter + 1;
            }
            print ("Finished adventure " +adventureCounter +" of " +turnsToAdventure, "orange");
            slimeDamage = slime_damage(); #recalculate slime damage for the next round.
        }
        if (slimeDamage >= my_maxhp() || turnsToAdventure == adventureCounter) {
            if(slimeDamage >= my_maxhp()) {
                print("Slime damage now exceeds max hp. Time to clean up.", "blue");
                if (!cleanupTime()) {
                    abort("Couldn't clean. Check Chamois bucket");
                }
                while (my_hp() < my_maxhp()) {
                    cli_execute("cast * cocoon");
                }
            }

            if(turnsToAdventure == adventureCounter) {
                print("That's the last adventure. Time to clean up.", "blue");
                if (!cleanupTime()) {
                    abort("Couldn't clean. Check Chamois bucket");
                }
                while (my_hp() < my_maxhp()) {
                    cli_execute("cast * cocoon");
                }
            }
        }
    }

}

#TODO: Math is not mathing. Sometimes the number of adventures spent will exceed the number I wanted to spend. Find out why
    #Probably has something to do with the non-combats or losing combat.
#TODO: implement the code for maintaining ML into the void main.
#TODO: maintain_ML should check fullness, drunkness, and spleen damage
#TODO: make an ideal slime +ml outfit?
#TODO... maybe: use a -ml effect if you're just a small step away from the next low tier, then unnaffect it. 
                #Possibly uneffect the "cheap" +ml effects.