#Things I want to do when logging out

# TODO: mayam calendar
# TODO: Nash Crosby's still
# TODO: change all of these to be contitionals to improve execution time.

void use_item(item thing) {
    if (item_amount(thing) >= 1) {
        use(thing);
    }
}

void main () {
	# Waiting a few seconds in case I want to cancel the logout script.
	wait(3);
	
	# Get Mr. Store 2002 Items
	if(item_amount($item[2002 Mr. Store Catalog]) > 0){
		cli_execute("try; run 2002MrStore");
	}

	# get effects for the start of the next day
	use_item($item[circle drum]);
	use_item($item[defective Game Grid token]);
	use_item($item[fishy pipe]);
	# cli_execute("try; use 1 red and green rain stick");
	use_item($item[portable steam unit]);
	if (have_skill($skill[Emotionally Chipped])) {
		# Maybe one day Feel Disappointed will do something.
		use_skill(3, $skill[Feel Disappointed]);
		use_skill(3, $skill[Feel Excitement]);
		use_skill(3, $skill[Feel Lonely]);
		use_skill(3, $skill[Feel Nervous]);
		use_skill(3, $skill[Feel Peaceful]);
	}

	visit_url("place.php?whichplace=monorail&action=monorail_lyle");
	cli_execute("try; telescope high"); 
	if(friars_available() && get_property("friarsBlessingReceived")!="true"){
		cli_execute("friars familiar");
   	}
	cli_execute("swim sprints");
	cli_execute("ballpit");
	#play pool
	if (get_property("_poolGames") != 3){
		cli_execute("maximize pool skill");
		int games_played = to_int(get_property("_poolGames"));
		while (games_played <3) {
			cli_execute("pool 3");
			++games_played;
		}
	}
	cli_execute("try; teatree shake"); 
	cli_execute("try; hatter All-Hallow's Steve's fright wig"); 
	cli_execute("try; fortune buff item"); 
	cli_execute("try; concert d");
	cli_execute("try; concert w");

	if (in_bad_moon()) {
		cli_execute("try; styx moxie");
	}

	#go underwater
	if (item_amount($item[old SCUBA tank]) > 0 && item_amount($item[das boot]) > 0) {
		print("Going underwater", "blue");
		equip($item[old SCUBA tank]);
		equip($item[das boot]);
		cli_execute("try; mom stats");
		cli_execute("try; skate band shell");
		cli_execute("try; skate merry-go-round");
		cli_execute("try; skate eels");
	}

	# clan photo booth effects. Get the mox one first, then mainstat
	cli_execute("try; photobooth effect wild");
	switch(my_primestat()) {
		case $stat[Muscle]:
			cli_execute("try; photobooth effect tower");
			cli_execute("try; photobooth effect tower");
			break;
		case $stat[Mysticality]:
			cli_execute("try; photobooth effect space");
			cli_execute("try; photobooth effect space");
			break;
		case $stat[Moxie]:
			cli_execute("try; photobooth effect wild");
			cli_execute("try; photobooth effect wild");
			break;
	}

	# Activate campground monolith
	visit_url("campground.php?action=monolith");

	# Dreadsylvania flasks
	if(item_amount($item[brass Dreadsylvanian flask]) > 0) {
		use(1, $item[brass Dreadsylvanian flask]);
	}
	if(item_amount($item[silver Dreadsylvanian flask]) > 0) {
		use(1, $item[silver Dreadsylvanian flask]);
	}

	if (have_skill($skill[Summon Carrot])) {
		use_skill(1, $skill[Summon Carrot]);
	}

	# Numberology. I only have three uses for now.
	cli_execute("try; numberology 69");
	cli_execute("try; numberology 69");
	cli_execute("try; numberology 69");

	# Use Archaeologist's Spade
	if(item_amount($item[Archaeologist's Spade]) == 1) {
		if (get_property("_archSpadeDigs").to_int() < 11) {
			visit_url("inv_use.php?pwd&which=3&whichitem=12184&ajax=1&_=1775257750848");
			while ( get_property("_archSpadeDigs").to_int() < 11 ) {
				visit_url("choice.php?pwd&whichchoice=1596&option=2");
			}
		visit_url("choice.php?pwd&whichchoice=1596&option=4");
		}
	}
	# TODO after using spade, use the once-per day items

	# Use Prismatic beret busking
	if(item_amount($item[Prismatic Beret]) > 0){
		equip($item[Prismatic Beret]);
		cli_execute("try; cast * Beret Busking");
	}

	# Use Hearthstone skills
	if(item_amount($item[Heartstone]) > 0){
		equip($item[Heartstone]);
		cli_execute("try; cast * Heartstone: %pals");
		cli_execute("try; cast * Heartstone: %buff");
		cli_execute("try; cast * Heartstone: %luck");
	}

	# Use remaining Cursed Monkey Paw wishes
	if (item_amount($item[cursed monkey's paw]) > 0) {
		void use_remaining_monkey_wishes() {
			int wishes_left = 5 - get_property("_monkeyPawWishesUsed").to_int();
			if (wishes_left <= 0) {
				print("No Cursed Monkey Paw wishes remaining today.", "blue");
				return;
			}
			if (gnomads_available() && wishes_left > 1) {
				monkey_paw($item[flange]);
				wishes_left -= 1;
			}
			if (gnomads_available() && wishes_left > 1) {
				monkey_paw($item[clockwork key]);
				wishes_left -= 1;
			}
			if (wishes_left <= 0) {
				print("No Cursed Monkey Paw wishes remaining today.", "blue");
				return;
			}
			
			# Create a wishlist that orders the priority of wishes.
			effect [int] wish_list;
			int i = 0;

			wish_list[i] = $effect[Always be Collecting]; i += 1;
			wish_list[i] = $effect[Disquiet Riot]; i += 1;

			# Add mainstat-specific buff
			switch(my_primestat()) {
				case $stat[Muscle]:
					wish_list[i] = $effect[HGH-charged]; i += 1;
					break;
				case $stat[Mysticality]:
					wish_list[i] = $effect[Different Way of Seeing Things]; i += 1;
					break;
				case $stat[Moxie]: 
					wish_list[i] = $effect[Thou Shant Not Sing]; i += 1;
					break;
			}

			wish_list[i] = $effect[Low on the Hog]; i += 1;
			wish_list[i] = $effect[New and Improved]; i += 1;

			# Iterate through priority list ONLY while there are wishes remaining
			foreach idx, buff in wish_list {
				if (get_property("_monkeyPawWishesUsed").to_int() >= 5) {
					print("Used all 5 Cursed Monkey Paw wishes for today!", "red");
					break;
				}

				# Skip effect if we already have it active
				if (have_effect(buff) > 0) {
					continue;
				}
				monkey_paw(buff);
			}
		}
	}

	use_remaining_monkey_wishes();

	# Foresee peril in your clanmates
	cli_execute("try; run foresee_peril");

	# Use the clan fortune teller on clanmates.
	cli_execute("try; run FortuenTeller");

	# Use hot tub to restore hp if possible.
	cli_execute("try; hottub");

	# TODO there is absolutely a better way to restore MP here.
	if (have_skill($skill[Summon Dice])) {
		print("Now summoning dice... repeatedly", "blue");

		int rests_used=get_property("timesRested").to_int();
		int rests_left=total_free_rests()-rests_used;
		int visits_left = 3 - get_property("nunsVisits").to_int();
		boolean shower = to_boolean(get_property("_aprilShower"));
		boolean battery = false;
		#summon dice, while also using mp restores
		while(my_mp() >= mp_cost($skill[Summon Dice]) || rests_left > 0 || visits_left > 0 || !shower) {
			while(my_mp() >= mp_cost($skill[Summon Dice])) {
				use_skill(1, $skill[Summon Dice]);
			}
			while(my_mp() < mp_cost($skill[Summon Dice]) && (rests_left > 0 || visits_left > 0 || !shower)) {
				cli_execute("try; use 1 eternal car battery");
				while(my_mp() < mp_cost($skill[Summon Dice]) && rests_left > 0) {
					cli_execute("rest");
					--rests_left;
				}
				while(my_mp() < mp_cost($skill[Summon Dice]) && visits_left > 0) {
					cli_execute("try; nuns mp");
					--visits_left;
				}
				while(my_mp() < mp_cost($skill[Summon Dice]) && !shower ){
					cli_execute("shower hot");
					shower = true;
				}
				while(my_mp() < mp_cost($skill[Summon Dice]) && !battery ){
					cli_execute("try; use 1 yam battery");
					battery = true;
				}
			} 
		}
	}
	#end by maximizing adventures
	if (hippy_stone_broken()) {
		cli_execute("maximize adv, pvp fights");
	} else {
		cli_execute("maximize adv");
	}
	
	# For some reason the maximizer always defaults to the Green LavaCo lamp, regarless of mainstat.
	# TODO not future proof. Remove if you get a better +adv offhand
	if (!hippy_stone_broken()) {
		if(is_unrestricted($item[red LavaCo Lamp&trade;])) {
			switch(my_primestat()) {
				case $stat[Muscle]:
					equip($item[Red LavaCo Lamp&trade;]);
					break;
				case $stat[Mysticality]:
					equip($item[Blue LavaCo Lamp&trade;]);
					break;
				case $stat[Moxie]:
					equip($item[Green LavaCo Lamp&trade;]);
					break;
				default:
					print("Hey wait, how do you not have a mainstat?", "orange");
					break;
			}
		}
	}
	
}