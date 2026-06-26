# Do note that this script assumes you will be purchasing from the bugbear bakery. 
# It does not take discounts (including Madeline's bakery) into account.
# Fortunately the meat difference is so little that it won't matter.

void main(int numberOfPies) {
    if(!have_chef() && free_cooks() < 1) {
        abort("No Chef-in-the-box detected. Please set up, and adjust item acquisition setting to automatically repair upon explosion.");
    } else if(free_cooks() > 0) {
        print("You have no chef-in-a-box but " + free_cooks() + " free cooks available. Adjusting number of pies to compensate.");
        numberOfPies = free_cooks();
    }

    int pie_price = mall_price($item[Star Key Lime Pie]);
    int lime_price = mall_price($item[Lime]);
    int chart_price = mall_price($item[Star chart]);
    int star_price = mall_price($item[star]);
    int line_price = mall_price($item[line]);
    int tin_price = 30;
    int dough_price = 50;
    int pie_cost = lime_price + chart_price + star_price * 8 + line_price * 7 + tin_price + dough_price;
    int profit = pie_price - pie_cost;
    
    print("The prices of everything:");
    print("Star Key Lime Pie: " + pie_price + " meat");
    print("Lime:.............." + lime_price + " meat");
    print("Star chart:........" + chart_price + " meat");
    print("Star:.............." + star_price + " meat");
    print("Line:.............." + line_price + " meat");
    print("Cost per pie: " + pie_cost + " meat", "blue");
    print("Expected profit per pie: " + profit + " meat", "blue");
    if (profit < 0) {
        abort("You will lose money here.");
    } else if(profit < 1000) {
        abort("Not enough of a profit is to be made.");
    } else {
        print("Let's make some pies", "green");
    }

    int piesCreated = 0;
    //verify number of each ingredient you already have.
    int lime_count = item_amount($item[lime]);
    int chart_count = item_amount($item[Star chart]);
    int star_count = item_amount($item[star]);
    int line_count = item_amount($item[line]);
    int crust_count = item_amount($item[pie crust]);
    int tin_count = item_amount($item[Gnollish Pie Tin]);
    int dough_count = item_amount($item[wad of Dough]);

    print("Limes: " + lime_count);
    print("Star Charts: " + chart_count);
    print("Stars: " + star_count);
    print("Lines: " + line_count);
    print("Pie Crusts: " + crust_count);
    print("Pie Tins: " + tin_count);
    print("Wads of Dough: " + dough_count);

    //use on-hand ingredients first
    if (lime_count > 0 && chart_count > 0 && star_count >= 8 && line_count >= 7) {
        print("Using on-hand ingredients", "blue");
        int lime_count = item_amount($item[lime]);
        int chart_count = item_amount($item[Star chart]);
        int star_count = item_amount($item[star]);
        int line_count = item_amount($item[line]);
        int crust_count = item_amount($item[pie crust]);
        int tin_count = item_amount($item[Gnollish Pie Tin]);
        int dough_count = item_amount($item[wad of Dough]);
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
        cli_execute("Acquire " + onHandMake + " Richard's Star Key");
        craft("cook", onHandMake, $item[Richard's Star Key], $item[lime]);
        craft("cook", onHandMake, $item[Gnollish Pie Tin], $item[Wad of Dough]);
        craft("cook", onHandMake, $item[Pie Crust], $item[Star Key Lime]);
        # TODO error handling to make sure I did craft it.
        piesCreated = piesCreated + onHandMake;
        print("Made " + piesCreated + " pie(s) via on-hand ingredients", "blue");
    // This is an infinite loop. Figure out why it's not exiting.
    }
    //buy materials to finish off on-hand materials

    //buy directly from the mall
    if (numberOfPies > piesCreated) {
        int piesLeft = numberOfPies - piesCreated;
        print("Buying ingredients from the mall", "blue");
        int desired_limes = max(piesLeft - lime_count, 0);
        int desired_charts = max(piesLeft - chart_count, 0);
        # TODO adjust these numbers to buy the right amount of stars/lines
        int desired_stars = max((piesLeft * 8) - star_count, 0);
        int desired_lines = max((piesLeft * 7) - line_count, 0);
        buy(desired_limes, $item[Lime]);
        buy(desired_charts, $item[Star chart]);
        buy(piesLeft*8, $item[Star]);
        buy(piesLeft*7, $item[Line]);

        cli_execute("Acquire " + piesLeft + " Richard's Star Key");
        craft("cook", piesLeft, $item[Richard's Star Key], $item[lime]);
        craft("cook", piesLeft, $item[Gnollish Pie Tin], $item[Wad of Dough]);
        craft("cook", piesLeft, $item[Pie Crust], $item[Star Key Lime]);
        piesCreated = piesCreated + piesLeft;
    }
    # TODO find a better way to set the price besides undercut.
    cli_execute("mallsell " + piesCreated + " Star Key Lime Pie");
    # cli_execute("undercut");
    print();
    print("Leftover ingredients", "blue");
    print("Limes: " + item_amount($item[lime]));
    print("Star Charts: " + item_amount($item[Star chart]));
    print("Stars: " + item_amount($item[star]));
    print("Lines: " + item_amount($item[line]));
    print("Pie Crusts: " + item_amount($item[pie crust]));
    print("Pie Tins: " + item_amount($item[Gnollish Pie Tin]));
    print("Wads of Dough: " + item_amount($item[wad of Dough]));
    print();
    print("Created and sold "  + piesCreated + " pies!", "green");
    print("Estimated gross profit: " + piesCreated * pie_price + " meat", "green");
    print("Estimated net profit: " + piesCreated * profit + " meat", "green");
}