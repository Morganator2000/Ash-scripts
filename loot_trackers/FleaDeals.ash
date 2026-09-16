# Script that checks of there are any sweet deals in the flea market.

string wiki_link(item it) {
    string url = to_wiki_url(it);
    return "<a href='" + url + "' target='_blank' style='color: #2980b9; text-decoration: underline;'>" + it + "</a>";
}

record FleaItem {
    item item_name;
    int flea_price;
    int mall_price;
    int valuation;
};

void main() {
    
    FleaItem[item] flea_items;
    string flea_pattern = "<b>([^<]+)</b></a></td><td>([\\d,]+) Meat";

    # Get flea market items
    for page from 1 to 17 {
        string market_response = visit_url("town_fleamarket.php?which=" + page);
        matcher item_matcher = create_matcher(flea_pattern, market_response);

        while (item_matcher.find()) {
            item item_name = item_matcher.group(1).to_item();
            string flea_price = item_matcher.group(2);
            # remove commas from price
            matcher comma_matcher = create_matcher(",", flea_price);
            # determine profitability
            flea_price = replace_all(comma_matcher, "");
            int mall_price = mall_price(item_name);
            int valuation = mall_price - flea_price.to_int();
            # add to map
            if (valuation > 100) {
                flea_items[item_name] = new FleaItem(item_name, flea_price.to_int(), mall_price, valuation);
            } else {
                continue;
            }
        }
    }

    if (count(flea_items) == 0) {
        abort("There are currently no good deals at the flea market.");
    }

    sort flea_items by -value.valuation;

    # Print in table form
    string table = "<table style='border: 1px solid #444; border-collapse: collapse; font-family: sans-serif;'>";
    table += "<tr style='background-color: #2c3e50; color: white;'>";
    table += "<th style='padding: 6px; text-align: left; border: 1px solid #444;'>Item</th>";
    table += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>Mall Price (meat)</th>";
    table += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>Flea Market Price (meat)</th>";
    table += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>Difference (meat)</th>";

    boolean alt_row = false;
    foreach idx, entry in flea_items {
        # Format the row appearance
        string bg_color;

        # Add row
        table += "<tr style='background-color: " + bg_color + ";'>";
        table += "<td style='padding: 5px; font-weight: bold;'>" + wiki_link(entry.item_name) + "</td>";
        table += "<td style='padding: 5px; text-align: center;'>" + entry.mall_price + "</td>";
        table += "<td style='padding: 5px; text-align: center;'>" + entry.flea_price + "</td>";
        table += "<td style='padding: 5px; text-align: center;'>" + entry.valuation + "</td>";

        # alternate row colouring
        alt_row = !alt_row;
    }

    # Close the table
    table += "</table>";

    # Print table
    print_html(table);
}