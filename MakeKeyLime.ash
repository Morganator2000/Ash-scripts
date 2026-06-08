void main() {
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
        print("Best pie: " + best_pie, "green");
        
        #TODO make sure this part works
        visit_url("runskillz.php?action=Skillz&whichskill=195&targetplayer=0&pwd&quantity=1&ajax=1&_=1772333355330");
        visit_url("choice.php?whichchoice=1414&option=" + choice + "&pwd");
        
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

