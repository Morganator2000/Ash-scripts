

void main(int numberOfUmbrellas, boolean sellUmbrellas) {
    if (numberOfUmbrellas <= 0) {
        abort("If you didn't want to make any umbrellas why did you run the script?");
    }
    //get prices
    int titanium_price = mall_price($item[Titanium Assault Umbrella]);
    int goat_price = mall_price($item[Goatskin Umbrella]);
    int umbrella_price;
    item umbrellaToBuy;
    if (titanium_price < goat_price) {
        umbrella_price = titanium_price;
        umbrellaToBuy = $item[Titanium Assault Umbrella];
    } else {
        umbrella_price = goat_price;
        umbrellaToBuy = $item[Goatskin Umbrella];
    }
    int skin_price = mall_price($item[Gator skin]);
    int gator_umbrella_price = mall_price($item[Gatorskin Umbrella]);
    int profit = gator_umbrella_price - skin_price - umbrella_price;
    print("Titanium Assault Umbrella: " + titanium_price + " meat");
    print("Goatskin Umbrella: " + goat_price + " meat");
    print("Gator skin: " + skin_price + " meat");
    print("Gatorskin Umbrella: " + gator_umbrella_price + " meat");
    if (profit <= 0) {
        print("Estimated profit = " + profit + " meat", "red");
        abort("It is cheaper to buy the gatorskin umbrellas directly.");
    }
    print("Estimated profit = " + profit + " meat", "green");
    //get current quantities
    int umbrella_count = item_amount(umbrellaToBuy);
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
    buy(needed_umbrellas, umbrellaToBuy);
    buy(needed_skins, $item[Gator skin]);

    //make the umbrellas

    cli_execute("make " + numberOfUmbrellas + " Gatorskin umbrella");
    //TODO: this won't work if you have no adventures but do have free crafts. Is there a way to override this?

    //optionally sell finished umbrellas.

    if (sellUmbrellas) {
        cli_execute("mallsell " + numberOfUmbrellas + " Gatorskin umbrella");
        cli_execute("undercut");
        print("Estimated total profit = " + numberOfUmbrellas*profit + " meat", "green");
    }
}

#TODO: add booleans for grabbing items from the stash / putting items in the mall