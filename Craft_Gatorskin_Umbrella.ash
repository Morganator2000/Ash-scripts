

void main(int numberOfUmbrellas, boolean sellUmbrellas) {
    if (numberOfUmbrellas <= 0) {
        abort("If you didn't want to make any umbrellas why did you run the script?");
    }
    //get prices
    int umbrella_price = mall_price($item[Titanium Assault Umbrella]);
    int skin_price = mall_price($item[Gator skin]);
    int gator_umbrella_price = mall_price($item[Gatorskin Umbrella]);
    int profit = gator_umbrella_price - skin_price - umbrella_price;
    print("Titanium Assault Umbrella: " + umbrella_price + " meat");
    print("Gator skin: " + skin_price + " meat");
    print("Gatorskin Umbrella: " + gator_umbrella_price + " meat");
    if (profit <= 0) {
        print("Estimated profit = " + profit + " meat", "red");
        abort("It is cheaper to buy the gatorskin umbrellas directly.");
    }
    print("Estimated profit = " + profit + " meat", "green");
    //get current quantities
    int umbrella_count = item_amount($item[Titanium Assault Umbrella]);
    int skin_count = item_amount($item[Gator skin]);
    //figure out how much you need to acquire to make numberOfUmbrellas
    int needed_umbrellas = numberOfUmbrellas - umbrella_count;
    if (needed_umbrellas <= 0) {
        needed_umbrellas = 0;
    }
    int needed_skins = numberOfUmbrellas - skin_count;
    if (needed_skins <= 0) {
        needed_skins = 0;
    }
    print("You need " + needed_umbrellas + " more umbrellas and " + needed_skins + " more skins.", "blue");

    //Acquire the difference
    buy(needed_umbrellas, $item[Titanium Assault Umbrella]);
    buy(needed_skins, $item[Gator skin]);

    //make the umbrellas

    cli_execute("make " + numberOfUmbrellas + " Gatorskin umbrella");

    //optionally sell finished umbrellas.

    if (sellUmbrellas) {
        cli_execute("mallsell " + numberOfUmbrellas + " Gatorskin umbrella");
        cli_execute("undercut");
        print("Estimated total profit = " + numberOfUmbrellas*profit + " meat", "green");
    }
}

#TODO: add booleans for grabbing items from the stash / putting items in the mall