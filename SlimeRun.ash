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

string combat_run_away(){
    print("Attempting to run away", "red");
    #Batter Up!
    if (have_skill($skill[Batter Up!]) && my_fury() >= 5) {return "skill Batter Up!";}
    #cosmic bowling ball "bowl a curveball"
    else if (combat_skill_available($skill[bowl a curveball])) {return "skill bowl a curveball";}
    #fish-oil smoke bomb
    else if (item_amount($item[fish-oil smoke bomb]) >= 1) {return "item fish-oil smoke bomb";}
    #feel hatred
    else if (combat_skill_available($skill[feel hatred])) {return "skill feel hatred";}
    #green smoke bomb
    else if (item_amount($item[green smoke bomb]) >= 1) {return "item green smoke bomb";}
    #abort if there are no runaway options
    else {return abort("You have no way of running away for free. I recommend buying a Green Smoke Bomb");}
     //This isn't working. It's returning void for some reason.
}

/*int maintain_ML(int minML) {
    while (monster_level_adjustment() < minML) {
        //code to maintain the minML.
        //This will involve buying stuff.
        //maybe get the code to buy the biggest boosts first. Or maybe ml per meat is a better metric.
    }
}*/

boolean cleanupTime() {
    visit_url( "clan_slimetube.php?action=chamois" );
    if ( have_effect( $effect[Coated in Slime] ) > 0 ) {
        ## Something must have gone wrong.
        return false;
    } else {
        print ("Slime cleaned with Chamois");
        return true;
    }
}

void main (int turnsToAdventure) {
    # Keep track of how many adventures we have done.
    int adventureCounter = 0;

    # If you enter a number greater than your current adventures, it will use all of them.
    if( turnsToAdventure > my_adventures() ) turnsToAdventure = my_adventures();

    #Now the adventure loop. This will repeat as long as there are adventures remaining.
    while( my_adventures() > 0 && (turnsToAdventure-adventureCounter) > 0 ) {
        #first, do one adventure at low ml then run away. This will maximize the turns of covered in slime.
        #It will skip this part if you're already covered in slime.
        if (have_effect($effect[Coated in Slime]) == 0) {
            cli_execute("maximize -ml"); //use othe -ml items if needed?
            adventure(1 , $location[The Slime Tube], "combat_run_away"); //Why is this returning void?
        }
        cli_execute("outfit +slime"); 
        int slimeDamage = slime_damage();

        #Now that you're covered in slime, fight slimes until the damage exceeds your max hp.
        while(slimeDamage <= my_maxhp()) {
            while(slimeDamage > my_hp()) {
                cli_execute("cast 1 cocoon"); //Is there a better way to heal?
            }
            adventure(1, $location[The Slime Tube]); //Add a way to heal in combat if needed. 
            slimeDamage = slime_damage(); #recalculate slime damage for the next round.
            adventureCounter = adventureCounter + 1;
        }

        print("Slime damage now exceeds max hp. Time to clean up.", "blue");
        if (!cleanupTime()) {
            abort("Couldn't clean. Check Chamois bucket");
        }
        while (my_hp() < my_maxhp()) {
            cli_execute("cast 1 cocoon");
        }
    } //This infinite loops. Exit condition isn't working

}

#TODO: add slime res to the damage calculator, and make sure the math is correct.
#TODO: make an ideal slime +ml outfit?
#TODO: eat, drink, and chew basic slime items?
#TODO: maintain a set ml
#TODO... maybe: use a -ml effect if you're just a small step away from the next low tier, then unnaffect it. Possibly uneffect the "cheap" +ml effects.