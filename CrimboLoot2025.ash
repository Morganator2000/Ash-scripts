void main() {
    cli_execute("clear");
    print("Things to give Sammy before Crimbo ends", "red");
    print("Burnt incisor: " + available_amount($item[Burnt incisor]));
    print("Burnt phalange: " + available_amount($item[Burnt phalange]));
    print("Burnt radius: " + available_amount($item[Burnt radius]));
    print("Burnt rib: " + available_amount($item[Burnt rib]));
    print("Burnt skull: " + available_amount($item[burnt skull]));
    print("Smoldering bone dust: " + available_amount($item[Smoldering bone dust]));
    print();

    print("Smoldering Bone Spikes", "blue");
    print("Boiling bone marrow: " + available_amount($item[boiling bone marrow]));
    print("Boiling cerebrospinal fluid: " + available_amount($item[boiling cerebrospinal fluid]));
    print("Boiling synovial fluid: " + available_amount($item[boiling synovial fluid]));
    print("Smoldering vertebra: " + available_amount($item[Smoldering vertebra]));
    print();

    print("Smoldering Fingerbones", "blue");
    print("Burnt bone belt: " + available_amount($item[Burnt bone belt]));
    print("Flaming fistbone: " + available_amount($item[flaming fistbone]));
    print("Hot boning knife: " + available_amount($item[Hot boning knife]));
    print();

    print("Smoldering Pelvis", "blue");
    print("wing bone: " + available_amount($item[wing bone]));
    print("baked bone meal: " + available_amount($item[baked bone meal]));
    print("bone meal: " + available_amount($item[bone meal]));
    print("weak skeleton venom: " + available_amount($item[weak skeleton venom]));
    print();

    
}