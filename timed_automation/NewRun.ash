void use_item(item thing) {
    if (item_amount(thing) >= 1) {
        use(thing);
    }
}

void main () {
    # Visit toot oriole
    # open letter from King Ralph XI
    use_item($item[letter from King Ralph XI]);
    # open pork elf goodies sack
    use_item($item[pork elf goodies sack]);
    # Pretentious artist quest
    # gourd quest
    # guild quest
    # unlock
        # skeleton store
        # madness bakery
        # overgrown lot
    # Visit the sot
    # open astral item
    use_item($item[astral hot dog dinner]);
    use_item($item[astral six-pack]);
    use_item($item[[10882]carton of astral energy drinks]);
    use_item($item[cold medicine cabinet]);
    # equip items of the month
    # if softcore
        # buy and pull clockwork maid

    # if casual
    if(my_path() == $path[none]) {
        # Turn on backup camera reverser so text is forward.
        cli_execute("backupcamera reverse on");
    }
}

