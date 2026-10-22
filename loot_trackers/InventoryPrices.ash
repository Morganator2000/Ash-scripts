# Find the most valuable items in your inventory

string wiki_link(item it) {
    string url = to_wiki_url(it);
    return "<a href='" + url + "' target='_blank' style='color: #2980b9; text-decoration: underline;'>" + it + "</a>";
}

# Create a record (object) for each item
record ItemEntry {
    item it;
    int qty;
    int price;
};

void main(int minPrice, int maxPrice) {    
    int[item] inventory = get_inventory();
    
    if (count(inventory) == 0) {
        print("Apparently you have nothing in your inventory.", "red");
        return;
    }
    
    ItemEntry[int] valuable_items;
    
    # Iterate through every item found in the stash
    foreach it, qty in inventory {
        # Avoid checking quest items or non-tradable items that break price lookups
        if (!is_tradeable(it)) continue;

        int price = mall_price(it);
        
        # Only include items that meet the range
        if (price >= minPrice && price <= maxPrice) {
            ItemEntry entry;
            entry.it = it;
            entry.qty = qty;
            entry.price = price;
            
            valuable_items[count(valuable_items)] = entry;
        }
    }
    if (count(valuable_items) == 0) {
        abort("No items found within this range.");
    }

    # sort items by mall price (descending)
    sort valuable_items by -value.price;

    # build the table
    string table = "<table style='border: 1px solid #444; border-collapse: collapse; font-family: sans-serif;'>";
    table += "<tr style='background-color: #2c3e50; color: white;'>";
    table += "<th style='padding: 6px; text-align: left; border: 1px solid #444;'>Item</th>";
    table += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>Mall Price (meat)</th>";
    table += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>Quantity</th>";

    boolean alt_row = false;
    foreach idx, entry in valuable_items {
        # Format the row appearance
        string bg_color;

        # alternate between white and light grey
        bg_color = alt_row ? "#f9f9f9" : "#ffffff";
        # Add row
        table += "<tr style='background-color: " + bg_color + ";'>";
        table += "<td style='padding: 5px; font-weight: bold;'>" + wiki_link(entry.it) + "</td>";
        table += "<td style='padding: 5px; text-align: center;'>" + to_string(entry.price, "%,d") + "</td>";
        table += "<td style='padding: 5px; text-align: center;'>" + entry.qty + "</td>";
        table += "</tr>";

        # alternate row colouring
        alt_row = !alt_row;
    }

    # Close the table
    table += "</table>";

    # build the html file
    # TODO the final output doesn't use flechets. It replaces them with &gt; or whatever.
    string html = "<!DOCTYPE html><html><head><title>Inventory Value Report</title>";
    # Add style, which I'm pretty sure is optional
    html += "<style>";
    html += "body { font-family: sans-serif; padding: 20px; background-color: #f4f4f9; }";
    html += "table { border-collapse: collapse; width: 100%; max-width: 800px; background: #fff; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }";
    html += "th, td { padding: 10px 12px; border: 1px solid #ddd; }";
    html += "th { background-color: #2c3e50; color: white; text-align: left; }";
    html += "tr:nth-child(even) { background-color: #f9f9f9; }";
    html += ".num { text-align: right; }";
    html += "</style></head><body>";

    html += "<h2>Inventory Value Report</h2>";
    html += "<p>Items priced between " + to_string(minPrice, "%,d") + " and " + to_string(maxPrice, "%,d") + " Meat.</p>";

    # Insert the table
    html += table;

    # close off the file
    html += "</body></html>";

    # file output
    # File output path relative to KoLmafia root
    string filename = "inventory_report.html";

    # Buffer and write to file
    buffer file_buffer;
    append(file_buffer, html);
    if (buffer_to_file(file_buffer, filename)) {
        print_html(html);
    } else {
        print("error");
    }

    # Write the string directly using buffer_to_file
    buffer_to_file(file_buffer, filename);

    print("Report saved to " + filename, "green");

    // # Print table
    // print_html(table);
}