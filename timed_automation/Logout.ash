#Things I want to do when logging out

# TODO: mayam calendar
# TODO: Nash Crosby's still

void main () {
	# Waiting a few seconds in case I want to cancel the logout script.
	wait(3);
	# TODO put mr. store 2002 effects here
	cli_execute("try; run 2002MrStore");

	# get effects for the start of the next day
	cli_execute("try; use 1 circle drum");
	if (item_amount($item[fishy pipe]) > 0){
		cli_execute("try; use 1 fishy pipe");
	}
	# cli_execute("try; use 1 red and green rain stick");
	cli_execute("try; use 1 portable steam unit");
	if (have_skill($skill[Summon Carrot])) {
		use_skill(1, $skill[Summon Carrot]);
	}
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
	cli_execute("try; teatree royaltea"); 
	cli_execute("try; hatter All-Hallow's Steve's fright wig"); 
	cli_execute("try; fortune buff item"); 
	cli_execute("try; concert d");
	cli_execute("try; concert w");

	if (in_bad_moon()) {
		cli_execute("try; styx moxie");
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

	# Numberology. I only have three uses for now.
	cli_execute("try; numberology 69");
	cli_execute("try; numberology 69");
	cli_execute("try; numberology 69");

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
	cli_execute("try; monkeypaw effect Always be Collecting");
	cli_execute("try; monkeypaw effect Disquiet Riot");
	switch(my_primestat())  {
		case $stat[Muscle]:
			cli_execute("try; monkeypaw effect HGH-charged");
			break;
		case $stat[Mysticality]:
			cli_execute("try; monkeypaw effect Different Way of Seeing Things");
			break;
		case $stat[Moxie]: 
			cli_execute("try; monkeypaw effect Thou Shant Not Sing");
			break;
	}
	cli_execute("try; monkeypaw effect Low on the Hog");
	cli_execute("try; monkeypaw effect New and Improved");

	// if(gnomads_available() && get_property("_monkeyPawWishesUsed") > 1) {
	// 	monkey_paw($item[flange]);
	// 	monkey_paw($item[clockwork key]);
	// }

	# Foresee peril in your clanmates
	cli_execute("try; run foresee_peril");

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
	# switch to extra adventures familiar
	equip($familiar[quantum entangler], $item[quantum watch]);
	# For some reason the maximizer always defaults to the Green LavaCo lamp, regarless of mainstat.
	# TODO not future proof. Remove if you get a better +adv offhand
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