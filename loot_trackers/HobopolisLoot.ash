# prints out the quantity of each Dreadsylvanian item you have.

void print_item(item it) {
    string colour;
    if(available_amount(it) == 0) {
        colour = "red";
    } else {
        colour = "green";
    }
    print(it + ": " + available_amount(it), colour);
}

void main(boolean clearScreen) {
    if(clearScreen) {cli_execute("clear");}
    

    print("Town Square");
    print_item($item[Hobo Nickel]);
    print_item($item['WILL WORK FOR BOOZE' sign]);
    print_item($item[corncob pipe]);
    print_item($item[cup of infinite pencils]);
    print_item($item[frayed rope belt]);
    print_item($item[lucky bottlecap]);
    print_item($item[Mr. Joe's bangles]);
    print_item($item[panhandle panhandling hat]);
    print_item($item[rusty piece of rebar]);
    print();

    print_item($item[sealskin drum]);
    print_item($item[washboard shield]);
    print_item($item[spaghetti-box banjo]);
    print_item($item[marinara jug]);
    print_item($item[makeshift castanets]);
    print_item($item[left-handed melodica]);
    print();

    print_item($item[Hodgman's bow tie]);
    print_item($item[Hodgman's porkpie hat]);
    print_item($item[Hodgman's lobsterskin pants]);
    print_item($item[Hodgman's almanac]);
    print_item($item[Hodgman's lucky sock]);
    print_item($item[Hodgman's metal detector]);
    print_item($item[Hodgman's varcolac paw]);
    print_item($item[Hodgman's harmonica]);
    print_item($item[Hodgman's garbage sticker]);
    print_item($item[Hodgman's cane]);
    print_item($item[Hodgman's whackin' stick]);
    print_item($item[Hodgman's disgusting technicolor overcoat]);
    print_item($item[Hodgman's imaginary hamster]);
    print_item($item[hobo fortress blueprints]);
    print_item($item[stuffed Hodgman]);
    print();
    print_item($item[Hodgman's journal #1: The Lean Times]);
    if(have_skill($skill[Natural Born Scrabbler])) {
        print("You have Natural Born Scrabbler", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print_item($item[Hodgman's journal #2: Entrepreneurythmics]);
    if(have_skill($skill[Thrift and Grift])) {
        print("You have Thrift and Grift", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print_item($item[Hodgman's journal #3: Pumping Tin]);
    if(have_skill($skill[Abs of Tin])) {
        print("You have Abs of Tin", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print_item($item[Hodgman's journal #4: View From The Big Top]);
    if(have_skill($skill[Marginally Insane])) {
        print("You have Marginally Insane", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print();
    print_item($item[Hodgman's blanket]);
    print_item($item[tin cup of mulligan stew]);
    print();
    print();

    print("Burnbarrel Boulevard", "red");
    print("Kissin' Cousins (120 MP skill): " + available_amount($item[Kissin' Cousins]));
    if(have_skill($skill[Awesome Balls of Fire])) {
        print("You have Awesome Balls of Fire", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print("Tales from the Fireside (30 MP skill): " + available_amount($item[Tales from the Fireside]));
    if(have_skill($skill[Conjure Relaxing Campfire])) {
        print("You have Conjure Relaxing Campfire", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print("Elron's Explosive Etude: " + available_amount($item[Elron's Explosive Etude]));
    if(have_skill($skill[Elron's Explosive Etude])) {
        print("You have unlocked Elron's Explosive Etude", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print();
    print_item($item[Ol' Scratch's ash can]);
    print_item($item[Ol' Scratch's ol' britches]);
    print_item($item[Ol' Scratch's stovepipe hat]);
    print_item($item[Ol' Scratch's infernal pitchfork]);
    print_item($item[Ol' Scratch's manacles]);
    print_item($item[Ol' Scratch's stove door]);
    print();
    print_item($item[Ol' Scratch's salad fork]);
    print();
    print();

    print("Exposure Esplanade", "blue");
    print("Blizzards I Have Died In (120 MP skill): " + available_amount($item[Blizzards I Have Died In]));
    if(have_skill($skill[Snowclone])) {
        print("You have Snowclone", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print("Maxing, Relaxing (30 MP skill): " + available_amount($item[Maxing, Relaxing]));
    if(have_skill($skill[Maximum Chill])) {
        print("You have Maximum Chill", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print("Benetton's Medley of Diversity: " + available_amount($item[Benetton's Medley of Diversity]));
    if(have_skill($skill[Benetton's Medley of Diversity])) {
        print("You have unlocked Benetton's Medley of Diversity", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print();
    print_item($item[Frosty's carrot]);
    print_item($item[Frosty's nailbat]);
    print_item($item[Frosty's old silk hat]);
    print_item($item[Frosty's arm]);
    print_item($item[Frosty's iceball]);
    print_item($item[Frosty's snowball sack]);
    print();
    print_item($item[Frosty's frosty mug]);
    print();
    print();
    

    print("Ancient Hobo Burial Ground", "gray");
    print("Let Me Be! (120 MP skill): " + available_amount($item[Let Me Be!]));
    if(have_skill($skill[Raise Backup Dancer])) {
        print("You have Raise Backup Dancer", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print("Asleep in the Cemetery (30 MP skill): " + available_amount($item[Asleep in the Cemetery]));
    if(have_skill($skill[Creepy Lullaby])) {
        print("You have Creepy Lullaby", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print("Prelude of Precision: " + available_amount($item[Prelude of Precision]));
    if(have_skill($skill[Prelude of Precision])) {
        print("You have unlocked Prelude of Precision", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print();
    print_item($item[Zombo's grievous greaves]);
    print_item($item[Zombo's shield]);
    print_item($item[Zombo's skullcap]);
    print_item($item[Zombo's empty eye]);
    print_item($item[Zombo's shoulder blade]);
    print_item($item[Zombo's skull ring]);
    print();
    print_item($item[voodoo snuff]);
    print();
    print();

    print("Purple Light District", "purple");
    print("Summer Nights (120 MP skill): " + available_amount($item[Summer Nights]));
    if(have_skill($skill[Grease Lightning])) {
        print("You have Grease Lightning", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print("Sensual Massage for Creeps (30 MP skill): " + available_amount($item[Sensual Massage for Creeps]));
    if(have_skill($skill[Inappropriate Backrub])) {
        print("You have Inappropriate Backrub", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print("Chorale of Companionship: " + available_amount($item[Chorale of Companionship]));
    if(have_skill($skill[Chorale of Companionship])) {
        print("You have unlocked Chorale of Companionship", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print();
    print_item($item[Chester's bag of candy]);
    print_item($item[Chester's cutoffs]);
    print_item($item[Chester's moustache]);
    print_item($item[Chester's Aquarius medallion]);
    print_item($item[Chester's muscle shirt]);
    print_item($item[Chester's sunglasses]);
    print();
    print_item($item[extra-greasy slider]);
    print();
    print();

    print("The Heap", "green");
    print("Biddy Cracker's Old-Fashioned Cookbook (120 MP skill): " + available_amount($item[Biddy Cracker's Old-Fashioned Cookbook]));
    if(have_skill($skill[Eggsplosion])) {
        print("You have Eggsplosion", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print("Travels with Jerry (30 MP skill): " + available_amount($item[Travels with Jerry]));
    if(have_skill($skill[Mudbath])) {
        print("You have Mudbath", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print("The Ballad of Richie Thingfinder: " + available_amount($item[The Ballad of Richie Thingfinder]));
    if(have_skill($skill[The Ballad of Richie Thingfinder])) {
        print("You have unlocked The Ballad of Richie Thingfinder", "blue");
    } else {
        print("You have not unlocked this skill", "red");
    }
    print();
    print_item($item[Oscus's dumpster waders]);
    print_item($item[Oscus's pelt]);
    print_item($item[Wand of Oscus]);
    print_item($item[Oscus's flypaper pants]);
    print_item($item[Oscus's garbage can lid]);
    print_item($item[3393]);
    print();
    print_item($item[fermented pickle juice]);
    print();
    print();
}