# Automatically send the autumnaton to the most profitable location when possible
# TODO add option to automatically add found gear.

# Keep it simple for now, there's only a few choice items we care about.
    # Mojo Filter
    # Rusty Hedge Trimmers
    # Stone Wool

# location [0] get_autumnaton_locations( )

function autumnAton() {
  const item = toItem("autumn-aton");
  if (item === Item.none || !availableAmount(item)) return;

  const location = Location.get("The Deep Dark Jungle");
  #cliExecute("debug on");
  visitUrl("inv_use.php?pwd&whichitem=10954");
  if (availableChoiceOptions()[1]) {
    runChoice(1);
  }

  runChoice(2, `heythereprogrammer=${location.id}`);
  visitUrl("main.php");
  #cliExecute("debug off");
  cliExecute("refresh inventory");
}

void main() {
    visit_url("inv_use.php?which=3&whichitem=10954&pwd");
    # Twin Peak
    visit_url("choice.php?option=2&pwd&whichchoice=1483&heythereprogrammer=297")
}