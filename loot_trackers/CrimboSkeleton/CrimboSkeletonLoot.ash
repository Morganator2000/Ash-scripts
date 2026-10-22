# Track the relevant loot from the Skeleton of Crimbo Past
# TODO today's item and knucklebone cost

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

void print_familiar(string fam_name) {
    familiar fam = to_familiar(fam_name);
    if(have_familiar(fam)) {
        print("You have the " + fam_name + " familiar", "green");
    } else {
        print("You do not have the " + fam_name + " familiar", "red");
    }
}

void print_skill(string skill_name) {
    skill skl = to_skill(skill_name);
    if(have_skill(skl)) {
        print("You have " + skill_name, "blue");
    } else {
        print("You have not unlocked " + skill_name, "red");
    }
}

void main() {
    cli_execute("clear");
    print_html("<font size=6><font color=000000>Very Useful Items</font></font>");
    print_item("BittyCar HotCar");
    print_item("candy egg deviler");
    print_item("ChibiBuddy™ (off)");
    print_item("ChibiBuddy™ (on)");
    print_item("deluxe fax machine");
    int [item] lounge = get_clan_lounge();
    if ((lounge[$item[deluxe fax machine]] > 0)) {
        print("Your clan has a Fax Machine", "green");
    } else {
        print("Your clan does not have a Fax Machine", "red");
    }
    print_item("Jackass Plumber home game");
    print_item("Lil' Snowball Factory");
    print_item("portable steam unit");
    print_item("tiny plastic sword");
    print_item("Trivial Avocations board game");
    print();

    print();
    print_html("<font size=6><font color=000000>Items that get other items from previous years</font></font>");
    print_item("dusty Crimbo crate");
    # TODO maybe make a loot checker for 2005-2007?
    print_item("sturdy Crimbo crate");
    # TODO maybe make a loot checker for 2005-2007?
    print_item("warbear requisition box");
    # TODO maybe make a loot checker for 2013?
    print_item("warehouse key");
    # TODO maybe make a loot checker for 2018?
    print_item("Crimbuccaneer premium booty sack");
    print("Run CrimboLoot2023 to see if you need any more booty sacs.", "purple");
    print_item("Elf Guard honor present");
    print("Run CrimboLoot2023 to see if you need any more honor presents.", "purple");
    
    print();
    print_html("<font size=6><font color=000000>Skillbooks</font></font>");
    print_item('A Crimbo Carol, Ch. 1');
    print_item('A Crimbo Carol, Ch. 1 (used)');
    print_skill("Holiday Weight Gain");
    print_item('A Crimbo Carol, Ch. 2');
    print_item('A Crimbo Carol, Ch. 2 (used)');
    print_skill("Jingle Bells");
    print_item('A Crimbo Carol, Ch. 3');
    print_item('A Crimbo Carol, Ch. 3 (used)');
    print_skill("Candyblast");
    print_item('A Crimbo Carol, Ch. 4');
    print_item('A Crimbo Carol, Ch. 4 (used)');
    print_skill("Surge of Icing");
    print_item('A Crimbo Carol, Ch. 5');
    print_item('A Crimbo Carol, Ch. 5 (used)');
    print_skill("Stealth Mistletoe");
    print_item('A Crimbo Carol, Ch. 6');
    print_item('A Crimbo Carol, Ch. 6 (used)');
    print_skill("Cringle's Curative Carol");
    print_item("Carol of the Bulls");
    print_skill("Carol of the Bulls");
    print_item("Carol of the Hells");
    print_skill("Carol of the Hells");
    print_item("Carol of the Thrills");
    print_skill("Carol of the Thrills");
    print_item("CRIMBCO Employee Handbook (chapter 1)");
    print_item("CRIMBCO Employee Handbook (chapter 1) (used)");
    print_skill("Fashionably Late");
    print_item("CRIMBCO Employee Handbook (chapter 2)");
    print_item("CRIMBCO Employee Handbook (chapter 2) (used)");
    print_skill("Executive Narcolepsy");
    print_item("CRIMBCO Employee Handbook (chapter 3)");
    print_item("CRIMBCO Employee Handbook (chapter 3) (used)");
    print_skill("Lunch Break");
    print_item("CRIMBCO Employee Handbook (chapter 4)");
    print_item("CRIMBCO Employee Handbook (chapter 4) (used)");
    print_skill("Offensive Joke");
    print_item("CRIMBCO Employee Handbook (chapter 5)");
    print_item("CRIMBCO Employee Handbook (chapter 5) (used)");
    print_skill("Managerial Manipulation");
    print_item("Crimbot ROM: Mathematical Precision");
    print_item("Crimbot ROM: Mathematical Precision (dirty)");
    print_skill("Mathematical Precision");
    print_item("Crimbot ROM: Rapid Prototyping");
    print_item("Crimbot ROM: Rapid Prototyping (dirty)");
    print_skill("Rapid Prototyping");
    print_item("Crimbot ROM: Ruthless Efficiency");
    print_item("Crimbot ROM: Ruthless Efficiency (dirty)");
    print_skill("Ruthless Efficiency");
    print_item("Rethinking Candy");
    print_skill("Sweet Synthesis");
    print_item("The Big Book of Communism");
    print_item("The Big Book of Communism (used)");
    print_skill("Communism!");
    print_item("The Journal of Mime Science Vol. 1");
    print_item("The Journal of Mime Science Vol. 1 (used)");
    print_skill("Silent Hunter");
    print_item("The Journal of Mime Science Vol. 2");
    print_item("The Journal of Mime Science Vol. 2 (used)");
    print_skill("Quiet Determination");
    print_item("The Journal of Mime Science Vol. 3");
    print_item("The Journal of Mime Science Vol. 3 (used)");
    print_skill("Quiet Judgement");
    print_item("The Journal of Mime Science Vol. 4");
    print_item("The Journal of Mime Science Vol. 4 (used)");
    print_skill("Silent Treatment");
    print_item("The Journal of Mime Science Vol. 5");
    print_item("The Journal of Mime Science Vol. 5 (used)");
    print_skill("Silent Knife");
    print_item("The Journal of Mime Science Vol. 6");
    print_item("The Journal of Mime Science Vol. 6 (used)");
    print_skill("Quiet Desperation");

    print();
    print_html("<font size=6><font color=000000>Outfit Pieces</font></font>");
    print_item("antique nutcracker beard");
    print_item("antique nutcracker boots");
    print_item("antique nutcracker cape");
    print_item("antique nutcracker drumstick");
    print_item("antique nutcracker epaulets");
    print_item("antique nutcracker hat");
    print_item("antique nutcracker pants");
    print_item("antique nutcracker sword");
    print_item("antique nutcracker waistcoat");
    print();
    print_item("biomechanical crimborg helmet");
    print_item("biomechanical crimborg leg armor");
    print_item("C.B.F.G.");
    print();
    print_item("cheerful Crimbo sweater");
    print_item("cheerful pajama pants");
    print("As of 2026-10-22, the antler hat has not been sold by the skeleton");
    print();
    print_item("electronic dulcimer pants");
    print("As of 2026-10-22, the brainwave-controlled unicorn horn and Frown Exerciser have not been sold by the skeleton");
    print();
    print_item("paperclip");
    print_item("paperclip-on tie");
    print_item("paperclip cape");
    print_item("paperclip pants");
    print_item("paperclip turban");
    print();
    print_item("snow belly");
    print_item("snow hat");
    print_item("snow pants");
    print();
    print_item("sucker hakama");
    print_item("sucker kabuto");
    print_item("sucker tachi");

    print();
    print_html("<font size=6><font color=000000>Familiars</font></font>");
    print_item("deactivated mini-Trainbot");
    print_familiar("Mini-Trainbot");
    print_item("festive egg sac");
    print_familiar("Arachnelf");
    print_item("Hanukkimbo dreidl");
    print_familiar("Hanukkimbo dreidl");
    print_item("Mini-Crimbot crate");
    print_familiar("Mini-Crimbot");
    print_item("pet anchor");
    print_familiar("pet anchor");
    print_item("pet bad vibe");
    print_familiar("bad vibe");
    print_item("robotronic egg");
    print_item("deactivated RoboGoose");
    print_familiar("RoboGoose");
    print_item("Tickle-Me Emilio");
    print_familiar("Tickle-Me Emilio");
    print_item("yule pup");
    print_familiar("yule hound");
    
    print();
    print_html("<font size=6><font color=000000>Not as useful equipment</font></font>");
    print_item("cheap elven gloves");
    print_item("Crimbuccaneer squirtblunderbuss");
    print_item("crystal belt buckle");
    print_item("cyborg stompin' boot");
    print_item("depleted Crimbonium football helmet");
    print_item("Elf Guard safety bear");
    print_item("Elf Guard squirtgun");
    print_item("elven socks");
    print_item("elven tambourine");
    print_item("golden fleece");
    print_item("iron chain");
    print("This is used to make the pine cone necklace", "purple");
    print_item("miniature goose mask");
    print_item("nylon Christmas stockings");
    print_item("penguin thesaurus");
    print_item("peppermint-scented socks");
    print_item("pine cone");
    print("This is used to make the pine cone necklace", "purple");
    print_item("Pine Cone Necklace");
    print_item("reindeer hammer");
    print_item("roboduck-on-a-string");
    print_item("saffron antaravasaka");
    print_item("Satan hat");
    print_item("stuffed kraken");
    print_item("tinsel orb");

    print();
    print_html("<font size=6><font color=000000>Not as useful consumables</font></font>");
    print_item('"caramel" orange');
    print_item("aspirin");
    print_item("augmented-reality shades");
    print_item("bark rootbeer");
    print_item("barrel-aged eggnog");
    print_item("battered Crimbo Crate");
    print_item("bottle of bubbles");
    print_item("bottle of Crimbognac");
    print_item("bubble-wrap simulator");
    print_item("cloning kit");
    print_item("clovermint");
    print_item("Crimbeau de toilette");
    print_item("Crimbo Factory surprise box");
    print_item("Crimbo salad");
    print_item("Crimboysters Rockefeller");
    print_item("drive-thru burger");
    print_item("elven moonshine");
    print_item("fitness wristband");
    print_item("Fuzzby");
    print_item("industrially-crushed ice");
    print_item("laser-broiled pear");
    print_item("lucky napkin"); #debatable
    print_item("portable photocopier"); # also debatable
    print_item("steamed oyster");
    print_item("stuffed doppelshifter");
    print_item("stuffed gray blob");
    print_item("Uncle Greenspan's Bathroom Finance Guide");

    print(get_clan_lounge());
}