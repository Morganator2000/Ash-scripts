string format_cell(int amount) {
    if (amount > 0) {
        #Wrap the text in a span with blue color and bold weight if it isn't zero
        return "<span style='color: rgb(0, 0, 255); font-weight: bold;'>" + amount + "</span>";
    }
    # Return normal text if it's 0
    return to_string(amount);
}

void main (string series) {
    int start_id;
    int end_id;
    switch(series) {
        case "1":
            start_id = 964;
            end_id = 994;
            break;
        case "2":
            start_id = 2872;
            end_id = 2935;
            break;
        case "3":
            start_id = 5931;
            end_id = 5962;
            break;
        case "1C":
            start_id = 1375;
            end_id = 1379;
            break;
        case "1Cw":
            start_id = 2201;
            end_id = 2205;
            break;
        case "2C":
            start_id = 3656;
            end_id = 3660;
            break;
        case "3C":
            start_id = 4335;
            end_id = 4339;
            break;
        case "4C":
            start_id = 4822;
            end_id = 4826;
            break;
        case "5C":
            start_id = 5372;
            end_id = 5376;
            break;
        case "6C":
            start_id = 5918;
            end_id = 5922;
            break;
        case "7C":
            start_id = 6908;
            end_id = 6912;
            break;
        case "8C":
            start_id = 7851;
            end_id = 7855;
            break;
        case "9C":
            start_id = 8756;
            end_id = 8760;
            break;
        case "10C":
            start_id = 9244;
            end_id = 9248;
            break;
        case "11C":
            start_id = 9586;
            end_id = 9590;
            break;
        case "12C":
            start_id = 10025;
            end_id = 10029;
            break;
        case "13C":
            start_id = 10340;
            end_id = 10344;
            break;
        case "14C":
            start_id = 10665;
            end_id = 10669;
            break;
        case "15C":
            start_id = 10809;
            end_id = 10813;
            break;
        case "16C":
            start_id = 11039;
            end_id = 11043;
            break;
        case "17C":
            start_id = 11381;
            end_id = 11385;
            break;
        case "18C":
            start_id = 11712;
            end_id = 11716;
            break;
        case "19C":
            # first part of the list is 12061 to 12065
            start_id = 12061;
            # Second part is 12144 to 12146
            end_id = 12146;
            break;
        case "1FF":
            start_id = 7272;
            end_id = 7276;
            break;
        case "DCS1":
            start_id = 6973;
            end_id = 7002;
            break;
        default:
            abort("Invalid series. Choose either: 1, 2, 3, 1C, 1Cw, 2C, 3C, 4C, 5C, 6C, 7C, 8C, 9C, 10C, 11C, 12C, 13C, 14C, 15C, 16C, 17C, 18C, 19C, 1FF or DCS1.");
            #TODO add die cast
    }

    # Make initial table.
    string table_template = "<table style='border: 1px solid #444; border-collapse: collapse; font-family: sans-serif;'>";
    # Add header row
    table_template += "<tr style='background-color: #2c3e50; color: white;'>";
    table_template += "<th style='padding: 6px; text-align: left; border: 1px solid #444;'>Tiny Plastic</th>";
    table_template += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>In Display Case</th>";
    table_template += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>In Inventory</th>";
    table_template += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>In Closet</th>";
    table_template += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>In Mall</th>";
    table_template += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>In Storage</th>";
    table_template += "<th style='padding: 6px; text-align: right; border: 1px solid #444;'>In Clan Stash</th>";
    table_template += "</tr>";

    # Function to create a display table.
    void create_table(int start_id, int end_id) {
        string table = table_template;
        boolean alt_row = false;


        for item_id from start_id to end_id {
            # Exception for 19C, which is set up weirdly.
            if (series == "19C" && item_id >= 12066 && item_id <= 12143) {
                continue;
            }

            item figure = to_item(item_id);

            int inventory = item_amount(figure);
            int display = display_amount(figure);
            int closet = closet_amount(figure);
            int mall = shop_amount(figure);
            int storage = storage_amount(figure);
            int clan = stash_amount(figure);

            # Format the row appearance
            string bg_color = alt_row ? "#f9f9f9" : "#ffffff";
            # Clean up the name string for the table display
            string clean_name;
            if(series == "DCS1") {
                clean_name = replace_string(to_string(figure), "tiny die-cast ", "");
            } else {
                clean_name = replace_string(to_string(figure), "tiny plastic ", "");
            }

            # Add row
            table += "<tr style='background-color: " + bg_color + ";'>";
            table += "<td style='padding: 5px; border: 1px solid #444; color: #333; font-weight: bold;'>" + clean_name + "</td>";
            table += "<td style='padding: 5px; border: 1px solid #444; text-align: right;'>" + format_cell(display) + "</td>";
            table += "<td style='padding: 5px; border: 1px solid #444; text-align: right;'>" + format_cell(inventory) + "</td>";
            table += "<td style='padding: 5px; border: 1px solid #444; text-align: right;'>" + format_cell(closet) + "</td>";
            table += "<td style='padding: 5px; border: 1px solid #444; text-align: right;'>" + format_cell(mall) + "</td>";
            table += "<td style='padding: 5px; border: 1px solid #444; text-align: right;'>" + format_cell(storage) + "</td>";
            table += "<td style='padding: 5px; border: 1px solid #444; text-align: right;'>" + format_cell(clan) + "</td>";
            table += "</tr>";

            # alternate row colouring
            alt_row = !alt_row;
        }
        # Close the table
        table += "</table>";

        # Print table
        print_html(table);

    }

    create_table(start_id, end_id);
}