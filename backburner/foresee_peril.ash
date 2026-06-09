# TODO, everything
void main() {
    # get list of clan members
    visit_url("clan_members.php");
    # counter for foretelling
    int successful_foretells = 0;
    while (successful_foretells < 3) {
        visit_url("inventory.php?pwd&action=foresee");
        # pick a player from the list randomly
        # if successful (because they are in aftercore), increment the counter
        # Whether successful or not, remove them from the list.
    }
}


    choice.php?pwd&whichchoice=1558&option=1&who=Jtoner