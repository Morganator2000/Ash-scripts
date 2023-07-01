void countItems() {
    int lime_count = item_amount($item[lime]);
    int chart_count = item_amount($item[Star chart]);
    int star_count = item_amount($item[star]);
    int line_count = item_amount($item[line]);
    int crust_count = item_amount($item[pie crust]);
    int tin_count = item_amount($item[Gnollish Pie Tin]);
    int dough_count = item_amount($item[wad of Dough]);
}

void main(int numberOfPies) {
    //putting these into a map is ideal
    int pie = mall_price($item[Star Key Lime Pie]);
    int lime = mall_price($item[Lime]);
    int chart = mall_price($item[Star chart]);
    int star = mall_price($item[star]);
    int line = mall_price($item[line]);
    int tin = 22; //Madeline's price
    int dough = 36; //same

    int profit = pie - lime - chart - star * 8 - line * 7 - tin - dough;
    
    print("The prices of everything:");
    print("Star Key Lime Pie: " + pie + " meat");
    print("Lime:.............." + lime + " meat");
    print("Star chart:........" + chart + " meat");
    print("Star:.............." + star + " meat");
    print("Line:.............." + line + " meat");
    print("Expected profit per pie: " + profit + " meat", "blue");
    if (profit < 0) {
        abort("You will lose money here.");
    } else {
        print("All is good, let's make some pie", "green");
    }
    //verify number of each ingredient you already have.
    //This should also be in a map
    int lime_count = item_amount($item[lime]);
    int chart_count = item_amount($item[Star chart]);
    int star_count = item_amount($item[star]);
    int line_count = item_amount($item[line]);
    int crust_count = item_amount($item[pie crust]);
    int tin_count = item_amount($item[Gnollish Pie Tin]);
    int dough_count = item_amount($item[wad of Dough]);

    int piesCreated = 0;
    while (numberOfPies > piesCreated) {
    //use on-hand ingredients first
        while (numberOfPies > piesCreated && lime_count > 0 && chart_count > 0 && star_count >= 8 && line_count >= 7) {
            print("Using on-hand ingredients", "blue");
            int potential_pies = lime_count;
            int onHandMake;
            if (potential_pies > chart_count) {
                potential_pies = chart_count;
            }
            if (potential_pies > (star_count - star_count%8)/8) {
                potential_pies = (star_count - star_count%8)/8;
            }
            if (potential_pies > (line_count - line_count%7)/7) {
                potential_pies = (line_count - line_count%7)/7;
            }
            if (potential_pies < numberOfPies) {
                onHandMake = potential_pies;
            } else {
                onHandMake = numberOfPies;
            }
            cli_execute("make " + onHandMake + " Star Key Lime Pie");
            piesCreated = piesCreated + onHandMake;
            countItems();
        } // This is an infinite loop. Figure out why it's not exiting.
    //buy materials to finish off on-hand materials

    //buy dirrectly from the mall
        while (numberOfPies > piesCreated) {
            int piesLeft = numberOfPies - piesCreated;
            print("Buying ingredients from the mall", "blue");
            buy(piesLeft, $item[Lime]);
            buy(piesLeft, $item[Star chart]);
            buy(piesLeft*8, $item[Star]);
            buy(piesLeft*7, $item[Line]);
            buy(piesLeft, $item[Gnollish pie tin]);
            buy(piesLeft, $item[wad of dough]);
            cli_execute("make " + piesLeft + " Star Key Lime Pie");
            piesCreated = piesCreated + piesLeft;
        }
    }
    cli_execute("mallsell " + piesCreated + " Star Key Lime Pie");
    cli_execute("undercut");
}