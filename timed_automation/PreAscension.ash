void main() {
    # Open all Mayday Supply Packages
    cli_execute("use * mayday supply package");

    # Use lockpicking and make a pie, based on mall price
    if (have_skill($skill[Lock Picking])){
        int boris_price = mall_price($item[Boris's key lime pie]);
        int jarlsberg_price = mall_price($item[Jarlsberg's key lime pie]);
        int pete_price = mall_price($item[Sneaky Pete's key lime pie]);

        item best_pie = $item[Boris's key lime pie];
        item best_key = $item[Boris's key];
        item best_lime = $item[Boris's key lime];
        int max_price = boris_price;
        if (jarlsberg_price > max_price) {
            best_pie = $item[Jarlsberg's key lime pie];
            best_key = $item[Jarlsberg's key];
            best_lime = $item[Jarlsberg's key lime];
            max_price = jarlsberg_price;
        } 
        if (pete_price > max_price) {
            best_pie = $item[Sneaky Pete's key lime pie];
            best_key = $item[Sneaky Pete's key];
            best_lime = $item[Sneaky Pete's key lime];
            max_price = pete_price;
        } 
        int choice;
        if (best_pie == $item[Boris's key lime pie]) {
            choice = 1;
        } else if (best_pie == $item[Jarlsberg's key lime pie]) {
            choice = 2;
        } else if (best_pie == $item[Sneaky Pete's key lime pie]) {
            choice = 3;
        }
        #TODO make sure this part works
        use_skill(1, $skill[Lock Picking]);
        cli_execute("choice " + choice);

        if (item_amount($item[lime]) < 1) {
            buy(1, $item[lime]);
        }
        if (item_amount($item[pie crust]) < 1) {
            cli_execute("acquire 1 pie crust");
        }
        craft("cook", 1, $item[lime], best_key);
        craft("cook", 1, $item[pie crust], best_lime);
        put_shop(max_price, 0, 1,best_pie);
    }
    # Make Sweat-Ade
    equip($item[Designer Sweatpants]);
    while (have_skill($skill[Make Sweat-Ade])) {
        use_skill($skill[Make Sweat-Ade]);
    }

    #TODO: discard karma
    #TODO: run logout
}