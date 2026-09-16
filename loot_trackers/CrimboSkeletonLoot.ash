# Track the relevant loot from the Skeleton of Crimbo Past

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

void main() {
    cli_execute("clear");

    print("Very Useful Items", "blue");
    print_item('A Crimbo Carol, Ch. 1');
    print_item('A Crimbo Carol, Ch. 1 (used)');
    if(have_skill($skill[Holiday Weight Gain])) {
        print("You have Natural Born Scrabbler", "blue");
    } else {
        print("You have not unlocked Holiday Weight Gain", "red");
    }
    print();
    print_item('A Crimbo Carol, Ch. 2');
    print_item('A Crimbo Carol, Ch. 2 (used)');
    if(have_skill($skill[Jingle Bells])) {
        print("You have Jingle Bells", "blue");
    } else {
        print("You have not unlocked Jingle Bells", "red");
    }
    print();
    print_item('A Crimbo Carol, Ch. 3');
    print_item('A Crimbo Carol, Ch. 3 (used)');
    if(have_skill($skill[Candyblast])) {
        print("You have Candyblast", "blue");
    } else {
        print("You have not unlocked Candyblast", "red");
    }
    print();
    print_item('A Crimbo Carol, Ch. 4');
    print_item('A Crimbo Carol, Ch. 4 (used)');
    if(have_skill($skill[Surge of Icing])) {
        print("You have Surge of Icing", "blue");
    } else {
        print("You have not unlocked Surge of Icing", "red");
    }
    print();
    print_item('A Crimbo Carol, Ch. 5');
    print_item('A Crimbo Carol, Ch. 5 (used)');
    if(have_skill($skill[Stealth Mistletoe])) {
        print("You have Stealth Mistletoe", "blue");
    } else {
        print("You have not unlocked Stealth Mistletoe", "red");
    }
    print();
    print_item('A Crimbo Carol, Ch. 6');
    print_item('A Crimbo Carol, Ch. 6 (used)');
    if(have_skill($skill[Cringle's Curative Carol])) {
        print("You have Cringle's Curative Carol", "blue");
    } else {
        print("You have not unlocked Cringle's Curative Carol", "red");
    }
    print_item("BittyCar HotCar");
    print_item("candy egg deviler");
    print_item("Carol of the Bulls");
    if(have_skill($skill[Carol of the Bulls])) {
        print("You have Carol of the Bulls", "blue");
    } else {
        print("You have not unlocked Carol of the Bulls", "red");
    }
    print_item("Carol of the Hells");
    if(have_skill($skill[Carol of the Hells])) {
        print("You have Carol of the Hells", "blue");
    } else {
        print("You have not unlocked Carol of the Hells", "red");
    }
    print_item("Carol of the Thrills");
    if(have_skill($skill[Carol of the Thrills])) {
        print("You have Carol of the Thrills", "blue");
    } else {
        print("You have not unlocked Carol of the Thrills", "red");
    }
    print();
    print_item("ChibiBuddy™ (off)");
    print_item("ChibiBuddy™ (on)");
    print();
    print_item("CRIMBCO Employee Handbook (chapter 1)");
    print_item("CRIMBCO Employee Handbook (chapter 1) (used)");
    if(have_skill($skill[Fashionably Late])) {
        print("You have Fashionably Late", "blue");
    } else {
        print("You have not unlocked Fashionably Late", "red");
    }
    print();
    print_item("CRIMBCO Employee Handbook (chapter 2)");
    print_item("CRIMBCO Employee Handbook (chapter 2) (used)");
    if(have_skill($skill[Executive Narcolepsy])) {
        print("You have Executive Narcolepsy", "blue");
    } else {
        print("You have not unlocked Executive Narcolepsy", "red");
    }
    print();
    print_item("CRIMBCO Employee Handbook (chapter 3)");
    print_item("CRIMBCO Employee Handbook (chapter 3) (used)");
    if(have_skill($skill[Lunch Break])) {
        print("You have Lunch Break", "blue");
    } else {
        print("You have not unlocked Lunch Break", "red");
    }
    print();
    print_item("CRIMBCO Employee Handbook (chapter 4)");
    print_item("CRIMBCO Employee Handbook (chapter 4) (used)");
    if(have_skill($skill[Offensive Joke])) {
        print("You have Offensive Joke", "blue");
    } else {
        print("You have not unlocked Offensive Joke", "red");
    }
    print();
    print_item("CRIMBCO Employee Handbook (chapter 5)");
    print_item("CRIMBCO Employee Handbook (chapter 5) (used)");
    if(have_skill($skill[Managerial Manipulation])) {
        print("You have Managerial Manipulation", "blue");
    } else {
        print("You have not unlocked Managerial Manipulation", "red");
    }

    print();
    print_item("Crimbot ROM: Mathematical Precision");
    print_item("Crimbot ROM: Mathematical Precision (dirty)");
    if(have_skill($skill[Mathematical Precision])) {
        print("You have Mathematical Precision", "blue");
    } else {
        print("You have not unlocked Mathematical Precision", "red");
    }
    print();
    print_item("Crimbot ROM: Rapid Prototyping");
    print_item("Crimbot ROM: Rapid Prototyping (dirty)");
    if(have_skill($skill[Rapid Prototyping])) {
        print("You have Rapid Prototyping", "blue");
    } else {
        print("You have not unlocked Rapid Prototyping", "red");
    }
    print();
    print_item("Crimbot ROM: Ruthless Efficiency");
    print_item("Crimbot ROM: Ruthless Efficiency (dirty)");
    if(have_skill($skill[Ruthless Efficiency])) {
        print("You have Ruthless Efficiency", "blue");
    } else {
        print("You have not unlocked Ruthless Efficiency", "red");
    }
    print();
    print_item("Crimbuccaneer premium booty sack");
    print("Run CrimboLoot2023 to see if you need any more booty sacs.")
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print();


    print();
    print("Outfit Pieces", "blue");
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
    print_item("cheerful antler hat");
    print("As of 2026-08-09, the antler hat has not been sold by the skeleton");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");


    print();
    print("Not as useful equipment", "blue");
    print_item("cheap elven gloves");
    print_item("");
    print_item("");
    print_item("");
    print_item("");


    print();
    print("Not as useful consumables", "blue");
    print_item('"caramel" orange');
    print_item("Asprin");
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
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
    print_item("");
}