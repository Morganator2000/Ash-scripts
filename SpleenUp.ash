item [4] spleen_items;
    spleen_items [0] = $item[Grim Fairy Tale];
    spleen_items [1] = $item[Groose Grease];
    spleen_items [2] = $item[Powdered Gold];
    spleen_items [3] = $item[Unconscious Collective Dream Jar];


void main () {
    #Get prices for the items
    int grim_price = mall_price($item[Grim Fairy Tale]);
    int groose_price = mall_price($item[Groose Grease]);
    int gold_price = mall_price($item[Powdered Gold]);
    int collective_price = mall_price($item[Unconscious Collective Dream Jar]);

    int [4] spleen_prices;
    spleen_prices [0] = grim_price;
    spleen_prices [1] = groose_price;
    spleen_prices [2] = gold_price;
    spleen_prices [3] = collective_price;

    print("Grim Fairy Tale: " + grim_price, "green");
    print("Groose Grease: " + groose_price, "green");
    print("Powdered Gold: " + gold_price, "green");
    print("Unconscious Collective Dream Jar: " + collective_price, "green");

    #calculate current spleen
    int current_spleen = my_spleen_use();
    int max_spleen = spleen_limit();
    int spleen_room = max_spleen - current_spleen;

    #calculate which item gives the best adventures per meat.
    item best_spleen;
    float best_value = 0;
    int i = 0;
    //(int i = 0; i < spleen_prices.length(); ++i)
    while (i < spleen_items.length()) {
        float value = spleen_prices[i];
        if (value > best_value) {
            best_value = value;
            best_spleen = spleen_items[i];
        }
        i = i + 1;
    }

    print("The best spleen item is " + best_spleen, "green");

    #check if you have the right amount of that item. Buy from the mall if needed

    #consume to max spleen

    #check if using a mojo filter will help get a few more adventures.
    #if yes, use a mojo then another one of the items.
}

