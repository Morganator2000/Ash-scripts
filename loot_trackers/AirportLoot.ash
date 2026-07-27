# Checks progress on all the interesting loot that can be found at the 
# Elemental Airport locations.

void print_item(string it) {
    item thing = to_item(it);
    string colour;
    if(available_amount(thing) == 0) {
        colour = "black";
    } else {
        colour = "green";
    }
    print(it + ": " + available_amount(thing), colour);
}

void main(){
    cli_execute("clear");
    print("Please note, this is not a comprehensive list of items, just the ones that are harder to acquire.");
    print_html("<font size=6><font color=000000>Currencies</font></font>");
    print("Coins-spiracy: " + available_amount($item[Coinspiracy]), "gray");
    print("Fun Funds: " + available_amount($item[Fun Funds]), "green");
    print("Wal-Mart gift certificates: " + available_amount($item[Wal-Mart gift certificate]), "blue");
    print("Beach Bucks: " + available_amount($item[Beach Buck]), "purple");
    print("Volcoinos: " + available_amount($item[Volcoino]), "red");
    print();

    print_html("<font size=6><font color=808080>Conspiracy Island</font></font>");
    print("Deep Dark Jungle", "gray");
    print_item("Pair of Plants");
    print_item("Sasq™ watch");
    print_item("Smoker's Cloak");
    print();
    print("Armory", "gray");
    if(have_skill($skill[Hypersane])) {
        print("You have the skill Hypersane", "green");
    } else {
        print_item($item[Merc Core Field Manual: Sanity Maintenance]);
    }
    if(have_skill($skill[Intimidating Mien])) {
        print("You have the skill Intimidating Mien", "green");
    } else {
        print_item($item[Merc Core Field Manual: Intimidation Techniques]);
    }
    print();


    print_html("<font size=6><font color=008000>Dinseylandfill</font></font>");
    print("Keycards", "lime");
    print_item("keycard α");
    print_item("keycard β");
    print_item("keycard γ");
    print_item("keycard δ");
    print();

    print("Uncle Gator's Country", "lime");
    print_item("backwoods banjo");
    print_item("fake washboard");
    print_item("ratskin pajama pants");
    print();

    print("Toxic Teacups", "lime");
    print_item("toxic globule");
    print_item("isotophat");
    print_item("Three Mile Island shorts");
    print_item("toxic mop");
    if(in_terrarium($familiar[Sludgepuppy]) || have_familiar($familiar[Sludgepuppy])) {
        print("You have a Sludgepuppy familiar", "green");
    } else {
        print_item("inert sludgepuppy");
    }
    print();

    print("The Dinsey Company Store", "lime");
    print_item("stinky fannypack");
    print_item("garbage sticker");
    print_item("hazmat helmet");
    if(have_skill($skill[Olfactory Burnout])) {
        print("You have the skill Olfactory Burnout", "green");
    } else {
        print_item($item[Scratch-and-Sniff Guide to Dinseylandfill]);
    }
    if(have_skill($skill[Garbage Nova])) {
        print("You have the skill Garbage Nova", "green");
    } else {
        print_item($item[Trash, a Memoir]);
    }
    if(have_skill($skill[Dinsey Operations Expert])) {
        print("You have the skill Dinsey Operations Expert", "green");
    } else {
        print_item($item[Dinsey Maintenance Manual]);
    }
    print();

    print("Wart Dinsey", "lime");
    print_item("brain preservation fluid");
    if(have_skill($skill[Rotten Memories])) {
        print("You have the skill Rotten Memories", "green");
    } else {
        print_item($item[Wart Dinsey: An Afterlife]);
    }
    print_item("Dinsey's oculus");
    print_item("Dinsey's radar dish");
    print_item("Dinsey's pizza cutter");
    print_item("Dinsey's brain");
    print_item("Dinsey's pants");
    print_item("Dinsey's glove");
    print();


    print_html("<font size=6><font color=00FFFF>The Glaciest</font></font>");
    print("Ice Hotel", "aqua");
    if(have_skill($skill[Perfect Freeze])) {
        print("You have the skill Perfect Freeze", "green");
    } else {
        print_item($item[The Fun-Guy Cold Weather Bartender's Guide]);
    }
    print();

    print("VYKEA", "aqua");
    print_item("VYKEA instructions");
    print_item("VYKEA hex key");
    print_item("VYKEA bracket");
    print_item("VYKEA dowel");
    print_item("VYKEA plank");
    print_item("VYKEA rail");
    print_item("VYKEA lightning rune");
    print_item("VYKEA blood rune");
    print_item("VYKEA frenzy rune");
    print();

    print("Ice Hole", "aqua");
    print_item("octolus-skin cloak");
    print_item("norwhal helmet");
    print_item("sardine can key");
    print();

    print("Wal-Mart", "aqua");
    print_item("Wal-Mart snowglobe");
    print_item("Wal-Mart nametag");
    print_item("Wal-Mart overalls");
    if(have_skill($skill[Refusal to Freeze])) {
        print("You have the skill Refusal to Freeze", "green");
    } else {
        print_item($item[To Build an Igloo]);
    }
    if(have_skill($skill[Beardfreeze])) {
        print("You have the skill Beardfreeze", "green");
    } else {
        print_item($item[The Chill of the Wild]);
    }
    if(have_skill($skill[Frost Bite])) {
        print("You have the skill Frost Bite", "green");
    } else {
        print_item($item[Cold Fang]);
    }
    print();


    print_html("<font size=6><font color=800080>Spring Break Beach</font></font>");
    print("Sloppy Seconds Diner", "purple");
    print_item("possessed sugar cube");
    print_item("sweet tooth");
    print();

    print("Buff Jimmy's Souvenir Shop", "purple");
    print_item("Brogre brolo shirt");
    print_item("Brogre brorts");
    print_item("Brogre bucket hat");
    if(have_skill($skill[Unoffendable])) {
        print("You have the skill Unoffendable", "green");
    } else {
        print_item($item[History's Most Offensive Jokes, Vol. IX]);
    }
    if(have_skill($skill[Grease Up])) {
        print("You have the skill Grease Up", "green");
    } else {
        print_item($item[Now You're Cooking With Grease]);
    }
    if(have_skill($skill[Sloppy Secrets])) {
        print("You have the skill Sloppy Secrets", "green");
    } else {
        print_item($item[Sloppy Seconds Diner Employee Handbook]);
    }
    print();


    print_html("<font size=6><font color=FF0000>That 70s Volcano</font></font>");
    print("Bubblin' Caldera", "red");
    print_item("basaltamander buckler");
    print_item("lavalarva");
    print_item("lava balaclava");
    print_item("Lavalos's shell");
    print();

    print("LavaCo Factory", "red");
    print_item("red LavaCo Lamp™");
    print_item("blue LavaCo Lamp™");
    print_item("green LavaCo Lamp™");
    print_item("Mr. Cheeng's spectacles");
    print();

    print("SMOOCH Army HQ", "red");
    print_item("love");
    print_item("Pener's drumstick");
    print_item("little deuce cape");
    print_item("Heat-resistant sheet metal");
    print_item("superheated metal");
    print_item("SMOOCH bracers");
    print_item("SMOOCH kneepads");
    print_item("SMOOCH spaulders");
    print_item("SMOOCH codpiece");
    print_item("SMOOCH breastplate");
    print();

    print("The Velvet Gold Mine", "red");
    print_item("unsmoothed velvet");
    print_item("1970 carat gold");
    print();

    print("Towering Inferno Discotheque", "red");
    print_item("grease cannon");
    print_item("biker's hat");
    print_item("feathered headdress");
    print_item("electrician's hardhat");
    if(have_skill($skill[Asbestos Heart])) {
        print("You have the skill Asbestos Heart", "green");
    } else {
        print_item($item[Lava Miner's Daughter]);
    }
    if(have_skill($skill[Pyromania])) {
        print("You have the skill Pyromania", "green");
    } else {
        print_item($item[Psycho From The Heat]);
    }
    if(have_skill($skill[Firegate])) {
        print("You have the skill Firegate", "green");
    } else {
        print_item($item[The Firegate Tapes]);
    }
}