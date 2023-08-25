#Things I want to do when logging out

#Overdrink maybe
#pick from garden if "ripe"

void main () {
	cli_execute("try; use 1 circle drum");
	if (item_amount($item[fishy pipe]) > 0){
		cli_execute("try; use 1 fishy pipe");
	}
	cli_execute("try; use 1 red and green rain stick");
	cli_execute("try; use 1 portable steam unit");
	if (have_skill($skill[Summon Carrot])) {
		use_skill(1, $skill[Summon Carrot]);
	}
	use_skill(3, $skill[Feel Disappointed]);
	use_skill(3, $skill[Feel Excitement]);
	use_skill(3, $skill[Feel Lonely]);
	use_skill(3, $skill[Feel Nervous]);
	use_skill(3, $skill[Feel Peaceful]);
	cli_execute("try; numberology 69");

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
		games_played = get_property("_poolGames");
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

	if (have_skill($skill[Summon Dice])) {
		print("Now summoning dice... repeatedly", "blue");

		int rests_used=get_property("timesRested").to_int();
		int rests_left=total_free_rests()-rests_used;
		int visits_left = 3 - get_property("nunsVisits").to_int();
		boolean shower = to_boolean(get_property("_aprilShower"));
		#summon dice, while also using mp restores
		while(my_mp() >= mp_cost($skill[Summon Dice]) || rests_left > 0 || visits_left > 0 || !shower) {
			while(my_mp() >= mp_cost($skill[Summon Dice])) {
				use_skill(1, $skill[Summon Dice]);
			}
			while(my_mp() < mp_cost($skill[Summon Dice]) && (rests_left > 0 || visits_left > 0 || !shower)) {
				use(1, $item[eternal car battery]);
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
			} 
		}
	}
	#end by maximizing adventures
	cli_execute("maximize adv");
}