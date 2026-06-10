void main () {
    skill[int] skill_list;
    boolean skill_check = false;
    int skill_counter = 0;
    skill_list[0] = $skill[Inappropriate Backrub];
    skill_list[1] = $skill[Chronic Indigestion];
    skill_list[2] = $skill[Snowclone];
    # TODO even when I do have spooky breath it says I don't. Why?
    skill_list[3] = $skill[Spooky Breath];
    skill_list[4] = $skill[Tango of Terror];
    skill_list[5] = $skill[Stream of Sauce];
    skill_list[6] = $skill[Sing];
    skill_list[7] = $skill[Disco Dance of Doom];
    skill_list[8] = $skill[Ravioli Shurikens];
    skill_list[9] = $skill[Spectral Snapper];
    skill_list[10] = $skill[Harpoon!];

    print("Skills:");
    foreach skill_name in skill_list {
        if (have_skill(skill_list[skill_name])){
            print("Have "+ skill_list[skill_name], "blue");
            skill_counter = skill_counter + 1;
        } else {
            print("Don't have "+ skill_list[skill_name], "red");
        }
    }
    print();
    if (skill_counter == 11) {
        skill_check = true;
    }

    item[int] item_list;
    boolean item_check = false;
    int item_counter = 0;
    item_list[0] = $item[poltergeist-in-the-jar-o];
    item_list[1] = $item[brick of sand];
    item_list[2] = $item[sparking El Vibrato drone];
    item_list[3] = $item[blue plastic oyster egg];
    item_list[4] = $item[hot clusterbomb];
    item_list[5] = $item[tequila grenade];
    item_list[6] = $item[sharpened hubcap];
    item_list[7] = $item[fetid feather];
    item_list[8] = $item[onion shurikens];
    item_list[9] = $item[stone frisbee];

    print("Combat items:");
    foreach item_name in item_list {
        if (available_amount(item_list[item_name]) > 0){
            print("Have "+ item_amount(item_list[item_name]) + " " + item_list[item_name], "blue");
            item_counter = item_counter + 1;
        } else {
            print("Don't have "+ item_list[item_name], "red");
        }
    }
    print();
    if(item_counter == 10) {
        item_check = true;
    }

    item[int] equipment_list;
    boolean equipment_check = false;
    int equip_counter = 0;
    equipment_list[0] = $item[clown wig];
    equipment_list[1] = $item[spork];
    equipment_list[2] = $item[plush hamsterpus];
    equipment_list[3] = $item[giant gym membership card];
    equipment_list[4] = $item[white snakeskin duster];
    equipment_list[5] = $item[leotarrrd];
    equipment_list[6] = $item[Choker of the Ultragoth];
    equipment_list[7] = $item[oven mitts];
    equipment_list[8] = $item[Dreadsylvania Auditor's badge];

    print("Equipment:");
    foreach equip_name in equipment_list {
        if (available_amount(equipment_list[equip_name]) > 0){
            print("Have "+ equipment_list[equip_name], "blue");
            equip_counter = equip_counter + 1;
        } else {
            print("Don't have "+ equipment_list[equip_name], "red");
        }
    }
    print();
    if(equip_counter == 9) {
        equipment_check = true;
    }

    if(skill_check && item_check && equipment_check) {
        print("You are ready to fight the Mayor Ghost on hard mode", "blue");
        equip($item[clown wig]);
        equip($item[spork]);
        equip($item[plush hamsterpus]);
        equip($item[giant gym membership card]);
        equip($item[white snakeskin duster]);
        equip($item[leotarrrd]);
        equip($slot[acc1], $item[Choker of the Ultragoth]);
        equip($slot[acc2], $item[oven mitts]);
        equip($slot[acc3], $item[Dreadsylvania Auditor's badge]);
        if(item_amount($item[photo booth supply list]) > 0) {
            print("Oh hey, you have a supply list too. I bet you want that instead right?");
            equip($item[photo booth supply list]);
        }
    } else {
        print("Requirements missing.", "red");
    }
}