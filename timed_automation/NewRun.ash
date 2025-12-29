void use_item(item thing) {
    if (item_amount(thing) >= 1) {
        use(thing);
    }
}

void main () {
    # TODO: For some reason I get "You cannot pull a time-twitching toolbelt in Hardcore." even though I totally can.
    // if(available_amount($item[Time-twitching toolbelt]) < 1) {
    //     take_storage(1, $item[time-twitching toolbelt]);
    // }
    # Visit toot oriole
    visit_url("tutorial.php?action=toot&pwd");
    # open letter from King Ralph XI
    if(my_path() == "Actually Ed the Undying") {
        use_item($item[letter to Ed the Undying]);
    } else {
        use_item($item[letter from King Ralph XI]);
    }
    # open pork elf goodies sack
    use_item($item[pork elf goodies sack]);

    # Start the beginner quests. I'll get around to some of these.
    # Pretentious artist quest
    visit_url("place.php?whichplace=town_wrong&action=townwrong_artist_noquest&getquest=1");
    # gourd quest
	visit_url("place.php?whichplace=town_right&action=townright_gourd_loud&subaction=acceptgourdquest");
    # guild quest
    visit_url("guild.php$place=challenge");
    # skeleton store
    visit_url("shop.php?whichshop=meatsmith&action=talk");
    visit_url("choice.php?pwd&whichchoice=1059&option=1");
    # madness bakery
    visit_url("shop.php?whichshop=armory&action=talk");
    visit_url("choice.php?pwd&whichchoice=1065&option=1");
    # overgrown lot
    visit_url("shop.php?whichshop=doc&action=talk");
    visit_url("choice.php?whichchoice=1064&option=1");
    # Visit the sot. Maybe it will be somewhere I'm visiting.
    visit_url("place.php?whichplace=speakeasy&action=olivers_sot");

    # open astral item
    use_item($item[astral hot dog dinner]);
    use_item($item[astral six-pack]);
    use_item($item[[10882]carton of astral energy drinks]);
    use_item($item[cold medicine cabinet]);
    # equip items of the month
    # if softcore
        # buy and pull clockwork maid

    # Turn on backup camera reverser so text is forward.
    if(item_amount($item[Backup Camera]) >= 0) {
        cli_execute("backupcamera reverse on");
    }

    # Acquire and use giant black monolith, meat butler
    visit_url("shop.php?whichshop=mrstore2002&action=buyitem&quantity=1&whichrow=1383&pwd");
    use_item($item[Meat Butler]);
    visit_url("shop.php?whichshop=mrstore2002&action=buyitem&quantity=1&whichrow=1389&pwd");
    use_item($item[Giant Black Monolith]);
    # using the monolith will bring you to level 3
    visit_url("campground.php?action=monolith");

    # Set leprecondo furniture
    cli_execute("condo Omnipot, fine upholstered dining table set, beer pong table, internet connected laptop");

    # open the McHugeLarge backpack
    visit_url("inventory.php?action=skiduffel&pwd");
    
    # Run breakfast. Let's see what I can get done for now.
    cli_execute("breakfast");

    # End by equiping what you need for the forest quest.
    visit_url("council.php");
    cli_execute("maximize -combat");
}

