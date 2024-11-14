void main () {
    # Visit toot oriole
    # open letter from King Ralph XI
    use($item[letter from King Ralph XI]);
    # open pork elf goodies sack
    use($item[pork elf goodies sack]);
    # Pretentious artist quest
    # gourd quest
    # guild quest
    # unlock
        # skeleton store
        # madness bakery
        # overgrown lot
    # Visit the sot
    # open astral item
    if (item_amount($item[astral hot dog dinner]) >= 1) {
        use($item[astral hot dog dinner])
    } else if (item_amount($item[astral six-pack]) >= 1) {
        use($item[astral six-pack])
    } else if (item_amount($item[carton of astral energy drinks]) >= 1) {
        use($item[carton of astral energy drinks])
    }
    # equip starting gear
    # equip items of the month
    # if softcore
        # buy and pull clockwork maid
}