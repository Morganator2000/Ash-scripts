void main () {
    skill[int] skill_list;
    skill_list[0] = $skill[Inappropriate Backrub];
    skill_list[1] = $skill[Chronic Indigestion];
    skill_list[2] = $skill[Snowclone];
    skill_list[3] = $skill[Spooky Breath];
    skill_list[4] = $skill[Tango of Terror];
    skill_list[5] = $skill[Stream of Sauce];
    skill_list[6] = $skill[Sing];
    skill_list[7] = $skill[Disco Dance of Doom];
    skill_list[8] = $skill[Ravioli Shurikens];
    skill_list[9] = $skill[Spectral Snapper];
    skill_list[10] = $skill[Harpoon!];
    foreach skill_name in skill_list {
        if (have_skill(skill_list[skill_name])){
            print("Have "+ skill_list[skill_name], "blue");
        } else {
            print("Don't have "+ skill_list[skill_name], "red");
        }
    }
}