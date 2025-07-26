
# buy and set up clockwork maid and chef-in-a-box
# great_sell_off
# Enable backup camera reverser
void use_item(item thing) {
    if (item_amount(thing) >= 1) {
        use(thing);
    }
}

void main () {
    # Take everything from Hagnk
    cli_execute("pull all")
    # Breakfast
    cli_execute("breakfast");
    # Set up cold medicine cabinet
    use_item($item[Cold Medicine Cabinet]);
    cli_execute("backupcamera reverse on");
    
    cli_execute("run Great_sell_off");
}
