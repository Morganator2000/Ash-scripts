
# buy and set up clockwork maid and chef-in-a-box
# great_sell_off
# Enable backup camera reverser

void main () {
    # Take everything from Hagnk
    # Breakfast
    cli_execute("breakfast");
    # Set up cold medicine cabinet
    if (item_amount($item[Cold Medicine Cabinet]) == 1) {
        use ($item[Cold Medicine Cabinet]);
    }
}
