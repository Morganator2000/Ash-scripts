void print_item(string it) {
    item thing = to_item(it);
    print(thing + ": " + available_amount(thing));
}

void main () {
    cli_execute("clear");
    print("Setup items:", "blue");

    if(get_campground() contains $item[El Vibrato trapezoid]) {
        print("You have a portal set up.");
    } else {
        print_item("El Vibrato trapezoid");
    }
    print_item("El Vibrato power sphere");
    print_item("overcharged El Vibrato power sphere");
    print();
    print();


    print("Punch cards:", "blue");
    print("ATTACK: " + available_amount($item[El Vibrato punchcard ATTACK]));
    print("BUFF: " + available_amount($item[El Vibrato punchcard BUFF]));
    print("BUILD: " + available_amount($item[El Vibrato punchcard BUILD]));
    print("MODIFY: " + available_amount($item[El Vibrato punchcard MODIFY]));
    print("REPAIR: " + available_amount($item[El Vibrato punchcard REPAIR]));
    print();
    print("DRONE: " + available_amount($item[El Vibrato punchcard DRONE]));
    print("FLOOR: " + available_amount($item[El Vibrato punchcard FLOOR]));
    print("SELF: " + available_amount($item[El Vibrato punchcard SELF]));
    print("SPHERE: " + available_amount($item[El Vibrato punchcard SPHERE]));
    print("TARGET: " + available_amount($item[El Vibrato punchcard TARGET]));
    print("WALL: " + available_amount($item[El Vibrato punchcard WALL]));
    print();
    print();


    print("Drones:", "blue");
    print_item("El Vibrato drone");
    print("BUILD DRONE against a towering construct","orange");
    print();
    print_item("sparking El Vibrato drone");
    print("Insert ATTACK card","orange");
    print();
    print_item("humming El Vibrato drone");
    print("Insert BUFF card","orange");
    print();
    print_item("glowing El Vibrato drone");
    print("Insert BUILD card","orange");
    print();
    print_item("El Vibrato translator");
    print("Insert Modify Card","orange");
    print();
    print_item("warm El Vibrato drone");
    print("Insert REPAIR card","orange");
    print();
    print();


    print("Megadrone parts:", "blue");
    print_item("broken El Vibrato drone");
    print("MODIFY DRONE against a towering construct","orange");
    print();
    print_item("repaired El Vibrato drone");
    print("REPAIR DRONE against a lonely construct","orange");
    print();
    print_item("augmented El Vibrato drone");
    print("BUFF DRONE against a bizzare construct","orange");
    print();
    print_item("El Vibrato Megadrone");
    print("Use augmented while you have an overcharged sphere.","orange");
    print();
    if(have_familiar($familiar[El Vibrato Megadrone])) {
        print("You have the Megadrone familiar!", "green");
    print();
    } else {
        print("Missing Megadrone familiar", "red");
    }
    print();
    print();

    print("Outfit:", "blue");
    print_item("El Vibrato helmet");
    print("MODIFY SPHERE against a towering construct while you have a power sphere", "orange");
    print();
    print_item("El Vibrato energy spear");
    print("MODIFY SPHERE against a towering construct while you have a power sphere and the helmet", "orange");
    print();
    print_item("El Vibrato leg guards");
    print("MODIFY SPHERE against a towering construct while you have a power sphere, the helmet, and the sphere", "orange");
}
