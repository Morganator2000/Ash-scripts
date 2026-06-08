void main (string ml) {
    if(ml == "down") {
        cli_execute("uneffect annoyance");
        change_mcd(0);
        cli_execute("parka ghostasaurus");
        cli_execute("maximize -ml");
        cli_execute("unequip Drunkula's Wineglass");
    } else if (ml == "up") {
        cli_execute("cast annoyance");
        change_mcd(10);
        cli_execute("outfit +slime"); 
        equip($item[tiny cell phone]);
        cli_execute("parka spikolodon");
    } else {
        abort("You can only do 'up' or 'down'.");
    }
}