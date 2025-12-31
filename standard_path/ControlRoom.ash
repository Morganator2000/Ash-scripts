# open the lower chamber during the MacGuffin quest

void rotate_chamber() {
    if (item_amount($item[Crumbling Wooden Wheel]) > 0) {
        visit_url("choice.php?whichchoice=929&option=1&pwd");
    } else if (item_amount($item[Tomb Ratchet]) > 0) {
        visit_url("choice.php?whichchoice=929&option=2&pwd");
    } else {
        abort("Something's really wrong here. You shouldn't have got to this point without a wheel/ratchet.")
    }
}

void main () {
    # Check that you have enough ratchets/wheels
    int ratchets = item_amount($item[Tomb Ratchet]);
    int wheels = item_amount($item[Crumbling Wooden Wheel]);
    if(ratchets + wheels < 10) {
        print("You have " + ratchets + " tomb ratchets.");
        print("You have " + wheels + " crumbling wooden wheels.");
        abort("You do not have enough ratchets/wheels.");
    }

    # Check that you have enough adventures
    if (my_adventures() < 3) {
        abort("You need at least 3 adventures remaining to run this script.");
    }
    
    # Get ancient bronze token
    visit_url("place.php?whichplace=pyramid&action=pyramid_control");
    rotate_chamber();
    rotate_chamber();
    rotate_chamber();
    visit_url("place.php?whichplace=pyramid&action=pyramid_state4");

    # Get bomb
    visit_url("place.php?whichplace=pyramid&action=pyramid_control");
    rotate_chamber();
    rotate_chamber();
    rotate_chamber();
    rotate_chamber();
    visit_url("place.php?whichplace=pyramid&action=pyramid_state3");

    # detonate bomb
    visit_url("place.php?whichplace=pyramid&action=pyramid_control");
    rotate_chamber();
    rotate_chamber();
    rotate_chamber();
    visit_url("place.php?whichplace=pyramid&action=pyramid_state1");

    cli_execute("maximize mainstat");
    print("Lower Chamber has been uncovered! Ready to fight Ed?");
}