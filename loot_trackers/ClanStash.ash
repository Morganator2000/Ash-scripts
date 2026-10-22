# Find the most valuable items in the clan stash.
#   TODO our clan has a bunch of fecking dusty animal bones that are low value 
#   but mall_price() returns high, due to the top 5 thing it does. Frankly, 
#   these objects should just be excluded.

string wiki_link(item it) {
    string url = to_wiki_url(it);
    return "<a href='" + url + "' target='_blank' style='color: #2980b9; text-decoration: underline;'>" + it + "</a>";
}

void main(int price_threshold) {
    
    print("Fetching clan stash contents...", "blue");
    
    # get_stash() doesn't have an ashref page, but it returns a map of every item in the stash to its quantity
    int[item] stash = get_stash();
    
    if (count(stash) == 0) {
        print("Clan stash is empty or could not be accessed.", "red");
        return;
    }

    # Create a record (object) for each stash item
    record StashEntry {
        item it;
        int qty;
        int karma;
        int price;
    };
    
    StashEntry[int] valuable_items;

    # Iterate through every item found in the stash
    foreach it, qty in stash {

        # karma is the same as the autosell value
        int karma = autosell_price(it);
        
        # historical_price() checks Mafia's cached mall data (doesn't hit server repeatedly)
        int price = historical_price(it);

        # Use mall_price() instead if you want exact, live pricing (slower)
        # int price = malls_price(it);
        
        if (price >= price_threshold) {
            StashEntry entry;
            entry.it = it;
            entry.qty = qty;
            entry.karma = karma;
            entry.price = price;
            
            valuable_items[count(valuable_items)] = entry;
        }
    }

    if (count(valuable_items) == 0) {
        abort("No items found above the specified amount. I guess this clan is broke.");
    }

    # sort items by mall price (descending)
    sort valuable_items by -value.price;

    # Print in table form
    string table = "<table style='border: 1px solid #444; border-collapse: collapse; font-family: sans-serif;'>";
    table += "<tr style='background-color: #2c3e50; color: white;'>";
    table += "<th style='padding: 6px; text-align: left; border: 1px solid #444;'>Item</th>";
    table += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>Mall Price (meat)</th>";
    table += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>In Clan Stash (quantity)</th>";
    table += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>Karma Cost</th>";

    boolean alt_row = false;
    foreach idx, entry in valuable_items {
        # Format the row appearance
        string bg_color;

        # Highlight in soft pink (#ffcccc) if Mall Price >= (2 * Karma)
        # Otherwise, alternate between white and light grey
        if (entry.karma > 0 && entry.price == (entry.karma * 2)) {
            bg_color = "#ffcccc"; 
        } else {
            bg_color = alt_row ? "#f9f9f9" : "#ffffff";
        }
        # Add row
        table += "<tr style='background-color: " + bg_color + ";'>";
        table += "<td style='padding: 5px; font-weight: bold;'>" + wiki_link(entry.it) + "</td>";
        table += "<td style='padding: 5px; text-align: center;'>" + entry.price + "</td>";
        table += "<td style='padding: 5px; text-align: center;'>" + entry.qty + "</td>";
        table += "<td style='padding: 5px; text-align: center;'>" + entry.karma + "</td>";

        # alternate row colouring
        alt_row = !alt_row;
    }

    # Close the table
    table += "</table>";

    # Print table
    print_html(table);
}