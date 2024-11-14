void main () {
    if (available_amount($item[Lynyrdskin Cap]) < 1) {
        take_storage($item[Lynyrdskin Cap], 1);
    }
    if (available_amount($item[Lynyrdskin Tunic]) < 1) {
        take_storage($item[Lynyrdskin Tunic], 1);
    }
    if (available_amount($item[Lynyrdskin Breeches]) < 1) {
        take_storage($item[Lynyrdskin Breeches], 1);
    }
    if (available_amount($item[Lynyrd Musk]) < 1 && have_effect($effect[Musky]) == 0) {
        take_storage($item[Lynyrd Musk], 1);
    } else if (have_effect($effect[Musky]) == 0) {
        use($item[Lynyrd Musk]);
    }
    
    equip($item[Lynyrdskin Cap]);
    equip($item[Lynyrdskin Tunic]);
    equip($item[Lynyrdskin Breeches]);
}