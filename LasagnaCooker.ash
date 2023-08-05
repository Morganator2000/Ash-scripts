void main(numberOfLasagnas) {
    //Start by gathering some prices
    //The goal here is to generate the most profit per lasagna.
    //keep in mind that pastamancers/saucerers will have access to the league's prices.
    int savoryNoodle = mall_price($item[Savory Dry Noodles]);
    int msg =  mall_price($item[]);
    int dryNoodle =  mall_price($item[Dry Noodles]);
    boolean buy_Savory;
    int dish = 36; //Gnollish casserole dish from madeline's bakery supplies. Optionally add bugbear bakery.

    int lp_lasag =  mall_price($item[Long pork lasagna]);
    int lp_cass =  mall_price($item[long pork casserole]);
    boolean buy_lp_cass;
    int lp_base =  mall_price($item[long pork chop sandwiches]);
    boolean buy_lp_base;
    int lp =  mall_price($item[long pork]);
    int pepper =  mall_price($item[black pepper]);

    int ff_lasag =  mall_price($item[fishy fish lasagna]);
    int ff_cass =  mall_price($item[fishy fish casserole]);
    boolean buy_ff_cass;
    int ff_base =  mall_price($item[fishy fish]);
    boolean buy_ff_base;
    int caviar =  mall_price($item[dehydrated caviar]);
    int fish =  mall_price($item[displaced fishy]);
    
    int gn_lasag =  mall_price($item[Gnat lasagna]);
    int gn_cass =  mall_price($item[gnatloaf casserole]);
    boolean buy_gn_cass;
    int gn_base =  mall_price($item[gnatloaf]);
    boolean buy_gn_base;
    int spice =  mall_price($item[ancient spice]);
    int filet =  mall_price($item[filet of tangy gnat ("fotelif")]);

    //First, is it worth it to buy savory noodles, or to buy msg + dry noodles and then craft?
    int basics; //this will be the cost of obtaining the savory noodle + the casserole dish
    if (savoryNoodle =< (msg + dryNoodle)) {
        basics = savoryNoodle + dish;
        buySavory = true;
    } else {
        basics = msg + dryNoodle + dish;
        buySavory = false;
    }

    //Second, for each lasagna, figure out which parts of it you should buy.
    //third, which lasagna will give the most profit
    int lp_profit = lp_lasag -
    int ff_profit = ff_lasag -
    int gn_profit = gn_lasag -
}

#TODO: make sure this script takes the ingredients you already have into account.
#TODO: compare mall prices to league prices when relevant.