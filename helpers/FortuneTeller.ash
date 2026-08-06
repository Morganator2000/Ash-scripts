# Script to be used on logout that automatically tells the fortune of another player.
# it also sends a message with what they should reply with.

# get list of clan members that can have their fortune told.
# because of the way the fortune command works, I may need to return player IDs instead of names.
string [int] get_clan_member_names(string roster_html) {
    string [int] member_names;
    int index = 0;

    # TODO do I need them to be in aftercore?
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
        string id = get_player_id(name);
        member_names[index] = id;
        index += 1;
    }

    return member_names;
}

# Add some randomness to the messages so I don't seem like a bot.
string make_kmail_message() {
    string [int] intro_messages {
        "I just sent you a fortune request.",
        "Did you see the fortune request I sent?",
        "You should have just received a fortune from Madame Zatara.",
        "You got a fortune from me yeah?",
        "You know the fortune I sent you?"
    };
    string [int] polite_asks {
        "Please make your answers %s.",
        "Could you please reply with %s?",
        "It would be a big help if you could respond with %s.",
        "Would you be able to write back %s?",
        "Please set your answers as %s.",
        "Mind answering with %s?",
        "Can you please pick %s?"
    };
    string [int] outro_messages {
       "to maximize compatibility",
       "to give the best compatibility",
       "to give the best rewards",
       "for the best results",
       "for the highest compatibility",
       "to give the best odds of a good result"
    };

    int intro_idx = random(count(intro_messages));
    int politeness_idx = random(count(polite_asks));
    int outro_idx = random(count(outro_messages));
    string chosen_intro = intro_messages[intro_idx];
    string chosen_politeness = polite_asks[politeness_idx];
    string important_part = "'pizza', 'batman', and 'thin' ";
    string chosen_outro = outro_messages[outro_idx];

    string ending = important_part + chosen_outro;
    matcher s_matcher = create_matcher("%s", chosen_politeness);

    string second_sentence = replace_first(s_matcher, ending);

    string full_message = chosen_intro + " " + second_sentence;
    return full_message;
}

void main() {
    int fortunes_remaining = 0;
    # get number of fortune uses remaining. Ugh, pattern matching.
    string fortune_html = visit_url("clan_viplounge.php?preaction=lovetester");
    matcher fortune_matcher = create_matcher("relationship with a clanmate (\\d+) time", fortune_html);
    if (fortune_matcher.find()) {
        fortunes_remaining = to_int(fortune_matcher.group(1));
        print(fortunes_remaining);
    }
    if (fortunes_remaining == 0) {
        abort("No more fortunes can be told today.");
    }

    # get list of clan members
    string clan_html = visit_url("clan_members.php");
    string [int] member_list = get_clan_member_names(clan_html);

    if (length(member_list) == 0) {
        abort("How unfortunate, there are no members you can check compatibility with.");
    }

    while (fortunes_remaining > 0 && count(member_list) > 0) {
        # Pick a random clan member
        int list_size = count(member_list);
        int player_index = random(list_size);
        string player_id = member_list[player_index];
        string player_name = get_player_name(to_int(player_id));

        # Create request
        string fortune_request = "choice.php?pwd&whichchoice=1278&option=1&which=1&whichid=" + player_id + "&q1=pizza&q2=batman&q3=thick";
        string fortune_response = visit_url(fortune_request);
        if(contains_text(fortune_response, "You're already waiting on your results with")) {
            print("A previous fortune is still in progress", "orange");
        } else {
            # Send fortune and message
            print("Sent fortune request to " + player_name, "blue");
            string kmail_message = make_kmail_message();
            string message_command = "send to " + player_id + " " + kmail_message;
            # TODO so this part isn't working.
            cli_execute(message_command);
            fortunes_remaining -= 1;
        }
        # Either way, they are removed from the list. What this is doing is 
        # copying whoever is last in the list with whoever you just attempted
        # (overwriting them), then removing the last name from the list, 
        # effectively removing the person you just attempted without messing
        # with the mapping.
        int last_index = list_size - 1;
        member_list[player_index] = member_list[last_index];
        remove member_list[last_index];
    }
}