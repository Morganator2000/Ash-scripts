# get list of clan members
string [int] get_clan_member_names(string roster_html) {
    string [int] member_names;
    int index = 0;

    # So this is a complicated pattern. We're checking for player names and the possible "(inactive)" tag.
    matcher player_matcher = create_matcher("href=\"showplayer\\.php\\?who=\\d+\">(.*?)</a>(?:<font color=gray><b>\\s*\\(inactive\\)</b>)?", roster_html);

    while (player_matcher.find()) {
        string name = to_lower_case(player_matcher.group(1));
        # Skip if they are inactive
        if (contains_text(player_matcher.group(0), "(inactive)")) {
            continue;
        }
        # Skip yourself
        if (name == to_lower_case(my_name())) {
            continue;
        }
        member_names[index] = name;
        index += 1;
    }

    return member_names;
}

void main() {
    if(item_amount($item[Peridot of Peril]) < 1) {
        abort("You don't have a Peridot of Peril.");
    }
    # get list of clan members
    string clan_html = visit_url("clan_members.php");
    string [int] member_list = get_clan_member_names(clan_html);

    # temporary display of names of clan members
    // print("Found " + count(member_list) + " clan members:", "blue");
    // foreach index in member_list {
    //     # print(name);
    //     print(member_list[index]);
    // }

    # Now let's use the Peridot of Peril
    string foresee_html = visit_url("inventory.php?pwd&action=foresee");
    int foretells_remaining = 0;
    if(contains_text(foresee_html, "You've already foreseen enough peril today.")) {
        abort("That's enough peril for one day (out of uses).");
    } else {
        matcher foretell_matcher = create_matcher("peril (\\d+) more time", foresee_html);
        if (foretell_matcher.find()) {
            foretells_remaining = to_int(foretell_matcher.group(1));
        }
    }

    while (foretells_remaining > 0 && count(member_list) > 0) {
        int list_size = count(member_list);
        # pick a player from the list randomly
        int player_index = 0;
        # Deal with mafia's random() abort if only 1 player is left
        if (list_size > 1) {
            player_index = random(list_size);
        }
        string player = member_list[player_index];
        print("Foreseeing peril for " + player, "orange");
        string response = visit_url("choice.php?pwd&whichchoice=1558&option=1&who=" + player);
        matcher ronin_matcher = create_matcher("That player is already suffering the peril of hardcore or ronin", response);
        if (ronin_matcher.find()) {
            # Do not decrement foretells
            print("Let's try that again", "orange");
        } else {
            print(player + " was in fact in peril, hopefully that item will help", "green");
            foretells_remaining -= 1;
        }
        # Whether successful or not, remove them from the list.
        int last_index = list_size - 1;
        member_list[player_index] = member_list[last_index];
        remove member_list[last_index];
    }
}