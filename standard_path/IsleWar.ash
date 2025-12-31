# This script is designed to win the war exactly how I like it.
# Hippies win overall with the farm, orchard, and arena.
# frats get the junkyard, lighthouse, and nunnery.
# The actual warfare part of the script takes 233 adventures, sidequests take a variable amount of time.

void main (int adv_to_spend) {
    # Control variables to figure out what part of the quest you're on.
    boolean haveHippyOutfit = false;
    boolean haveFratOutfit = false;

    string warStatus = get_property("questL12War");
    int deadFrats = to_int(get_property("fratboysDefeated"));
    int deadHippies = to_int(get_property("hippiesDefeated"));
    boolean junkyardDone = false;
    boolean lighthouseDone = false;
    boolean nunsDone = false;
    boolean farmDone = false;
    boolean orchardDone = false;
    boolean arenaDone = false;
    if (get_property("sidequestJunkyardCompleted") != "none") {
        junkyardDone = true;
    }
    if (get_property("sidequestLighthouseCompleted") != "none") {
        lighthouseDone = true;
    }
    if (get_property("sidequestNunsCompleted") != "none") {
        nunsDone = true;
    }
    if (get_property("sidequestFarmCompleted") != "none") {
        farmDone = true;
    }
    if (get_property("sidequestOrchardCompleted") != "none") {
        orchardDone = true;
    }
    if (get_property("sidequestArenaCompleted") != "none") {
        arenaDone = true;
    }

    # Step 1: start the war
    if (warStatus == "finished") {
        abort("The war is over, go home.");
    } else if (warStatus == "unstarted") {
        abort("Visit the council to start the quest");
        # TODO: include a check for character level 
    } else if (warStatus == "started") {
        # TODO: progression to get the outfit and start the war
    }

    # Step 2: frats do junkyard

    if (junkyardDone == false) {

    }

    # Step 3: frats do lighthouse

    if (lighthouseDone == false) {

    }

    # Step 4: frats unlock nunnery

    while (deadHippies < 192) {
        #Adventure on battlefield as frats
        deadHippies = to_int(get_property("hippiesDefeated"));
    }

    # Step 5: frats do nunnery

    if (nunsDone == false) {
        
    }

    # Step 6: hippies do orchard

    if (orchardDone == false) {

    }

    # Step 7: hippes do farm

    if (farmDone == false) {

    }

    # Step 8: hippies unlock arena

    while (deadFrats < 458) {
        #Adventure on the battlefield as hippies
        deadFrats = to_int(get_property("fratboysDefeated"));
    }

    # Step 9: hippies do arena

    if (arenaDone == false) {

    }

    # Step 10: hippies clear the battlefield

    while (deadFrats < 1000) {
        #Adventure on the battlefield as hippies
        deadFrats = to_int(get_property("fratboysDefeated"));
    }

    # Step 11: sell/trade gear

    # Step 12: fight the man
}