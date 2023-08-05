http://127.0.0.1:60080/choice.php?forceoption=5 // to get Breathitin

void main() {
    //TODO: use 1 day ticket if you don't already have access

    //TODO: equip smooth velvet, get volcoino
    cli_execute("outfit smooth velvet");

    //TODO: check if a second volcoino is easily available. If yes, get it.

    //TODO: eat, including milk
    cli_execute("try; use 1 milk of magnesium");

    //switch to stooper then drink, including ode
    cli_execute("familiar stooper");
    int liver_left = inebriety_limit() - my_inebriety();
    while (have_effect($effect[Ode to Booze]) < liver_left) {
        cli_execute("cast ode");
    }
    buy(liver_left, $item[Elemental Caipiroska]);
    drink(liver_left, $item[Elemental Caipiroska]);
    

    //TODO: spleen, using a mojo filter, then one more spleen item

    //Equip volcano mining gear
    cli_execute("outfit volcano mining");

    //TODO: numberology if available. If not, mark how many adventures it would take to mine, then do that.

    //TODO: grab breathitin or other spleen item, then 20 mining adventures. Do this 5 times.

    //TODO: use remaining adventures to mine, running minevolcano.ash

    //overdrink

    //logout.ash
}