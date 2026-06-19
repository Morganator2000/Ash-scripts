void main() {
    # run the same logout script first
    cli_execute("run logout");
    # Open all Mayday Supply Packages
    cli_execute("use * mayday supply package");
    # Make Sweat-Ade
    equip($item[Designer Sweatpants]);
    cli_execute("try; cast Make Sweat-Ade");
    cli_execute("try; cast Make Sweat-Ade");

    # Sell Accordion Thief nemesis quest items
    cli_execute("autosell * fish-oil smoke bomb");
    cli_execute("autosell * vial of squid ink");
    cli_execute("autosell * potion of fishy speed");

    # TODO use Dr. hobo's map and map of the slug lord
    cli_execute("try; use Dr. Hobo's Map");
    cli_execute("try; use The Slug Lord's map");
    # TODO Use lockpicking and make a pie, based on mall price, once this works.
    # cli_execute("run MakeKeyLime");

    # TODO check if you have lucky, then use it to get scented massage oil
    if(have_effect($effect[Lucky!])) {
        adventure(1, $location[Cobb's Knob Harem]);
    }
}