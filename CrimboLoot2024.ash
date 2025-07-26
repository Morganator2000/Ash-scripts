void main() {
    cli_execute("clear");
    print("Spirits");
    print("Spirit of Easter: " + available_amount($item[Spirit of Easter]));
    print("Spirit of St. Patrick's Day: " + available_amount($item[Spirit of St. Patrick's Day]));
    print("Spirit of Veteran's Day: " + available_amount($item[Spirit of Veteran's Day]));
    print("Spirit of Thanksgiving: " + available_amount($item[Spirit of Thanksgiving]));
    print("Spirit of Christmas: " + available_amount($item[Spirit of Christmas]));
    print();

    print("Easter Island", "green");
    print("dark chocolate egg: " + available_amount($item[dark chocolate egg]));
    print("coney haunch: " + available_amount($item[coney haunch]));
    print("moai toai: " + available_amount($item[moai toai]));
    print("moaiball: " + available_amount($item[moaiball]));
    print();

    print("St. Patrick's Day Island", "purple");
    print("four-leaf potato sprout: " + available_amount($item[four-leaf potato sprout]));
    print("half-digested rat: " + available_amount($item[half-digested rat]));
    print("potato jacket: " + (available_amount($item[potato jacket])));
    print();
    
    print("Veteran's Day Island", "red");
    print("Brandonian footlocker key: " + available_amount($item[Brandonian footlocker key]));
    print("military orb: " + available_amount($item[military orb]));
    print("traumatic holiday memory: " + available_amount($item[traumatic holiday memory]));
    print("Congressional Medal of Insanity: " + available_amount($item[Congressional Medal of Insanity]));
    print();
    
    print("Thanksgiving Island", "blue");
    print("gravy skin: " + available_amount($item[gravy skin]));
    print("crystallized pumpkin spice: " + available_amount($item[crystallized pumpkin spice]));
    print("pumpkin spice whorl: " + available_amount($item[pumpkin spice whorl]));
    print();
    
    print("Christmas Island", "gray");
    print("fragile Christmas ornament: " + available_amount($item[fragile Christmas ornament]));
    print("ragged wool yarn: " + available_amount($item[ragged wool yarn]));
    print("LIDAR candle: " + available_amount($item[LIDAR candle]));
    print("snowman-enchanting tophat: " + available_amount($item[snowman-enchanting tophat]));
    print();
}