# Automate grabbing the ingredients from Nash Crosby's Still.

int [string] get_counts() {
    int [string] ingredients;

    ingredients["Gin"] = item_amount($item[bottle of gin]);
    ingredients["Rum"] = item_amount($item[bottle of rum]);
    ingredients["Tequila"] = item_amount($item[bottle of tequila]);
    ingredients["Vodka"] = item_amount($item[bottle of vodka]);
    ingredients["Whiskey"] = item_amount($item[bottle of whiskey]);
    ingredients["Wine"] = item_amount($item[boxed wine]);
    ingredients["Sewage"] = item_amount($item[bottle of sewage schnapps]);
    ingredients["Sake"] = item_amount($item[bottle of sake]);

    ingredients["Grapefruit"] = item_amount($item[grapefruit]);
    ingredients["Lemon"] = item_amount($item[lemon]);
    ingredients["Olive"] = item_amount($item[olive]);
    ingredients["Orange"] = item_amount($item[orange]);
    ingredients["Soda Water"] = item_amount($item[soda water]);
    ingredients["Strawberry"] = item_amount($item[strawberry]);

    return ingredients;
}

void main() {
    # TODO Make sure you can access the still in the first place
    
    # Make sure you still have uses
    if (stills_available() == 0) {
        abort("Nash's still is all used up");
    }

    string still_url = "shop.php?whichshop=still";

    int [string] ingredients = get_counts();
    boolean have_ingredients = false;
    foreach ingredient, quantity in ingredients {
        if(quantity > 0) {
            have_ingredients = true;
        }
    }
    # TODO change this to instead purchase soda water?
    if(!have_ingredients) {
        abort("You have no ingredients");
    }

    # Get what we have. We're not going to bother trying to process things we don't have.
    # TODO Subtract a threshold amount of OG ingredients we want to keep, if we're in aftercore.

    # We're going to prioritize bottles of ooze-o. After that we're looking at profit increase.
    while(stills_available() > 0) {
        if(item_amount($item[bottle of sewage schnapps]) > 0) {
            create(1 , $item[Bottle of Ooze-O]);
        } else {
            
        }
    }
}