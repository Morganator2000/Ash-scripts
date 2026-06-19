# Adventure at the hobopolis town square, trying to get the least abundant hobo part each time.
# To run this you need stuffed mortar shell, flavor of magic, and an outfit called "Spell Dmg" that has no lantern effects.

# get counts of Richard's items
int [string] get_richard_inventory() {
    int [string] counts;
    
    string page_html = visit_url("clan_hobopolis.php?place=3&action=talkrichard&whichtalk=3");

    int get_count(string html, string pattern) {
        # create the pattern to find quantities. Gosh regex is hard.
        string regex = "Richard has <b>([\\d,]+)</b> ";
    
        if (pattern == "charred boots") {
            regex += "pair(s)? of charred hobo boots";
        } else if (pattern == "frozen eyes") {
            regex += "pair(s)? of frozen hobo eyes";
        } else if (pattern == "stinking guts") {
            regex += "pile(s)? of stinking hobo guts";
        } else if (pattern == "creepy skulls") {
            regex += "creepy hobo skull(s)?";
        } else if (pattern == "crotches") {
            regex += "hobo crotch(es)?";
        } else if (pattern == "skins") {
            regex += "hobo skin(s)?";
        }
        matcher m = create_matcher(regex, html);
        if (m.find()) {
            string clean_number = replace_string(m.group(1), ",", "");
            return to_int(clean_number);
        }
        return 0;
    }

    counts["charred boots"] = get_count(page_html, "charred boots"); #pair of charred hobo boots/pairs of charred hobo boots
    counts["frozen eyes"]   = get_count(page_html, "frozen eyes"); # pair of frozen hobo eyes/pairs of frozen hobo eyes
    counts["stinking guts"] = get_count(page_html, "stinking guts"); # pile of stinking hobo guts/piles of stinking hobo guts
    counts["creepy skulls"] = get_count(page_html, "creepy skulls"); # creepy hobo skull/creepy hobo skulls
    counts["crotches"]      = get_count(page_html, "crotches"); # hobo crotch/hobo crotches
    counts["skins"]         = get_count(page_html, "skins"); # hobo skin/hobo skins

    return counts;
}

# Determine which part Richard has the least of
string get_least_abundant_part(int [string] part_map) {
    string lowest_part = "";
    # Just start with a really high number. It's not possible to get this many parts as there are only 3000 hobos.
    int lowest_count = 4000;

    # iterate through the parts to find the lowest. There's probably an easier way to do this but I can't be arsed to find it.
    foreach part_name, quantity in part_map {
        if (quantity < lowest_count) {
            lowest_count = quantity;
            lowest_part = part_name;
        }
    }
    
    return lowest_part;
}

void main (int adventures) {
    # make sure you've cleared the sewer first.
    if(!can_adventure($location[Hobopolis Town Square])) {
        abort("Hobopolis Town square is not available. Please clear the sewer first.");
    }

    if (!have_skill($skill[Stuffed Mortar Shell])) {
       abort("Stuffed mortar shell is a required combat skill."); 
    }

    if (!have_skill($skill[flavour of magic])) {
       abort("You need flavour of magic (pastamancer lv 15 skill)."); 
    }

    # this currently works for me because I've manually made a "Spell Dmg" outfit without lanterns.
    if (!have_outfit("Spell Dmg")) {
        # create the spell dmg outfit. Lanterns mess with the parts acquisition
        # so we'll try to exclude them.
        cli_execute("maximize spell dmg percent, -lantern");
        cli_execute("outfit save Spell Dmg");
    }

    if(adventures > my_adventures()) {
        print("You don't have that many adventures. Compensating...", "red");
        adventures = my_adventures();
    } 

    # Get counts of hobo parts and display.
    int [string] hobo_parts = get_richard_inventory();

    foreach hobo_part, quantity in hobo_parts {
        print("Richard has " + quantity + " " + hobo_part);
    }

    # The adventure loop
    int adventure_counter = 0;
    while( my_adventures() > 0 && (adventures-adventure_counter) > 0 ) {
        # First, pick a flavour of magic based on which hobo part is needed.
        int [string] hobo_parts = get_richard_inventory();
        string lowest_part = get_least_abundant_part(hobo_parts); 

        switch (lowest_part) {
            case "charred boots":
                use_skill(1, $skill[Spirit of Cayenne]);
                outfit("Spell Dmg");
                break;
            case "frozen eyes":
                use_skill(1, $skill[Spirit of Peppermint]);
                outfit("Spell Dmg");
                break;
            case "stinking guts":
                use_skill(1, $skill[Spirit of Garlic]);
                outfit("Spell Dmg");
                break;
            case "creepy skulls":
                use_skill(1, $skill[Spirit of Wormwood]);
                outfit("Spell Dmg");
                break;
            case "crotches":
                use_skill(1, $skill[Spirit of Bacon Grease]);
                outfit("Spell Dmg");
                break;
            case "skins":
                # Skins are the exception, here we just go with weapon dmg and attack.
                cli_execute("maximize weapon dmg percent");
                break;
        }

        # Adventure. Note that we are just attacking for skins.
        int temporaryAdvCounter = my_adventures();
        if (lowest_part == "skins") {
            adventure(1, $location[Hobopolis Town Square], "attack;");
        } else {
            adventure(1, $location[Hobopolis Town Square], "skill stuffed mortar shell; attack;");
        } 
        # increment adventures
        if (temporaryAdvCounter > my_adventures()) {
                # Our adventures decreased. Therefore this did take an adventure.
                adventure_counter = adventure_counter + 1;
            }
        # verify that the part was acquired.
        int previous_count = hobo_parts[lowest_part];
        hobo_parts = get_richard_inventory();
        int current_count = hobo_parts[lowest_part];
        # Control checkpoint. Potential reasons for not acquiring a part could be a lack of damage output or the presence of lantern effects.
        if(current_count - previous_count != 1) {
            print("Something is wrong. The following part was not acquired and it should have been:", "red");
            print(lowest_part);
            abort("Check to make sure you're not running any latern effects and that your damage output is high enough.");
        }
    }
    # Print an update on the parts.
    hobo_parts = get_richard_inventory();
    print("Current parts:");
    foreach hobo_part, quantity in hobo_parts {
        print("Richard has " + quantity + " " + hobo_part);
    }
    print("All done! Do note that this script does not make the scarehobos for you.", "green");
}