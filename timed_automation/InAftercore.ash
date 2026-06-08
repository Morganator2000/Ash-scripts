# Things I need to set up after the king is no longer imprismed.
void use_item(item thing) {
    if (item_amount(thing) >= 1) {
        use(thing);
    }
}

void main (boolean longterm) {
    # Take everything from Hagnk
    cli_execute("pull all");
    # Set up cold medicine cabinet
    use_item($item[Cold Medicine Cabinet]);
    # Reverse the backup camera
    cli_execute("backupcamera reverse on");
    # Set leprecondo furniture
    # TODO I need an aftercore setup
    cli_execute("condo fully-stocked wet bar, fruit-smashing robot, padded weight bench, internet connected laptop");
    # Get skills from books
    use_item($item[The Big Book of Communism (used)]);
    use_item($item[The Encyclopedia of Fruit (used)]);
    use_item($item[Elf Guard Field Manual: Culinary Arts (used)]);
    use_item($item[Elf Guard Field Manual: Extortion (used)]);
    use_item($item[Elf Guard Field Manual: Wilderness Sleeping (used)]);
    # use_item($item[Shanty: Only Dogs Love Drunken Sailors (used)]);
    # cli_execute("run Great_sell_off");
    # Open gifts
    if (item_amount($item[plain brown wrapper]) >= 1) {
        cli_execute("use * plain brown wrapper");
    }

    if (item_amount($item[dreadful box]) >= 1) {
        cli_execute("use * dreadful box");
    }

    if (item_amount($item[Bindle of joy]) >= 1) {
        cli_execute("use * Bindle of joy");
    }

    if (item_amount($item[Moist sack]) >= 1) {
        cli_execute("use * Moist sack");
    }

    # get a clockwork maid setup if long term is true
    if(!(get_campground() contains $item[clockwork maid]) && longterm) {
        if(item_amount($item[clockwork maid]) < 1) {
            buy($item[clockwork maid]);
        }
        use($item[clockwork maid], 1);
    }

    # Breakfast
    cli_execute("breakfast");

    # verify liver/stomach/spleen of steel
    if(longterm) {
        if(!have_skill($skill[liver of steel])&&!have_skill($skill[stomach of steel])&&!have_skill($skill[spleen of steel])) {
            print("You should get a liver of steel", "red");
        }
        # verify pagoda
        if(!(get_campground() contains $item[pagoda plans])) {
            print("You should get a pagoda", "red");
        }
    }
}
