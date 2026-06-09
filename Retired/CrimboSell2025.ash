void main () {
    print("Selling items...", "purple");
    cli_execute("Mallsell -10 " + $item[wing bone]);
    cli_execute("Mallsell -10 " + $item[weak skeleton venom]);
    cli_execute("Mallsell -10 " + $item[baked bone meal]);
    cli_execute("Mallsell -5 " + $item[Boiling bone marrow]);
    cli_execute("Mallsell -5 " + $item[Boiling cerebrospinal fluid]);
    cli_execute("Mallsell -5 " + $item[Boiling synovial fluid]);
    cli_execute("Mallsell * " + $item[Volatile Bone Bomb]);
    cli_execute("Mallsell -1 " + $item[bone meal]);
    cli_execute("undercut");
}