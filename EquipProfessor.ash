void main () {
    # Equip headpiece
    if (available_amount($item[triphasic molecular oculus]) >= 1) {
        equip($item[triphasic molecular oculus]);
        print("Equipped triphasic oculus");
    } else if (available_amount($item[biphasic molecular oculus]) >= 1) {
        equip($item[biphasic molecular oculus]);
        print("Equipped biphasic oculus");
    } else {
        print("No oculus available");
    }
    # Equip pants
    if (available_amount($item[irresponsible-tension exoskeleton]) >= 1) {
        equip($item[irresponsible-tension exoskeleton]);
        print("Equipped irresponsible exoskeleton");
    } else if (available_amount($item[ultra-high-tension exoskeleton]) >= 1) {
        equip($item[ultra-high-tension exoskeleton]);
        print("Equipped ultra-high-tension exoskeleton");
    } else if (available_amount($item[high-tension exoskeleton]) >= 1) {
        equip($item[high-tension exoskeleton]);
        print("Equipped high-tension exoskeleton");
    } else {
        print("No exoskeleton available");
    }

    # Equip gun
    if (available_amount($item[focused magnetron pistol]) >= 1) {
        equip($item[focused magnetron pistol]);
        print("Equipped pistol");
    } else {
        print("No pistol available");
    }  
    # Equip belt
    if (available_amount($item[quick-release utility belt]) >= 1) {
        equip($slot[acc2], $item[quick-release utility belt]);
        print("Equipped utility belt");
    } else if (available_amount($item[quick-release fannypack]) >= 1) {
        equip($slot[acc2], $item[quick-release fannypack]);
        print("Equipped fannypack");
    } else if (available_amount($item[quick-release belt pouch]) >= 1) {
        equip($slot[acc2], $item[quick-release belt pouch]);
        print("Equipped belt pouch");
    } else {
        print("No quick-release available");
    }

    # Equip motion sensor
    if (available_amount($item[motion sensor]) >= 1) {
        equip($slot[acc3], $item[motion sensor]);
        print("Equipped motion sensor");
    } else {
        print("No motion sensor available");
    }  

    print("Available smashed equipment: " + available_amount($item[smashed scientific equipment]));
}