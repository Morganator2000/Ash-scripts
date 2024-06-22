# Based on the prices of commemorative war steins and fancy seashell necklace,
# a quarter/dime is worth about 200 meat.
# This script compares the mall price of an item to how much you'd get by trading it.

void main (){
    int[13] fratDimes;
    fratDimes[0] = 2;
    fratDimes[1] = 2;
    fratDimes[2] = 1;
    fratDimes[3] = 1;
    fratDimes[4] = 1;
    fratDimes[5] = 1;
    fratDimes[6] = 1;
    fratDimes[7] = 1;
    fratDimes[8] = 1;
    fratDimes[9] = 2;
    fratDimes[10] = 3;
    fratDimes[11] = 3;
    fratDimes[12] = 3;

    item[13] fratItems;
        fratItems[0] = $item[PADL Phone];
        fratItems[1] = $item[kick-ass kicks];
        fratItems[2] = $item[beer helmet];
        fratItems[3] = $item[distressed denim pants];
        fratItems[4] = $item[perforated battle paddle];
        fratItems[5] = $item[bejeweled pledge pin];
        fratItems[6] = $item[bottle opener belt buckle];
        fratItems[7] = $item[keg shield];
        fratItems[8] = $item[giant foam finger];
        fratItems[9] = $item[war tongs];
        fratItems[10] = $item[energy drink IV];
        fratItems[11] = $item[Elmley shades];
        fratItems[12] = $item[beer bong];

    int[14] hippyQuarters;
        hippyQuarters[0] = 1;
        hippyQuarters[1] = 2;
        hippyQuarters[2] = 2;
        hippyQuarters[3] = 1;
        hippyQuarters[4] = 1;
        hippyQuarters[5] = 2;
        hippyQuarters[6] = 1;
        hippyQuarters[7] = 1;
        hippyQuarters[8] = 3;
        hippyQuarters[9] = 2;
        hippyQuarters[10] = 2;
        hippyQuarters[11] = 3;
        hippyQuarters[12] = 2;
        hippyQuarters[13] = 3;

    item[14] hippyItems;
        hippyItems[0] = $item[hippy protest button];
        hippyItems[1] = $item[Lockenstock™ sandals];
        hippyItems[2] = $item[didgeridooka];
        hippyItems[3] = $item[bullet-proof corduroys];
        hippyItems[4] = $item[round purple sunglasses];
        hippyItems[5] = $item[wicker shield];
        hippyItems[6] = $item[oversized pipe];
        hippyItems[7] = $item[reinforced beaded headband];
        hippyItems[8] = $item[fire poi];
        hippyItems[9] = $item[communications windchimes];
        hippyItems[10] = $item[Gaia beads];
        hippyItems[11] = $item[hippy medical kit];
        hippyItems[12] = $item[flowing hippy skirt];
        hippyItems[13] = $item[round green sunglasses];

    #frat items first
    print("Frat items to trade for dimes:", "purple");
    for i from 0 to 12 by 1 {
        if (mall_price(fratItems[i]) > fratDimes[i]*200) {
            if (fratItems[i] == $item[beer helmet] || fratItems[i] == $item[distressed denim pants] || fratItems[i] == $item[bejeweled pledge pin]) {
                cli_execute("mallsell -1 " + fratItems[i]);
            } else {
                cli_execute("mallsell * " + fratItems[i]);
            }
        } else {
            print("Trade " + fratItems[i], "purple");
        }
    }

    #now hippies
    print("Hippy items to trade for quarters:", "green");
    for i from 0 to 13 by 1 {
        if (mall_price(hippyItems[i]) > hippyQuarters[i]*200) {
            if (hippyItems[i] == $item[bullet-proof corduroys] || hippyItems[i] == $item[round purple sunglasses] || hippyItems[i] == $item[reinforced beaded headband]) {
                cli_execute("mallsell -1 " + hippyItems[i]);
            } else {
                cli_execute("mallsell * " + hippyItems[i]);
            }
        } else {
            print("Trade " + hippyItems[i], "green");
        }
    }

}
