# Script to manage my pulls in an ascension
# TODO helper function to pull, or purchase and pull if needed

void main() {
    # 4 Bat hole 
    ## 3 sonar-in-a-biscuit
    switch (get_property("questL04Bat")) {
        case "unstarted":
        case "started":
            if(item_amount($item[sonar-in-a-biscuit]) < 3) {
                take_storage($item[sonar-in-a-biscuit], 1);
                print("Pulled sonar-in-a-biscuit", "green");
            }
            break;
        case "step1":
            if(item_amount($item[sonar-in-a-biscuit]) < 2) {
                take_storage($item[sonar-in-a-biscuit], 1);
                print("Pulled sonar-in-a-biscuit", "green");
            }
            break;
        case "step2":
            if(item_amount($item[sonar-in-a-biscuit]) < 1) {
                take_storage($item[sonar-in-a-biscuit], 1);
                print("Pulled sonar-in-a-biscuit", "green");
            }
            break;
        default:
            break;
    }

    # 5 Goblins
    ## knob goblin perfume
    switch (get_property("questL05Goblin")) {
        case "unstarted":
        case "started":
        case "step1":
            if(item_amount($item[knob goblin perfume]) < 1) {
                take_storage($item[knob goblin perfume], 1);
                print("Pulled knob goblin perfume", "green");
            }
        default:
            break;
    }

    # 6 Friars

    # 7 Crypt

    # 8 McLargeHuge
    ## TODO cold weather gear if I don't have McHugeLarge
    ## TODO ore but only once the quest is unlocked
    switch (get_property("questL08Trapper")) {
        case "unstarted":
        case "started":
            if(item_amount($item[goat cheese]) < 3) {
                take_storage($item[goat cheese], 1);
                print("Pulled goat cheese", "green");
            }
            break;
        case "step1":
            if(item_amount($item[goat cheese]) < 3) {
                take_storage($item[goat cheese], 1);
                print("Pulled goat cheese", "green");
            }
            # Only runs if you are specifically at step 1, so you know what ore to get.
            if (get_property("questL08Trapper") == "step1") {
                item ore;
                string trapperResponse = visit_url("place.php?whichplace=mclargehuge&action=trappercabin"); 
                matcher ore_matcher = create_matcher("\\b(\\w+)\\s+ore\\b", trapperResponse); 
                if (ore_matcher.find()) { 
                    ore = to_item(ore_matcher.group(1) + " ore");
                take_storage(ore, 1);
                print("Pulled " + ore); 
                }
            }
            break;
        case "step2":
            if(item_amount($item[McHugeLarge duffel bag]) < 0) {
                # TODO take_storage($item[xtrem cold weather outfit]);
                print("Pulled cold weather outfit", "green");
            }
            break;
        default:
            break;
    }

    # 9 Highland Lord
    ## Smut orc keepsake box
    ## structural ember
    ## rusty hedge trimmers
    switch (get_property("questL09Topping")) {
        case "unstarted":
        case "started":
        # TODO this will require a speciallized pull system.
            take_storage($item[smut orc keepsake box], 1);
                print("Pulled smut orc keepsake box", "green");
                # TODO structural embers will eventually not be pullable in standard
            take_storage($item[structural ember], 1);
                print("Pulled structural ember", "green");
        case "step1": 
        # bridge has been built
        case "step2":
        # TODO this will require edits based on where in the twin peak quest I am
            if(item_amount($item[rusty hedge trimmers]) < 4) {
                take_storage($item[rusty hedge trimmers], 1);
                print("Pulled rusty hedge trimmers", "green");
            }
            break;
        default:
            break;
    }

    # 10 Castle
    ## enchanted bean
    ## amulet of plot significance
    ## Titanium assault umbrella
    ## Mohawk wig
    switch (get_property("questL10Garbage")) {
        case "unstarted":
        case "started":
            if(item_amount($item[enchanted bean]) < 1) {
                take_storage($item[enchanted bean], 1);
                print("Pulled enchanted bean", "green");
            }
        case "step1":
        case "step2":
        case "step3":
        case "step4":
        case "step5":
        case "step6":
        case "step7":
            if(item_amount($item[amulet of extreme plot significance]) < 1) {
                take_storage($item[amulet of extreme plot significance], 1);
                print("Pulled amulet of extreme plot significance", "green");
            }
            if(item_amount($item[Titanium assault umbrella]) < 1 || item_amount($item[unbreakable umbrella]) < 1) {
                take_storage($item[Titanium assault umbrella], 1);
                print("Pulled Titanium assault umbrella", "green");
            }
        case "step8":
        case "step9":
            if(item_amount($item[Mohawk wig]) < 1) {
                take_storage($item[Mohawk wig], 1);
                print("Pulled Mohawk wig", "green");
            }
        default:
            break;
    }
    # 11 McGuffin
    ## Blackberry Galoshes
    ## Spooky gro
    ## Stone Wool
    ## Muculent Machete
    ## book of matches
    ## bowling ball
    ## TODO surgeon gear minus 1 if I have the peridot
    ## Wet Stew
    ## Trip Script
    ## Drum machine
    ## killing jar
    ## Tangle of rat tails

    # Black Forest portion
    switch (get_property("questL11Black")) {
        case "unstarted":
        case "started":
        case "step1":
        case "step2":
            if(item_amount($item[Blackberry Galoshes]) < 1) {
                take_storage($item[Blackberry Galoshes], 1);
                print("Pulled Blackberry Galoshes", "green");
            }
            break;
        default:
            break;
    }

    # Desert portion
    switch (get_property("questL11Desert")) {
        case "unstarted":
        case "started":
            if(item_amount($item[Milestone]) < 20) {
                take_storage($item[Milestone], 1);
                print("Pulled Milestone", "green");
            }
            break;
        default:
            break;
    }

    # Red zeplin
    switch (get_property("questL11Ron")) {
        case "unstarted":
        case "started":
        case "step1":
            if(item_amount($item[Lynyrdskin Breeches]) < 1) {
                take_storage($item[Lynyrdskin Tunic], 1);
                print("Pulled Lynyrdskin Tunic", "green");
            }
            if(item_amount($item[Lynyrdskin Cap]) < 1) {
                take_storage($item[Lynyrdskin Tunic], 1);
                print("Pulled Lynyrdskin Tunic", "green");
            }
            if(item_amount($item[Lynyrdskin Tunic]) < 1) {
                take_storage($item[Lynyrdskin Tunic], 1);
                print("Pulled Lynyrdskin Tunic", "green");
            }
            if(item_amount($item[Lynyrd Musk]) < 1) {
                take_storage($item[Lynyrd Musk], 1);
                print("Pulled Lynyrd Musk", "green");
            }
            break;
        default:
            break;
    }

    # Palindome
    switch (get_property("questL11Palindome")) {
        case "unstarted":
        case "started":
        case "step1":
        case "step2":
        case "step3":
            if(item_amount($item[wet stew]) < 1) {
                take_storage($item[wet stew], 1);
                print("Pulled wet stew", "green");
            }
            break;
        default:
            break;
    }

    # TODO spooky forest unlock

    # Hidden city
    switch (get_property("questL11Worship")) {
        case "unstarted":
        case "started":
        case "step1":
            if(item_amount($item[spooky-gro fertilizer]) < 1) {
                take_storage($item[spooky-gro fertilizer], 1);
                print("Pulled spooky-gro fertilizer", "green");
            }
        case "step2":
            if(item_amount($item[nostril of the serpent]) == 1 && item_amount($item[stone wool]) < 1) {
                take_storage($item[stone wool], 1);
                print("Pulled stone wool", "green");
            } else if(item_amount($item[stone wool]) < 2) {
                take_storage($item[stone wool], 1);
                print("Pulled stone wool", "green");
            }
        case "step3":
            if(item_amount($item[muculent machete]) < 1 && item_amount($item[antique machete]) < 1) {
                take_storage($item[muculent machete], 1);
                print("Pulled muculent machete", "green");
            }
        default:
            break;
    }

    # TODO hidden temple surgeonosity
    # questL11Doctor

    # Pyramid portion (finale)
    switch (get_property("questL11Pyramid")) {
        case "unstarted":
        case "started":
        case "step1":
        case "step2":
        case "step3":
        # TODO I should probably add some sort of condition here
            take_storage($item[Tangle of rat tails], 1);
            print("Pulled Tangle of rat tails", "green");
            break;
        default:
            break;
    }

    # 12 Isle War
    ## 3 Trip Script
    ## mick's inhaler
    switch (get_property("questL12War")) {
        case "unstarted":
            break;
        case "started":
            break;
        case "step1":
            break;
        case "step2":
            break;
        case "step3":
            break;
        default:
            break;
    }

    # 13 Naughty Sorceress
    ## Key Lime Pies
    ## Star Chart
    switch (get_property("questL13Final")) {
        case "unstarted":
            break;
        case "started":
            break;
        case "step1":
            break;
        case "step2":
            break;
        case "step3":
            break;
        default:
            break;
    }

    # TODO once all the main things are grabbed, grab things based on other priorities?
    # TODO some items (like the enchanted bean) can be aquired along the way, and therefore shouldn't be pulled early
    # TODO trip scrip is special because it is required for two quests.

    # TODO other things that are just useful to have
    # 11-leaf clover
    # -combat items
    # 
}