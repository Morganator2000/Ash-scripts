
# great_sell_off
void use_item(item thing) {
    if (item_amount(thing) >= 1) {
        use(thing);
    }
}

void main () {
    # Take everything from Hagnk
    cli_execute("pull all");
    # Set up cold medicine cabinet
    use_item($item[Cold Medicine Cabinet]);
    # Reverse the backup camera
    cli_execute("backupcamera reverse on");
    # Get skills from books
    use_item($item[The Journal of Mime Science Vol. 2 (used)]);
    use_item($item[The Journal of Mime Science Vol. 3 (used)]);
    use_item($item[The Journal of Mime Science Vol. 6 (used)]);
    use_item($item[The Big Book of Communism (used)]);
    use_item($item[The Encyclopedia of Fruit (used)]);
    use_item($item[Elf Guard Field Manual: Culinary Arts (used)]);
    use_item($item[Elf Guard Field Manual: Extortion (used)]);
    use_item($item[Elf Guard Field Manual: Wilderness Sleeping (used)]);
    use_item($item[Shanty: Who's Going to Pay This Drunken Sailor? (used)]);
    use_item($item[Shanty: Let's Beat Up This Drunken Sailor (used)]);
    use_item($item[Shanty: Only Dogs Love Drunken Sailors (used)]);
    # cli_execute("run Great_sell_off");
    
    # Breakfast
    cli_execute("breakfast");
}
